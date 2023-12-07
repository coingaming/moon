defmodule Mix.Tasks.Moon.Gen.Component do
  @shortdoc "Generates component and page"

  @moduledoc """
  Generates a component and a component page by component module name given

      $ mix moon.gen.component Form.MyModule

  """

  use Mix.Task
  import Mix.Generator

  import String, only: [replace: 3, downcase: 1, split: 2]
  import Enum, only: [reverse: 1, join: 2]
  import List, only: [last: 1]

  defstruct name: nil,
            path: nil

  @doc false
  def run([name]) do
    name |> context() |> copy_templates() |> print_shell_instructions()
  end

  defp context(name) do
    %{
      name: name,
      path: name |> replace(~r/([a-z])([A-Z])/, "\\1_\\2") |> downcase() |> replace(".", "/"),
      short: name |> split(".") |> last()
    }
  end

  defp pathes(%{path: path}) do
    [
      component: "lib/moon/design/#{path}.ex",
      page: "lib/moon_web/pages/design/#{path}_page.ex",
      example: "lib/moon_web/examples/design/#{path}_example/default.ex"
    ]
  end

  defp copy_templates(context) do
    Enum.each(pathes(context), fn {template, file_path} ->
      file_path |> split("/") |> reverse() |> tl() |> reverse() |> join("/") |> create_directory()

      data =
        EEx.eval_file(
          "priv/templates/moon.gen.component/#{template}.ex",
          Enum.map(context, fn {key, value} -> {key, value} end)
        )

      create_file(file_path, data, force: false)
    end)

    context
  end

  def print_shell_instructions(%{path: path, name: name}) do
    Mix.shell().info("""

    Add the resource to your lib/moon_web/router.ex

      live("/components/v2/#{path}", MoonWeb.Pages.Design.#{name}Page)


    And following to your lib/moon_web/schema/link.ex

      MoonWeb.Pages.Design.#{name}Page

    """)
  end
end
