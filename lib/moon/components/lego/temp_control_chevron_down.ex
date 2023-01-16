# TODO
# Use the original icon after https://github.com/coingaming/moon/pull/450 is merged
# and class is changed from :string to :css_class
defmodule Moon.Components.Lego.TempControlsChevronDown do
  @moduledoc false
  use Moon.StatelessComponent

  prop(click, :event)
  prop(class, :css_class)

  # All the other props below are deprecated!
  # Please use only tailwind classes and the class prop
  prop(font_size, :string)
  prop(color, :string, values: Moon.colors())
  prop(background_color, :string, values: Moon.colors())

  def render(assigns) do
    ~F"""
    <svg
      class={"moon-icon", @class, "cursor-pointer": @click}
      :on-click={@click}
      style={get_style(color: @color, background_color: @background_color, font_size: @font_size)}
    >
      <use href="/moon_icons/svgs/icons_new/controls-chevron-down.svg#item" />
    </svg>
    """
  end
end
