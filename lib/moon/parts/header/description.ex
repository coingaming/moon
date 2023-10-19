defmodule Moon.Parts.Header.Description do
  @moduledoc false

  use Moon.StatelessComponent, slot: "description"

  @doc "Id attribute for DOM element"
  prop(id, :string)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "Default slot"
  slot(default)

  def render(assigns) do
    ~F"""
    <p {=@id} data-testid={@testid} class={merge(["text-trunks text-moon-18", @class])}>
      <#slot />
    </p>
    """
  end
end
