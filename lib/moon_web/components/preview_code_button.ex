defmodule MoonWeb.Components.PreviewCodeButton do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Components.Button
  alias Moon.Components.Heading

  prop title, :string, default: ""
  prop selected_button, :string, default: "preview"
  prop click, :event, required: true
  prop class, :string

  def render(assigns) do
    ~F"""
    <div class={"flex justify-between items-center my-4 #{@class}"}>
      <Heading class="items-center" size={20} is_regular>{@title}</Heading>
      <div class="flex bg-beerus-100 p-1 rounded place-content-center">
        <Button
          class={"px-2 #{if @selected_button == "preview", do: "bg-gohan-100"}"}
          on_click={@click}
          left_icon="controls_eye"
          size="small"
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
          size="small"
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
end
