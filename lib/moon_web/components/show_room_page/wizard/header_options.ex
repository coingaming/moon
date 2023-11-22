defmodule MoonWeb.Components.ShowRoomPage.Wizard.HeaderOptions do
  @moduledoc false

  use MoonWeb, :stateless_component

  alias Moon.Lego.Checkbox
  alias Moon.Design.Form.Input
  alias MoonWeb.Components.ShowRoomPage.Wizard.Card

  prop(is_selected1, :boolean, default: true)
  prop(is_selected2, :boolean, default: true)
  prop(is_selected3, :boolean, default: true)
  prop(is_selected4, :boolean, default: true)
  prop(is_selected0, :boolean, default: true)

  prop(has_breadcrumbs, :boolean, default: true)
  prop(has_title, :boolean, default: true)
  prop(has_description, :boolean, default: true)
  prop(has_button_group, :boolean, default: true)
  prop(has_left_button, :boolean, default: true)
  prop(has_right_button, :boolean, default: true)

  prop(change_title, :event)
  prop(change_description, :event)

  prop(title, :string)
  prop(description, :string)

  def render(assigns) do
    ~F"""
    <Card>
      <:title>Header customization playground</:title>
      <:description>Witness the adaptability of Moon's headers across different screen dimensions. Explore the options available and find the perfect fit for your BackOffice environment.</:description>

      <div class="flex flex-col gap-2">
        <span class="font-medium">Customize your view: replace title as you prefer</span>
        <Input value={@title} on_keyup={@change_title} />
      </div>

      <div class="flex flex-col gap-2">
        <span class="font-medium">Customize your view: replace description as you prefer</span>
        <Input value={@description} on_keyup={@change_description} />
      </div>

      <div class="pb-4">
        <div class="flex gap-2 items-center">
          <Checkbox
            is_selected={@has_title}
            class="moon-checked:bg-roshi"
            on_click={"toggle_title", target: :live_view}
          /> <span>has title</span>
        </div>
        <div class="flex gap-2 items-center">
          <Checkbox
            is_selected={@has_description}
            class="moon-checked:bg-roshi"
            on_click={"toggle_description", target: :live_view}
          /> <span>has description</span>
        </div>
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
          /> <span>has left button on mobile view</span>
        </div>
        <div class="flex gap-2 items-center">
          <Checkbox
            is_selected={@has_right_button}
            class="moon-checked:bg-roshi"
            on_click={"toggle_right_button", target: :live_view}
          /> <span>has right button on mobile view</span>
        </div>
      </div>
    </Card>
    """
  end
end
