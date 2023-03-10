defmodule MoonWeb.Components.ThemesSelect.ThemeSwitcher do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Icons.OtherMoon
  alias Moon.Icons.OtherSun
  alias Moon.Design.Form.Switch

  prop(dark_mode, :boolean, default: false)

  prop(on_theme_switch, :event)

  def render(assigns) do
    ~F"""
    <Switch size="xs" id="theme_switcher" is_switched={@on_theme_switch} class="theme_switcher">
      <:on_icon><OtherMoon /></:on_icon>
      <:off_icon><OtherSun /></:off_icon>
    </Switch>
    """
  end
end
