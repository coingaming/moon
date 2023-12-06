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

  alias Surface.Compiler.Parser

  defstruct name: nil,
            path: nil

  @doc false
  def run([name]) do
    name
    |> context()
    |> add_module_info()
    |> copy_templates()
    |> print_shell_instructions()
  end

  defp context(name) do
    %{
      name: name,
      module: String.to_existing_atom("Elixir.Moon.Design.#{name}"),
      path: name |> replace(~r/([a-z])([A-Z])/, "\\1_\\2") |> downcase() |> replace(".", "/"),
      short: name |> split(".") |> last(),
      config: %{
        use_translates: fn alias ->
          %{
            [:Moon, :StatelessComponent] => [:Moon, :Light, :Component],
            [:Moon, :StatefulComponent] => [:Moon, :Light, :LiveComponent]
          }[alias]
        end,
        defmodule_translates: fn
          [:Moon | [:Design | others]] -> [:Moon | [:Light | others]]
        end,
        module_translates: fn module ->
          module |> to_string() |> String.replace("Moon.Design", "Moon.Light") |> String.to_atom()
        end,
      }
    }
  end

  defp add_module_info(context = %{module: module}) do
    Map.merge(
      %{
        aliases:
          module.__env__().aliases()
          |> Enum.reject(
            &(&1 in [
                {Mod, Module},
                {Context, Surface.Components.Context},
                {Raw, Surface.Components.Raw},
                {Component, Surface.Components.Dynamic.Component},
                {LiveComponent, Surface.Components.Dynamic.LiveComponent}
              ])
          ),
        component_type: module.component_type(),
        level: 0
      },
      context
    )
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

    c = Map.put(c, :aliases,
      aliases
      |> Enum.reduce(%{}, fn items, acc ->
        Map.put(
          acc,
          Enum.at(items, -1) |> to_string(),
          [ :Elixir | items] |> Enum.map(&to_string/1) |> Enum.join(".") |> String.to_atom()
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
         # TODO: sort children after merge for use, imports and aliases
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
         do: {:__block__, [], children ++ children2}
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

  # translate {:prop, [line: 21], [{:step, [line: 21], nil}, :integer, [default: 1]]}
  # to {:attr, [line: 38], [:id, :string, [required: true]]}
  defp translate_prop(_, {:prop, meta, [{name, _, nil}, type]}, doc),
    do: {:attr, meta, [name, translate_prop_type(type), [doc: "#{doc}"]]}

  defp translate_prop(_, {:prop, meta, [{name, _, nil}, type, options]}, doc),
    do:
      {:attr, meta,
       [name, translate_prop_type(type), translate_prop_options(options) ++ [doc: "#{doc}"]]}

  defp translate_prop_type(type)
       when type in [:boolean, :integer, :float, :string, :atom, :list, :map, :global],
       do: type

  defp translate_prop_type(_), do: :any

  defp translate_prop_options(options) do
    options
    |> Enum.map(fn
      {:values!, v} -> {:values, v}
      {k, v} when k in [:required, :default, :values, :examples] -> {k, v}
    end)
  end

  defp translate_slot(_, {:slot, meta, [{:default, _, nil}]}, doc),
    do: {:slot, meta, [:inner_block, [doc: doc]]}

  defp translate_slot(_, {:slot, meta, [{name, _, nil}]}, doc),
    do: {:slot, meta, [name, [doc: doc]]}

  defp translate_slot(_, {:slot, meta, [{:default, _, nil}, options]}, doc),
    do: {:slot, meta, [:inner_block, options ++ [doc: doc]]}

  defp translate_slot(_, {:slot, meta, [{name, _, nil}, options]}, doc),
    do: {:slot, meta, [name, options ++ [doc: doc]]}

  defp translate_doc(_, _res = {:@, _, [{:doc, _, [text]}]}) do
    text
  end

  defp translate_moduledoc(%{component_type: Surface.LiveComponent}, res), do: res

  defp translate_moduledoc(
         %{component_type: Surface.Component},
         {:@, m1, [{:moduledoc, m2, [text]}]}
       ),
       do: {:@, m1, [{:doc, m2, [text]}]}

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
         {"#slot", [{:root, {:attribute_expr, expr, _m2}, _m1} | _], _children, node_meta}, _
       ) do
    {:expr, "render_slot(#{expr})", node_meta}
  end

  defp translate_node({"#slot", _, _children, node_meta}, _) do
    {:expr, "render_slot(@inner_block)", node_meta}
  end

  defp translate_node({type, attributes, children, node_meta}, c) do
    {type |> translate_type(c), attributes |> List.wrap() |> Enum.map(&translate_attr/1), children,
     node_meta}
  end

  defp translate_node(other, _), do: other

  defp translate_type(type, c = %{aliases: aliases}) do
    cond do
      !String.match?(type, ~r/^[A-Z].*$/) ->
        type

      type == "Icon" -> ".icon"

      aliases[type] === nil ->
        # TODO: logging here
        dbg(type)

      aliases[type].component_type() == Surface.Component ->
        mod = aliases[type] |> parent_module() |> c.config.module_translates.()

        if(function_exported?(mod, type|> String.downcase() |> String.to_atom(), 1)) do
          "#{mod == c.config.module_translates.(c.module) && "" || mod}.#{type|> String.downcase()}"
        else
          ".moon module={#{type}}"
        end

      aliases[type].component_type() == Surface.LiveComponent ->
        mod = aliases[type] |> c.config.module_translates.()

        if(function_exported?(mod, :render, 1)) do
          ".live_component module={#{mod}}"
        else
          ".moon module={#{type}}"
        end
    end
  end

  # defp translate_attr({name, expr, meta}), do: dbg({name, expr, meta})

  defp translate_attr({name, expr, meta}) when is_atom(name),
    do: translate_attr({"#{name}", expr, meta})

  defp translate_attr({name, expr, meta}) when name in ~w(root :let :if :for),
    do: {name, expr, meta}

  # TODO: translate each to data-value attribute
  defp translate_attr({":values", value, meta}), do: {"values", translate_attr_value(value), meta}

  defp translate_attr({":" <> name, value, meta}),
    do: {:"phx-#{name}", translate_attr_value(value), meta}

  defp translate_attr({name, value, meta}), do: {:"#{name}", translate_attr_value(value), meta}

  defp translate_attr_value({:attribute_expr, expr, meta}) do
    case Code.string_to_quoted(expr) do
      {:ok, _} -> {:attribute_expr, expr, meta}
      {:error, _} -> {:attribute_expr, "[#{expr}]", meta}
    end
  end

  defp translate_attr_value(expr), do: expr

  defp copy_templates(context = %{component_type: Surface.LiveComponent}) do
    context.module
    |> context.config.module_translates.()
    |> module_to_path()
    |> create_file(translate_ast(context) |> Macro.to_string() |> String.replace(":skip", ""))

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
      |> String.replace(":skip", "")
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

  def print_shell_instructions(%{path: _path, name: _name}) do
    Mix.shell().info("""
    """)
  end
end
