defmodule MoonWeb.Components.PreviewCodeButton do
  use Moon.StatelessComponent
  alias Moon.Assets.Icons.IconCode
  alias Moon.Assets.Icons.IconEye
  alias Moon.Components.Heading

  prop title, :string, default: ""
  prop selected_button, :string
  prop click, :event, required: true
  prop class, :string

  def render(assigns) do
    ~F"""
    {asset_import(@socket, "js/tailwind")}
    <div class="flex justify-between my-4 h-10 #{@class}">
      <Heading class="items-center" size={20} is_regular>{@title}</Heading>
      <div class="bg-beerus-100 rounded-md place-content-center">
        <button
          class={
            "px-2 py-1 text-sm leading-6 rounded-md h-10 transition",
            "text-piccolo-100 bg-gohan-100": "preview" == @selected_button,
            "text-piccolo-100": "preview" != @selected_button
          }
          :on-click={@click}
          phx-value-selected-item="preview"
        >
          <IconEye font_size="1.5rem" /> Preview
        </button>

        <button
          class={
            "px-2 py-1 text-sm leading-6 rounded-md h-10 transition",
            "text-piccolo-100 bg-gohan-100": "code" == @selected_button,
            "text-piccolo-100": "code" != @selected_button
          }
          :on-click={@click}
          phx-value-selected-item="code"
        >
          <IconCode font_size="1.5rem" /> Code
        </button>
      </div>
    </div>
    """
  end
end
