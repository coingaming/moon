defmodule MoonWeb.Components.ShowRoomPage.Wizard.ThemeOptions do
  @moduledoc false

  use MoonWeb, :stateless_component

  alias MoonWeb.Components.ShowRoomPage.Wizard.Card

  alias Moon.Design.Switch
  alias Moon.Icons.{OtherMoon, OtherSun}

  prop(light_sidebar, :string)
  prop(light_header, :string)
  prop(toggle_sidebar_theme, :event)
  prop(toggle_header_theme, :event)

  def render(assigns) do
    ~F"""
    <Card>
      <:title>Effortless customization</:title>
      <:description>Tailor your app's appearance to match your workflow. Moon offers a choice between dark and light theme. Select the one that suits your preferences.</:description>

      <div class="flex gap-4">
        <Switch
          checked={!@light_sidebar}
          on_change={@toggle_sidebar_theme}
          on_bg_color="bg-roshi"
          size="xs"
        >
          <:on_icon><OtherMoon /></:on_icon>
          <:off_icon><OtherSun /></:off_icon>
        </Switch>
        <span>{(@light_sidebar && "Light theme sidebar") || "Dark theme sidebar"}</span>
      </div>

      <div class="flex gap-4">
        <Switch
          checked={!@light_header}
          on_change={@toggle_header_theme}
          on_bg_color="bg-roshi"
          size="xs"
        >
          <:on_icon><OtherMoon /></:on_icon>
          <:off_icon><OtherSun /></:off_icon>
        </Switch>
        <span>{(@light_header && "Light theme header") || "Dark theme header"}</span>
      </div>
    </Card>
    """
  end
end
