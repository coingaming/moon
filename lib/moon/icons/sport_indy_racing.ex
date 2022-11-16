defmodule Moon.Icons.SportIndyRacing do
  @moduledoc false
  use Moon.StatelessComponent

  prop(click, :event)
  prop(class, :string)

  # All the other props below are deprecated!
  # Please use only tailwind classes and the class prop
  prop(font_size, :string)
  prop(color, :string, values: Moon.colors())
  prop(background_color, :string, values: Moon.colors())

  def render(assigns) do
    ~F"""
    <svg
      class={"moon-icon #{@class} #{@click && "cursor-pointer"}"}
      :on-click={@click}
      style={get_style(color: @color, background_color: @background_color, font_size: @font_size)}
    >
      <use href="/moon/assets/svgs/icons_new/sport-indy-racing.svg#item" />
    </svg>
    """
  end
end
