defmodule Moon.Assets.Patterns do
  use Moon.StatelessComponent

  alias Moon.Assets.Patterns

  property name, :string
  property color, :string
  property background_color, :string

  def icon_name_to_module(icon_name) do
    %{
      circles: Patterns.PatternCircles,
      lines: Patterns.PatternLines,
      ripple: Patterns.PatternRipple,
      speed: Patterns.PatternSpeed,
      stars: Patterns.PatternStars,
      wave: Patterns.PatternWave
    }[:"#{icon_name}"]
  end

  def render(assigns) do
    ~H"""
    {{ @name && icon_name_to_module(@name) && live_component(@socket, icon_name_to_module(@name), color: @color, background_color: @background_color) }}
    """
  end
end
