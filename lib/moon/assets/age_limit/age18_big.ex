defmodule Moon.Assets.AgeLimit.Age18Big do
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
      class={"moon-age_limit #{@class} #{@click && "cursor-pointer"}"}
      :on-click={@click}
      style={get_style(
        color: @color,
        height: @height,
        width: @width,
        font_size: @font_size,
        vertical_align: @vertical_align
      )}
    >
      <use href="/moon/assets/svgs/age_limit/Age18Big.svg#item" />
    </svg>
    """
  end
end
