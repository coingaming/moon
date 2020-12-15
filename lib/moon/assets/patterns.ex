defmodule Moon.Assets.Pattern do
  use Moon.StatelessComponent
  alias Moon.Assets.Pattern

  prop(name, :string)

  prop(color, :string, values: Moon.colors())
  prop(height, :string)
  prop(width, :string)
  prop(font_size, :string)
  prop(vertical_align, :string)

  @assets_map %{
    pattern_circles: Pattern.PatternCircles,
    pattern_lines: Pattern.PatternLines,
    pattern_ripple: Pattern.PatternRipple,
    pattern_speed: Pattern.PatternSpeed,
    pattern_stars: Pattern.PatternStars,
    pattern_wave: Pattern.PatternWave
  }
  def icon_name_to_module(icon_name) do
    @assets_map[:"#{icon_name}"]
  end

  def render(assigns) do
    ~H"""
    {{ @name && icon_name_to_module(@name) && live_component(@socket, icon_name_to_module(@name), color: @color, height: @height, width: @width, font_size: @font_size, vertical_align: @vertical_align) }}
    """
  end
end
