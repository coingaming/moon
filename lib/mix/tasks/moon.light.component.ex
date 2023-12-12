defmodule Mix.Tasks.Moon.Light.Component do
  @shortdoc "Converts surface component to phoenix_live_view"

  @moduledoc """
  Generates a component and a compoinent page by component module name given

      $ mix moon.light.component Form.MyModule

  """

  use Mix.Task
  import Mix.Generator
  import Moon.Helpers.Ast

  import String, only: [replace: 3, downcase: 1, split: 2]
  import List, only: [last: 1]
  import Moon.Helpers.Tokens

  require Logger

  alias Surface.Compiler.Parser

  defstruct name: nil

  @doc false
  def run([name]) do
    name
    |> to_module()
    |> context()
    |> copy_templates()
    |> print_shell_instructions()
  end

  defp to_module(name, pathes \\ ~w(Design Moon)) do
    Module.safe_concat([name | pathes] |> Enum.reverse())
  rescue
    ArgumentError ->
      to_module(name, tl(pathes))
  end

  defp context(module) do
    %{
      module: module,
      short: module |> to_string() |> split(".") |> last(),
      component_type: module.component_type(),
      level: 0,
      config: %{
        use_translates: fn
          [:Moon, :StatelessComponent] -> [:Moon, :Light, :Component]
          [:Moon, :StatefulComponent] -> [:Moon, :Light, :LiveComponent]
          other -> other
        end,
        defmodule_translates: fn
          [:Moon, :Design | others] -> [:Moon, :Light | others]
          [:MoonWeb, :Examples, :Design | others] -> [:MoonWeb, :Examples, :Light | others]
        end,
        module_translates: fn mod ->
          [
            :"Elixir"
            | mod
              |> to_string()
              |> String.replace("Elixir.", "")
              |> String.split(".")
              |> Enum.map(&String.to_atom/1)
              |> (fn
                    [:Moon, :Design | others] ->
                      [:Moon, :Light | others]

                    [:MoonWeb, :Examples, :Design | others] ->
                      [:MoonWeb, :Examples, :Light | others]

                    other ->
                      other
                  end).()
          ]
          |> Enum.join(".")
          |> String.to_atom()
        end
      }
    }
  end

  defp translate_ast(c = %{module: module}) do
    ast = module |> module_ast()

    {_, aliases} =
      ast
      |> Macro.prewalk([], fn
        result = {:alias, _, [{:__aliases__, _, a} | _]}, acc ->
          {result, acc ++ [a]}

        result = {:alias, _, [{{:., _, [{:__aliases__, _, root_part}, :{}]}, _, children}]},
        acc ->
          {result,
           acc ++
             (children |> Enum.map(fn {:__aliases__, _, sub_part} -> root_part ++ sub_part end))}

        other, acc ->
          {other, acc}
      end)

    c =
      Map.put(
        c,
        :aliases,
        aliases
        |> Enum.reduce(%{}, fn items, acc ->
          Map.put(
            acc,
            Enum.at(items, -1) |> to_string(),
            [:"Elixir" | items] |> Enum.map_join(".", &to_string/1) |> String.to_atom()
          )
        end)
      )

    ast
    |> Macro.prewalk(nil, fn
      result = {:def, _, [{:render, _, _} | _]}, acc ->
        {translate_render(c, result), acc}

      result = {:sigil_F, _, _}, acc ->
        {translate_sigil(c, result), acc}

      result = {:prop, _meta, _options}, acc ->
        {translate_prop(c, result, acc), nil}

      result = {:data, _meta, _options}, acc ->
        {translate_prop(c, result, acc), nil}

      result = {:slot, _meta, _options}, acc ->
        {translate_slot(c, result, acc), nil}

      result = {:@, _, [{:moduledoc, _, [_text]}]}, acc ->
        {translate_moduledoc(c, result), acc}

      result = {:@, _, [{:doc, _, [_text]}]}, _acc ->
        {:skip, translate_doc(c, result)}

      result = {:use, _, [{:__aliases__, _, _alias} | _]}, acc ->
        {translate_use_defmodule(c, result), acc}

      result = {:defmodule, _, [{:__aliases__, _, _alias} | _]}, acc ->
        {translate_use_defmodule(c, result), acc}

      other, acc ->
        {other, acc}
    end)
    |> Tuple.to_list()
    |> hd()
  end

  defp merge_ast(
         {:defmodule, m1,
          [
            aliases,
            [
              do: {:__block__, [], children}
            ]
          ]},
         {:defmodule, _,
          [
            _aliases,
            [
              do: {:__block__, [], children2}
            ]
          ]}
       ) do
    {:defmodule, m1,
     [
       aliases,
       [
         do:
           {:__block__, [],
            (children ++ children2)
            |> Enum.sort_by(fn
              {:@, _, [{:moduledoc, _, _}]} -> 0
              {:use, _, _} -> 1
              {:alias, _, _} -> 2
              {:import, _, _} -> 3
              {:require, _, _} -> 4
              _ -> 100
            end)}
       ]
     ]}
  end

  defp translate_render(%{component_type: Surface.LiveComponent}, ast), do: ast

  defp translate_render(
         %{component_type: Surface.Component, short: short},
         {:def, m1, [{:render, m2, attrs} | children]}
       ) do
    {:def, m1, [{:"#{String.downcase(short)}", m2, attrs} | children]}
  end

  defp translate_prop(_, {:prop, meta, [{name, _, nil}, :event]}, doc),
    do: {:attr, meta, [name, Event, translate_prop_options([], doc)]}

  # translate {:prop, [line: 21], [{:step, [line: 21], nil}, :integer, [default: 1]]}
  # to {:attr, [line: 38], [:id, :string, [required: true]]}
  defp translate_prop(_, {macro_name, meta, [{name, _, nil}, type]}, doc)
       when macro_name in [:prop, :data],
       do: {:attr, meta, [name, translate_prop_type(type), translate_prop_options([], doc)]}

  defp translate_prop(_, {macro_name, meta, [{name, _, nil}, type, options]}, doc)
       when macro_name in [:prop, :data],
       do:
         {:attr, meta,
          [
            name,
            translate_prop_type(type),
            translate_prop_options(options, doc)
          ]}

  defp translate_prop_type(type)
       when type in [:boolean, :integer, :float, :string, :atom, :list, :map, :global],
       do: type

  defp translate_prop_type(_), do: :any

  defp translate_prop_options(options, doc) do
    (options
     |> Enum.map(fn
       {:values!, v} -> {:values, v}
       {k, v} when k in [:required, :default, :values, :examples] -> {k, v}
     end)) ++
      ((doc && [doc: doc]) || []) ++
      (((Keyword.has_key?(options, :default) || Keyword.has_key?(options, :required)) && []) ||
         [default: nil])
  end

  defp translate_slot(_, {:slot, meta, [{:default, _, nil}]}, doc),
    do: {:slot, meta, [:inner_block, (doc && [doc: doc]) || []]}

  defp translate_slot(_, {:slot, meta, [{name, _, nil}]}, doc),
    do: {:slot, meta, [name, (doc && [doc: doc]) || []]}

  defp translate_slot(_, {:slot, meta, [{:default, _, nil}, options]}, doc),
    do: {:slot, meta, [:inner_block, options ++ ((doc && [doc: doc]) || [])]}

  defp translate_slot(_, {:slot, meta, [{name, _, nil}, options]}, doc),
    do: {:slot, meta, [name, options ++ ((doc && [doc: doc]) || [])]}

  defp translate_doc(_, _res = {:@, _, [{:doc, _, [text]}]}) do
    text
  end

  defp translate_moduledoc(%{component_type: Surface.LiveComponent}, res), do: res

  defp translate_moduledoc(
         %{component_type: Surface.Component},
         {:@, m1, [{:moduledoc, m2, [text]}]}
       ),
       do: (text && {:@, m1, [{:doc, m2, [dbg(text)]}]}) || :skip

  defp translate_use_defmodule(
         %{component_type: Surface.Component},
         {:use, _, _}
       ) do
    :skip
  end

  defp translate_use_defmodule(
         %{config: config},
         {type, m1, [{:__aliases__, m2, alias} | other]}
       )
       when type in [:use, :defmodule] do
    {type, m1, [{:__aliases__, m2, config[:"#{type}_translates"].(alias)} | other]}
  end

  defp translate_sigil(context, {:sigil_F, m1, [{:<<>>, meta, [string]}, opts]}) do
    # "copy of Surface.sigil_F macro & Surface.Compiler.compile"

    result =
      string
      |> Parser.parse!(
        # file: module.__info__(:compile)[:source] |> to_string(),
        # line: meta[:line] + if(Keyword.has_key?(meta, :indentation), do: 1, else: 0),
        # caller: %{module: module, function: :render},
        # checks: opts[:checks] || [],
        # warnings: opts[:warnings] || [],
        # column: Keyword.get(opts, :column, 1),
        # indentation: Keyword.get(opts, :indentation, 0)
      )
      |> prewalk(context, fn
        # :text, text, context ->
        #   {text, context}

        _node_type, node, context ->
          {translate_node(node, context), context}
      end)
      |> Tuple.to_list()
      |> hd()
      |> to_text()

    {:sigil_H, m1, [{:<<>>, meta, [result]}, opts]}
  end

  defp translate_node(text, _) when is_binary(text), do: text

  defp translate_node({:expr, expr, meta}, _), do: {:expr, expr, meta}

  # TODO: context_put & children
  defp translate_node(
         {"#slot", [{:root, {:attribute_expr, expr, _m2}, _m1} | attrs], _children, node_meta},
         _
       ) do
    str =
      [expr | attrs |> Enum.map(&translate_slot_attr/1) |> Enum.filter(&(!!&1))]
      |> Enum.join(", ")

    {:expr, "render_slot(#{str})", node_meta}
  end

  defp translate_node({"#slot", attrs, _children, node_meta}, _) do
    str =
      ["@inner_block" | attrs |> Enum.map(&translate_slot_attr/1) |> Enum.filter(&(!!&1))]
      |> Enum.join(", ")

    {:expr, "render_slot(#{str})", node_meta}
  end

  defp translate_node({type, attributes, children, node_meta}, c) do
    {res_type, source_type} = translate_type(type, c)

    {attributes, children} = pre_translate_node(source_type, {type, attributes, children}, c)

    {res_type,
     attributes
     |> List.wrap()
     |> Enum.map(&translate_attr(&1, source_type.__props__()))
     |> List.flatten(), children, node_meta}
  end

  defp translate_node(other, _), do: other

  defp pre_translate_node(Moon.Design.Table, {_, attributes, children}, c) do
    {attributes, m_name} =
      attributes
      |> Enum.map(fn
        {"items", {:attribute_expr, expr, m1}, m2} ->
          [model, models] = expr |> String.split("<-") |> Enum.map(&String.trim/1)
          {{"items", {:attribute_expr, models, m1}, m2}, model}

        other ->
          {other, nil}
      end)
      |> Enum.reduce({[], nil}, fn {node, model}, {nodes, cur_model} ->
        {nodes ++ [node], cur_model || model}
      end)

    {attributes,
     children
     |> Enum.map(fn
       {type2, attributes2, children2, meta} ->
         {_, source_type} = translate_type(type2, c)

         case source_type do
           Moon.Design.Table.Column -> {":cols :let={#{m_name}}", attributes2, children2, meta}
           _ -> {type2, attributes2, children2, meta}
         end

       other ->
         other
     end)}
  end

  defp pre_translate_node(_, {_, attributes, children}, _), do: {attributes, children}

  defp translate_slot_attr({"generator_value", {:attribute_expr, expr, _m2}, _m1}), do: expr

  defp translate_slot_attr(other) do
    Logger.warning("Unknown slot attribute:")
    dbg(other)
    nil
  end

  defp get_alias(alias_, aliases) do
    [key | other] = alias_ |> String.split(".")
    [aliases[key] | other] |> Enum.join(".") |> String.to_atom()
  end

  defp translate_type(type, c = %{aliases: aliases}) do
    cond do
      !String.match?(type, ~r/^[A-Z].*$/) ->
        {type, %{__props__: []}}

      type == "Icon" ->
        {".icon", Moon.Icon}

      # get_alias(type, aliases) == Moon.Design.Table.Column ->
      #   {":cols :let={model}", Moon.Design.Table.Column}

      get_alias(type, aliases) === nil ->
        Logger.warning("Unknown type: #{type}")
        {type, %{__props__: []}}

      function_exported?(get_alias(type, aliases), :__slot_name__, 0) ->
        # TODO: get subcompoent's render function
        Logger.warning(
          "Replacing #{get_alias(type, aliases)} with slot :#{get_alias(type, aliases).__slot_name__()}"
        )

        {":#{get_alias(type, aliases).__slot_name__()}", get_alias(type, aliases)}

      get_alias(type, aliases).component_type() == Surface.Component ->
        mod = get_alias(type, aliases) |> parent_module() |> c.config.module_translates.()

        {case Code.ensure_compiled(mod) do
           {:module, _} ->
             func_name =
               type |> String.split(".") |> Enum.at(-1) |> String.downcase() |> String.to_atom()

             if Keyword.has_key?(mod.__info__(:functions), func_name) do
               # TODO: add imports here
               "#{(mod in [c.config.module_translates.(c.module), Moon.Light] && "") || mod}.#{func_name}"
             else
               ".moon module={#{type}}"
             end

           {:error, _} ->
             ".moon module={#{type}}"
         end, get_alias(type, aliases)}

      get_alias(type, aliases).component_type() == Surface.LiveComponent ->
        mod = get_alias(type, aliases) |> c.config.module_translates.()

        {case Code.ensure_compiled(mod) do
           {:module, _} -> ".live_component module={#{mod}}"
           {:error, _} -> ".moon module={#{type}}"
         end, get_alias(type, aliases)}
    end
  end

  # defp translate_attr({name, expr, meta}), do: dbg({name, expr, meta})

  defp translate_attr({name, expr, meta}, node_props) when is_atom(name),
    do: translate_attr({"#{name}", expr, meta}, node_props)

  defp translate_attr({name, expr, meta}, _) when name in ~w(root :let :if :for),
    do: {name, expr, meta}

  defp translate_attr({":attrs", expr, meta}, _), do: {:root, expr, meta}

  # TODO: translate each to data-value attribute
  defp translate_attr({":values", {:attribute_expr, expr, m2}, m1}, _),
    do: {:root, {:attribute_expr, "data_values(#{expr})", m2}, m1}

  # defp translate_attr({":values", expr, m1}),
  #   do: {:root, {:attribute_expr, "data_values(#{expr})", m1}, m1}

  defp translate_attr({":on-" <> name, value, meta}, _) when is_binary(value) do
    [
      {:"phx-#{name}", value, meta},
      {:"phx-target", {:attribute_expr, "@myself", meta}, meta}
    ]
  end

  defp translate_attr({":on-" <> name, {:attribute_expr, expr, m2}, m1}, _) do
    [
      {:"phx-#{name}", {:attribute_expr, "(#{expr}) && (#{expr}).name", m2}, m2},
      {:"phx-target", {:attribute_expr, "(#{expr}) && (#{expr}).target", m2}, m1}
    ]
  end

  # defp translate_attr({":" <> name, value, meta}),
  #   do: {:"phx-#{name}", translate_attr_value(value), meta}

  defp translate_attr({name, value, meta}, node_props) do
    prop = node_props |> Enum.find(&("#{&1.name}" == "#{name}"))

    if prop && prop.type == :event && is_binary(value) do
      {:"#{name}", {:attribute_expr, "%Event{name: \"#{value}\", target: @myself}", meta}, meta}
    else
      {:"#{name}", translate_attr_value(value), meta}
    end
  end

  defp translate_attr_value({:attribute_expr, expr, meta}) do
    {:attribute_expr, expr |> translate_attr_values(), meta}
  end

  defp translate_attr_value(expr), do: expr

  defp translate_attr_values(expr) do
    case Code.string_to_quoted(expr) do
      {:ok, _} -> expr
      {:error, _} -> "[#{expr}]"
    end
  end

  defp copy_templates(context = %{component_type: Surface.LiveComponent}) do
    context.module
    |> context.config.module_translates.()
    |> module_to_path()
    |> create_file(translate_ast(context) |> Macro.to_string() |> String.replace("  :skip\n", ""))

    context
  end

  defp copy_templates(context = %{component_type: Surface.Component}) do
    target_module = context.module |> parent_module() |> context.config.module_translates.()

    target_module
    |> module_to_path()
    |> create_file(
      case target_module |> Code.ensure_compiled() do
        {:module, _} ->
          target_module |> module_ast()

        {:error, :nofile} ->
          "priv/templates/moon.light.component/empty_module.ex"
          |> EEx.eval_file(name: target_module)
          |> Code.string_to_quoted!()
      end
      |> merge_ast(translate_ast(context))
      |> Macro.to_string()
      |> String.replace("  :skip\n", "")
    )

    context
  end

  defp module_to_path(module) do
    (module
     |> to_string()
     |> replace(~r/([a-z])([A-Z])/, "\\1_\\2")
     |> downcase()
     |> replace(".", "/")
     |> replace("elixir/", "lib/")) <> ".exs"
  end

  defp parent_module(module) do
    module |> to_string() |> String.replace(~r/\.[A-Za-z]*$/, "") |> String.to_atom()
  end

  def print_shell_instructions(_) do
    Mix.shell().info("""
    """)
  end
end
