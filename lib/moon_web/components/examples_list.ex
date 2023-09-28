defmodule MoonWeb.Components.ExamplesList do
  @moduledoc false

  use Moon.StatelessComponent

  alias MoonWeb.Components.ExampleAndCode

  import Moon.Helpers.MoonRender, only: [moon: 1]

  prop(examples, :list, default: [])

  def render(assigns) do
    ~F"""
    {#for module <- @examples}
      <ExampleAndCode title={title(module)} id={"example-#{module}"}>
        <:note>{(Kernel.function_exported?(module, :note, 0) && module.note()) || ""}</:note>
        <:example><.moon {=module} id={"example-contents-#{module}"} /></:example>
        <:code>{(Kernel.function_exported?(module, :code, 0) && module.code()) || ""}</:code>
      </ExampleAndCode>
    {/for}
    """
  end

  defp title(module) do
    "#{module}"
    |> String.split(".")
    |> Enum.at(-1)
    |> String.replace(~r/([a-z])([A-Z])/, "\\1 \\2")
    |> String.downcase()
    |> String.capitalize()
  end
end
