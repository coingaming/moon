defmodule Moon.Assets.Currencies.IconSingaporeDollar do
  @moduledoc false

  use Moon.StatelessComponent

  prop(color, :string, values: Moon.colors())
  prop(height, :string)
  prop(width, :string)
  prop(font_size, :string)
  prop(vertical_align, :string)
  prop(click, :event)
  prop(class, :string)

  def render(assigns) do
    ~F"""
    <svg
      class={"moon-currency #{@class} #{@click && "cursor-pointer"}"}
      :on-click={@click}
      style={get_style(
        color: @color,
        height: @height,
        width: @width,
        font_size: @font_size,
        vertical_align: @vertical_align
      )}
    >
      <use href="/moon/svgs/currencies/icon-singapore-dollar.svg#item" />
    </svg>
    """
  end
end
