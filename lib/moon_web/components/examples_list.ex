defmodule MoonWeb.Components.ExamplesList do
  @moduledoc false

  use Moon.StatelessComponent

  import Moon.Helpers.MoonRender

  alias MoonWeb.Components.ExampleAndCode

  prop(examples, :list, default: [])

  def render(assigns) do
    ~F"""
    {#for module <- @examples}
      <ExampleAndCode title={"#{module}" |> String.split(".") |> Enum.at(-1)} id={"example-#{module}"}>
        <:example><.moon {=module} /></:example>
        <:code>{(Kernel.function_exported?(module, :code, 0) && module.code()) || ""}</:code>
        <:note>{(Kernel.function_exported?(module, :note, 0) && module.note()) || ""}</:note>
      </ExampleAndCode>
    {/for}
    """
  end
end
