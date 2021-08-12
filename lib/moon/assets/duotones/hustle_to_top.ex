defmodule Moon.Assets.Duotones.HustleToTop do
  use Moon.StatelessComponent

  prop color, :string, values: Moon.colors()
  prop height, :string
  prop width, :string
  prop font_size, :string
  prop vertical_align, :string
  prop click, :event
  prop class, :string

  def render(assigns) do
    ~F"""
    {asset_import(@socket, "js/assets/duotone")}

    <svg
      class={"moon-duotone #{@class} #{@click && "cursor-pointer"}"}
      :on-click={@click}
      style={get_style(
        color: @color,
        height: @height,
        width: @width,
        font_size: @font_size,
        vertical_align: @vertical_align
      )}
    >
      <use href="/moon/assets/svgs/duotones/hustle-to-top.svg#item" />
    </svg>
    """
  end
end
