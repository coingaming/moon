defmodule MoonWeb.Components.ShowRoomPage.Wizard.HeaderOptions.TitleOnly do
  @moduledoc false

  use MoonWeb, :stateless_component

  alias Moon.Lego.Checkbox
  alias Moon.Design.Form.Input

  prop(has_other_button_group, :boolean, default: true)
  prop(has_other_left_button, :boolean, default: true)
  prop(has_other_right_button, :boolean, default: true)

  prop(change_title, :event)
  prop(title, :string)

  def render(assigns) do
    ~F"""
    <div class="flex flex-col gap-4 pt-6">
      <div class="flex flex-col gap-2">
        <span class="font-medium">Customize your view: replace title as you prefer</span>
        <Input id="title_only" value={@title} on_keyup={@change_title} />
      </div>
      <div class="flex flex-col gap-2">
        <span class="font-medium">Customize buttons</span>
        <div>
          <div class="flex gap-2 items-center">
            <Checkbox
              is_selected={@has_other_button_group}
              class="moon-checked:bg-roshi"
              on_click={"toggle_other_button_group", target: :live_view}
            /> <span>has button group</span>
          </div>
          <div class="flex gap-2 items-center">
            <Checkbox
              is_selected={@has_other_left_button}
              class="moon-checked:bg-roshi"
              on_click={"toggle_other_left_button", target: :live_view}
            /> <span>has "back" button on mobile view</span>
          </div>
          <div class="flex gap-2 items-center">
            <Checkbox
              is_selected={@has_other_right_button}
              class="moon-checked:bg-roshi"
              on_click={"toggle_other_right_button", target: :live_view}
            /> <span>has "trigger" button on mobile view</span>
          </div>
        </div>
      </div>
    </div>
    """
  end
end
