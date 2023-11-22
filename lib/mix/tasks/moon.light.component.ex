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
        defmodule_translates: fn [:Moon | [:Design | others]] -> [:Moon | [:Light | others]] end,
        path_translates: fn path ->
          String.replace(path, "lib/moon/design/", "lib/moon/light/")
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
    |> Macro.prewalk(fn
      result = {:def, _, [{:render, _, _} | _]} ->
        translate_render(c, result)

      result = {:sigil_F, _, _} ->
        translate_sigil(c, result)

      result = {:prop, _meta, _options} ->
        translate_prop(c, result)

      result = {:slot, _meta, _options} ->
        translate_prop(c, result)

      result = {:@, _, [{:doc, _, [_text]}]} ->
        translate_doc(c, result)

      result = {:use, _, [{:__aliases__, _, _alias} | _]} ->
        translate_use_defmodule(c, result)

      result = {:defmodule, _, [{:__aliases__, _, _alias} | _]} ->
        translate_use_defmodule(c, result)

      other ->
        other
    end)
    |> Macro.to_string()
  end

  defp translate_render(%{component_type: Surface.LiveComponent, level: 0}, ast), do: ast

  defp translate_render(%{component_type: Surface.Component, level: 0}, ast), do: ast

  # translate {:prop, [line: 21], [{:step, [line: 21], nil}, :integer, [default: 1]]}
  # to {:attr, [line: 38], [:id, :string, [required: true]]}
  defp translate_prop(_, {:prop, meta, [{name, _, nil}, type]}), do: {:attr, meta, [name, type]}

  defp translate_prop(_, {:prop, meta, [{name, _, nil}, type, options]}),
    do: {:attr, meta, [name, type, options]}

  defp translate_prop(_, {:slot, meta, [{:default, _, nil}]}), do: {:slot, meta, [:inner_block]}
  defp translate_prop(_, {:slot, meta, [{name, _, nil}]}), do: {:slot, meta, [name]}

  defp translate_prop(_, {:slot, meta, [{:default, _, nil}, options]}),
    do: {:slot, meta, [:inner_block, options]}

  defp translate_prop(_, {:slot, meta, [{name, _, nil}, options]}),
    do: {:slot, meta, [name, options]}

  defp translate_doc(_, res = {:@, _, [{:doc, _, [_text]}]}) do
    res
  end

  defp translate_use_defmodule(
         %{config: config},
         {type, m1, [{:__aliases__, m2, alias} | other]}
       )
       when type in [:use, :defmodule] do
    {type, m1, [{:__aliases__, m2, config[:"#{type}_translates"].(alias)} | other]}
  end

  defp translate_sigil(
         context = %{module: module},
         {:sigil_F, m1, [{:<<>>, meta, [string]}, opts]}
       ) do
    # "copy of Surface.sigil_F macro & Surface.Compiler.compile"

    result =
      Parser.parse!(string,
        file: module.__info__(:compile)[:source] |> to_string(),
        line: meta[:line] + if(Keyword.has_key?(meta, :indentation), do: 1, else: 0),
        caller: %{module: module, function: :render},
        checks: opts[:checks] || [],
        warnings: opts[:warnings] || [],
        column: Keyword.get(opts, :column, 1),
        indentation: Keyword.get(opts, :indentation, 0)
      )
      |> prewalk(context, fn
        :text, text, context ->
          {text, context}

        _node_type, _node = {type, attributes, children, _node_meta}, context ->
          {{type, attributes, children, %{}}, context}
      end)
      |> Tuple.to_list()
      |> hd()
      |> to_text()

    {:sigil_F, m1, [{:<<>>, meta, [result]}, opts]}
  end

  defp copy_templates(context) do
    context.module.__info__(:compile)[:source]
    |> to_string()
    |> context.config.path_translates.()
    |> create_file(translate_ast(context))

    context
  end

  def print_shell_instructions(%{path: _path, name: _name}) do
    Mix.shell().info("""
    """)
  end
end