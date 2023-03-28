defmodule Moon.Design.Alert.Close do
  @moduledoc false

  use Moon.StatelessComponent, slot: "close"

  alias Moon.Design.Button.IconButton

  prop(class, :css_class)

  prop(on_click, :event)

  def render(assigns) do
    ~F"""
    <IconButton
      size="xs"
      variant="ghost"
      class={merge(["absolute top:4 text-moon-16 text-bulma", @class])}
      icon_only="controls_close"
      on_click={@on_click}
    />
    """
  end
end
