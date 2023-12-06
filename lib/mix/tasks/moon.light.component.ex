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
        path_translates: fn path ->
          String.replace(path, "lib/moon/design/", "lib/moon/light/")
          |> String.replace(".ex", ".exs")
        end
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
    module
    |> module_ast()
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
        {translate_module_doc(c, result), acc}

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
      Parser.parse!(
        string
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
          {translate_node(node), context}
      end)
      |> Tuple.to_list()
      |> hd()
      |> to_text()

    {:sigil_H, m1, [{:<<>>, meta, [result]}, opts]}
  end

  defp translate_node(text) when is_binary(text), do: text

  defp translate_node({:expr, expr, meta}), do: {:expr, expr, meta}

  # TODO: context_put & children
  defp translate_node(
         {"#slot", [{:root, {:attribute_expr, expr, _m2}, _m1} | _], _children, node_meta}
       ) do
    {:expr, "render_slot(#{expr})", node_meta}
  end

  defp translate_node({"#slot", _, _children, node_meta}) do
    {:expr, "render_slot(@inner_block)", node_meta}
  end

  defp translate_node({type, attributes, children, node_meta}) do
    {type |> translate_type(), attributes |> List.wrap() |> Enum.map(&translate_attr/1), children,
     node_meta}
  end

  defp translate_node(other), do: other

  defp translate_type(type) do
    cond do
      String.match?(type, ~r/^[A-Z].*$/) ->
        # TODO: correct aliases handing here
        "." <> String.downcase(type)

      true ->
        type
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
      if target_module |> Code.ensure_compiled() do
        target_module |> module_ast()
      else
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
