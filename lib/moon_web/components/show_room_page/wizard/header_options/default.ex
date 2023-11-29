defmodule MoonWeb.Components.ShowRoomPage.Wizard.HeaderOptions.Default do
  @moduledoc false

  use MoonWeb, :stateless_component

  alias Moon.Lego.Checkbox
  alias Moon.Design.Form.Input

  alias Moon.Design.Switch
  alias Moon.Icons.{OtherMoon, OtherSun}

  prop(has_breadcrumbs, :boolean, default: true)
  prop(has_button_group, :boolean, default: true)
  prop(has_left_button, :boolean, default: true)
  prop(has_right_button, :boolean, default: true)

  prop(change_default_title, :event)
  prop(change_description, :event)

  prop(default_title, :string)
  prop(description, :string)

  prop(light_header, :string)
  prop(toggle_header_theme, :event)

  def render(assigns) do
    ~F"""
    <div class="grid grid-cols-1 divide-y">
      <div class="grid grid-cols-1 md:grid-cols-2 py-3">
        <span class="font-medium">Replace title as you prefer</span>
        <Input id="default_input" value={@default_title} on_keyup={@change_default_title} />
      </div>

      <div class="grid grid-cols-1 md:grid-cols-2 py-3">
        <span class="font-medium">Replace description as you prefer</span>
        <Input value={@description} on_keyup={@change_description} />
      </div>
      <div class="grid grid-cols-1 md:grid-cols-2 py-3">
        <span class="font-medium">Customize buttons</span>
        <div>
          <div class="flex gap-2 items-center">
            <Checkbox
              is_selected={@has_breadcrumbs}
              class="moon-checked:bg-roshi"
              on_click={"toggle_breadcrumbs", target: :live_view}
            /> <span>has breadcrumbs</span>
          </div>
          <div class="flex gap-2 items-center">
            <Checkbox
              is_selected={@has_button_group}
              class="moon-checked:bg-roshi"
              on_click={"toggle_button_group", target: :live_view}
            /> <span>has button group</span>
          </div>
          <div class="flex gap-2 items-center">
            <Checkbox
              is_selected={@has_left_button}
              class="moon-checked:bg-roshi"
              on_click={"toggle_left_button", target: :live_view}
            /> <span>has "back" button on mobile view</span>
          </div>
          <div class="flex gap-2 items-center">
            <Checkbox
              is_selected={@has_right_button}
              class="moon-checked:bg-roshi"
              on_click={"toggle_right_button", target: :live_view}
            /> <span>has "trigger" button on mobile view</span>
          </div>
        </div>
      </div>
      <div class="grid grid-cols-1 md:grid-cols-2 py-3">
        <span class="font-medium">Customize theme</span>
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
      </div>
    </div>
    """
  end
end
