defmodule Moon.Parts.Header.ButtonGroup do
  @moduledoc false

  use Moon.StatelessComponent, slot: "button_group"

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
    <div {=@id} data-testid={@testid} class={merge(["gap-2 hidden lg:inline", @class])}>
      <#slot />
    </div>
    """
  end
end
