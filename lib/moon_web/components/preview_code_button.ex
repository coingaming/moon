defmodule MoonWeb.Components.PreviewCodeButton do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Components.Button

  prop title, :string, default: ""
  prop selected_button, :string, default: "preview"
  prop click, :event, required: true

  def render(assigns) do
    ~F"""
    <div class="flex flex-row items-center justify-between">
      <a href={"#" <> get_as_anchor_id(@title)}><h3 id={get_as_anchor_id(@title)} class="text-moon-24 font-semibold">{@title}</h3></a>
      <div class="flex bg-beerus-100 p-1 rounded place-content-center gap-1">
        <Button
          class={"px-2 #{if @selected_button == "preview", do: "bg-gohan-100"}"}
          on_click={@click}
          left_icon="controls_eye"
          size="medium"
          value_name="selected-item"
          value="preview"
          variant="none"
        >
          Preview
        </Button>

        <Button
          class={"px-2 #{if @selected_button == "code", do: "bg-gohan-100"}"}
          on_click={@click}
          left_icon="software_code"
          size="medium"
          value_name="selected-item"
          value="code"
          variant="none"
        >
          Code
        </Button>
      </div>
    </div>
    """
  end

  def get_as_anchor_id(title) do
    title |> String.replace(" ", "-")
  end
end
