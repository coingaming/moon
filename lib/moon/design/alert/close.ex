defmodule Moon.Design.Alert.Close do
  @moduledoc false

  use Moon.StatelessComponent, slot: "close"

  alias Moon.Design.Button.IconButton

  @doc "Tailwind classes for customization"
  prop(class, :css_class)
  @doc "Id attribute for DOM element"
  prop(id, :string)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Event to happen when close button is clicked"
  prop(on_click, :event)

  def render(assigns) do
    ~F"""
    <IconButton
      size="xs"
      variant="ghost"
      class={merge(["absolute top:4 text-moon-16 text-bulma end-4", @class])}
      icon="controls_close"
      on_click={@on_click}
      {=@id}
      {=@testid}
    />
    """
  end
end
