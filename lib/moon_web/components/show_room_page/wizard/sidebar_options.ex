defmodule MoonWeb.Components.ShowRoomPage.Wizard.SidebarOptions do
  @moduledoc false

  use MoonWeb, :stateless_component

  alias Moon.Design.Form.Radio
  alias MoonWeb.Components.ShowRoomPage.Wizard.Card
  alias Moon.Design.Switch
  alias Moon.Icons.{OtherMoon, OtherSun}
  alias Moon.Parts.Button

  prop(value, :string)
  prop(on_change, :event)

  prop(light_sidebar, :string)
  prop(toggle_sidebar_theme, :event)

  def render(assigns) do
    ~F"""
    <Card>
      <:title>Select the preferable sidebar type</:title>
      <:description>Tailor your app with Moon's dynamic sidebar options. Choose the layout to suit your preferences and needs.</:description>
      <div class="grid grid-cols-1 divide-y">
        <div class="grid grid-cols-1 md:grid-cols-2 pb-3">
          <span class="font-medium">Customize sidebar type</span>
          <Radio {=@value} {=@on_change}>
            <Radio.Button value="slim">
              <Radio.Indicator class="moon-checked:border-roshi after:bg-roshi" />Slim sidebar
              <Button.Success
                as="a"
                size="xs"
                :if={@value == "slim"}
                href="https://github.com/coingaming/moon/blob/main/lib/moon_web/components/show_room_page/sidebar/slim.ex"
                target="_blank"
              >see code</Button.Success>
            </Radio.Button>
            <Radio.Button value="generic">
              <Radio.Indicator class="moon-checked:border-roshi after:bg-roshi" />Generic sidebar
              <Button.Success
                as="a"
                size="xs"
                :if={@value == "generic"}
                href="https://github.com/coingaming/moon/blob/main/lib/moon_web/components/show_room_page/sidebar/generic.ex"
                target="_blank"
              >see code</Button.Success>
            </Radio.Button>
            <Radio.Button value="wide">
              <Radio.Indicator class="moon-checked:border-roshi after:bg-roshi" />Wide sidebar
              <Button.Success
                as="a"
                size="xs"
                :if={@value == "wide"}
                href="https://github.com/coingaming/moon/blob/main/lib/moon_web/components/show_room_page/sidebar/wide.ex"
                target="_blank"
              >see code</Button.Success>
            </Radio.Button>
          </Radio>
        </div>
        <div class="grid grid-cols-1 md:grid-cols-2 pt-3">
          <span class="font-medium">Customize theme</span>
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
        </div>
      </div>
    </Card>
    """
  end
end
