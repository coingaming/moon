defmodule Moon.Assets.Icons.IconSportsIceHockey do
  @moduledoc false

  use Moon.StatelessComponent

  prop(color, :string, values: Moon.colors())
  prop(background_color, :string, values: Moon.colors())
  prop(font_size, :string)
  prop(click, :event)
  prop(class, :string)

  def render(assigns) do
    ~F"""
    <svg
      class={"moon-icon #{@class} #{@click && "cursor-pointer"}"}
      :on-click={@click}
      style={get_style(color: @color, background_color: @background_color, font_size: @font_size)}
    >
      <use href="/moon/svgs/icons/icon-sports-ice-hockey.svg#item" />
    </svg>
    """
  end
end
