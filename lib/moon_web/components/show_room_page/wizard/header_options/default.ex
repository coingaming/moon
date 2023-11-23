defmodule MoonWeb.Components.ShowRoomPage.Wizard.HeaderOptions.Default do
  @moduledoc false

  use MoonWeb, :stateless_component

  alias Moon.Lego.Checkbox
  alias Moon.Design.Form.Input

  prop(has_breadcrumbs, :boolean, default: true)
  prop(has_button_group, :boolean, default: true)
  prop(has_left_button, :boolean, default: true)
  prop(has_right_button, :boolean, default: true)

  prop(change_default_title, :event)
  prop(change_description, :event)

  prop(default_title, :string)
  prop(description, :string)

  def render(assigns) do
    ~F"""
    <div class="flex flex-col gap-4 pt-6">
      <div class="flex flex-col gap-2">
        <span class="font-medium">Customize your view: replace title as you prefer</span>
        <Input id="default_input" value={@default_title} on_keyup={@change_default_title} />
      </div>
      <div class="flex flex-col gap-2">
        <span class="font-medium">Customize your view: replace description as you prefer</span>
        <Input value={@description} on_keyup={@change_description} />
      </div>
      <div class="flex flex-col gap-2">
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
    </div>
    """
  end
end
