defmodule Moon.Assets.Crests.CrestArsenal do
  use Moon.StatelessComponent

  prop color, :string, values: Moon.colors()
  prop height, :string
  prop width, :string
  prop font_size, :string
  prop vertical_align, :string
  prop class, :string

  def render(assigns) do
    ~H"""
    {{ asset_import @socket, "js/assets/crest" }}

    <svg class="moon-crest {{ @class }}" style={{ get_style(color: @color, height: @height, width: @width, font_size: @font_size, vertical_align: @vertical_align) }}>
      <use href="/moon/svgs/crests/crest-arsenal.svg#item"></use>
    </svg>

    """
  end
end
