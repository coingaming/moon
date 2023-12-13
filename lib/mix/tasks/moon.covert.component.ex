defmodule Mix.Tasks.Moon.Convert.Component do
  @shortdoc "Converts surface component to phoenix_live_view"

  @moduledoc """
  Connverts component from surface to live_view format

      $ mix moon.convert.component Form.MyModule

  """

  use Mix.Task
  import Mix.Generator
  import Moon.Convert
  import Moon.Convert.{Ast}

  import String, only: [replace: 3, downcase: 1, split: 2]
  import List, only: [last: 1]

  require Logger

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

  defp copy_templates(context = %{component_type: Surface.LiveComponent}) do
    context.module
    |> context.config.module_translates.()
    |> module_to_path()
    |> create_file(
      surface_to_liveview(context)
      |> Macro.to_string()
      |> String.replace("  :skip\n", "")
    )

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
          "priv/templates/moon.convert.component/empty_module.ex"
          |> EEx.eval_file(name: target_module)
          |> Code.string_to_quoted!()
      end
      |> merge_ast(surface_to_liveview(context))
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

  def print_shell_instructions(_) do
    Mix.shell().info("""
    """)
  end
end
