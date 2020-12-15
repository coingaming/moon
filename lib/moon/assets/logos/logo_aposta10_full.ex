defmodule Moon.Assets.Logos.LogoAposta10Full do
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
      <use href="/svgs/logos/logo-aposta10-full.svg#item"></use>
    </svg>

    """
  end
end
