defmodule MoonWeb.Components.PreviewCodeButton do
  use Moon.StatelessComponent
  alias Moon.Assets.Icons.Softwarecode
  alias Moon.Assets.Icons.IconEye
  alias Moon.Components.Heading

  prop title, :string, default: ""
  prop selected_button, :string
  prop click, :event, required: true
  prop class, :string

  def render(assigns) do
    ~F"""
    {asset_import(@socket, "js/tailwind")}
    <div class="flex justify-between items-center my-4 #{@class}">
      <Heading class="items-center" size={20} is_regular>{@title}</Heading>
      <div class="bg-beerus-100 p-0.5 rounded place-content-center">
        <button
          class={
            "text-sm p-1.5 h-10 rounded transition",
            "text-piccolo-100 bg-gohan-100": "preview" == @selected_button,
            "text-piccolo-100": "preview" != @selected_button
          }
          :on-click={@click}
          phx-value-selected-item="preview"
        >
          <div class="p-1 mx-2">
            <IconEye font_size="1.5rem" /> Preview
          </div>
        </button>

        <button
          class={
            "text-sm p-1.5 h-10 rounded transition",
            "text-piccolo-100 bg-gohan-100": "code" == @selected_button,
            "text-piccolo-100": "code" != @selected_button
          }
          :on-click={@click}
          phx-value-selected-item="code"
        >
          <div class="p-1 mx-2">
            <Softwarecode font_size="1.5rem" /> Code
          </div>
        </button>
      </div>
    </div>
    """
  end
end
