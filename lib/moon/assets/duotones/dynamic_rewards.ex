defmodule Moon.Assets.Duotones.DynamicRewards do
  use Moon.StatelessComponent

  prop color, :string, values: Moon.colors()
  prop height, :string
  prop width, :string
  prop font_size, :string
  prop vertical_align, :string
  prop click, :event
  prop class, :string

  def render(assigns) do
    ~H"""
    {{ asset_import @socket, "js/assets/duotone" }}

    <svg class="moon-duotone {{ @class }}" :on-click={{ @click }} style={{ get_style(color: @color, height: @height, width: @width, font_size: @font_size, vertical_align: @vertical_align) }}>
      <use href="/moon/svgs/duotones/dynamic-rewards.svg#item"></use>
    </svg>

    """
  end
end
