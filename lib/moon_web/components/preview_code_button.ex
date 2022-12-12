defmodule MoonWeb.Components.PreviewCodeButton do
  @moduledoc false

  use MoonWeb, :stateless_component

  alias Moon.Components.Button
  alias Moon.Icon

  prop(title, :string, default: "")
  prop(selected_button, :string, default: "preview")
  prop(click, :event, required: true)

  def render(assigns) do
    ~F"""
    <div class="flex flex-row items-center justify-between">
      <a href={"#" <> get_as_anchor_id(@title)}><h3 id={get_as_anchor_id(@title)} class="text-moon-24 font-semibold">{@title}</h3></a>
      <div class="flex bg-beerus p-0.5 rounded-lg place-content-center text-trunks">
        <Button
          button_gap="gap-0"
          no_hover_bg
          class={
            "px-1 p-1.5 lg:ps-2.5 lg:pe-3.5 font-medium text-sm hover:text-bulma",
            "bg-gohan text-bulma": @selected_button == "preview"
          }
          on_click={@click}
          value_name="selected-item"
          value="preview"
          variant="none"
        >
          <span class="hidden lg:inline">Preview</span>
          <:left_icon_slot><Icon name="controls_eye" class="w-8 h-8" /></:left_icon_slot>
        </Button>

        <Button
          no_hover_bg
          class={
            "px-1 p-1.5 lg:ps-2.5 lg:pe-3.5 font-medium text-sm hover:text-bulma",
            "bg-gohan text-bulma": @selected_button == "code"
          }
          on_click={@click}
          value_name="selected-item"
          value="code"
          variant="none"
        >
          <span class="hidden lg:inline">Code</span>
          <:left_icon_slot><Icon name="software_code" class="w-8 h-8" /></:left_icon_slot>
        </Button>
      </div>
    </div>
    """
  end
end
