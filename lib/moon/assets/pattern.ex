defmodule Moon.Assets.Pattern do
  use Moon.StatelessComponent
  alias Moon.Assets.Patterns

  prop name, :string

  prop color, :string, values: Moon.colors()
  prop height, :string
  prop width, :string
  prop font_size, :string
  prop vertical_align, :string
  prop click, :event
  prop class, :string

  @assets_map %{
    pattern_circles: Patterns.PatternCircles,
    pattern_lines: Patterns.PatternLines,
    pattern_ripple: Patterns.PatternRipple,
    pattern_speed: Patterns.PatternSpeed,
    pattern_stars: Patterns.PatternStars,
    pattern_wave: Patterns.PatternWave
  }
  def icon_name_to_module(icon_name) do
    @assets_map[:"#{icon_name}"]
  end

  def render(assigns) do
    ~H"""
    {{ @name && icon_name_to_module(@name) && live_component(@socket, icon_name_to_module(@name), color: @color, height: @height, width: @width, font_size: @font_size, vertical_align: @vertical_align, click: @click, class: @class) }}
    """
  end
end
