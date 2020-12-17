defmodule Moon.Assets.Logos.LogoHub88Short do
  use Moon.StatelessComponent

  prop(color, :string, values: Moon.colors())
  prop(height, :string)
  prop(width, :string)
  prop(font_size, :string)
  prop(vertical_align, :string)

  def render(assigns) do
    ~H"""
    {{ asset_import @socket, "js/assets/logo" }}

    <svg class="moon-logo" style={{ get_style(color: @color, height: @height, width: @width, font_size: @font_size, vertical_align: @vertical_align) }}>
      <use href="/moon/svgs/logos/logo-hub88-short.svg#item"></use>
    </svg>

    """
  end
end
