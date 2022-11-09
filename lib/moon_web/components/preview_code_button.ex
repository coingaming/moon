defmodule MoonWeb.Components.PreviewCodeButton do
  @moduledoc false

  use MoonWeb, :stateless_component

  alias Moon.Components.Button

  prop(title, :string, default: "")
  prop(selected_button, :string, default: "preview")
  prop(click, :event, required: true)

  def render(assigns) do
    ~F"""
    <div class="flex flex-row items-center justify-between">
      <a href={"#" <> get_as_anchor_id(@title)}><h3 id={get_as_anchor_id(@title)} class="text-moon-24 font-semibold">{@title}</h3></a>
      <div class="flex bg-beerus-100 p-1 rounded-lg place-content-center gap-1 text-trunks-100">
        <Button
          no_hover_bg
          class={
            "px-2 font-medium text-sm hover:text-bulma-100",
            "bg-gohan-100 text-bulma-100": @selected_button == "preview"
          }
          on_click={@click}
          left_icon="controls_eye"
          value_name="selected-item"
          value="preview"
          variant="none"
        >
          <span class="hidden lg:inline">Preview</span>
        </Button>

        <Button
          no_hover_bg
          class={
            "px-2 font-medium text-sm hover:text-bulma-100",
            "bg-gohan-100 text-bulma-100": @selected_button == "code"
          }
          on_click={@click}
          left_icon="software_code"
          value_name="selected-item"
          value="code"
          variant="none"
        >
          <span class="hidden lg:inline">Code</span>
        </Button>
      </div>
    </div>
    """
  end
end
