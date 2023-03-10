defmodule MoonWeb.Components.ThemesSelect.RtlSwitcher do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Icons.TextLeftAlign
  alias Moon.Icons.TextRightAlign
  alias Moon.Design.Form.Switch

  prop(on_direction_switch, :event)

  def render(assigns) do
    ~F"""
    <Switch size="xs" id="direction_switcher" is_switched={@on_direction_switch}>
      <:on_icon><TextRightAlign /></:on_icon>
      <:off_icon><TextLeftAlign /></:off_icon>
    </Switch>
    """
  end
end
