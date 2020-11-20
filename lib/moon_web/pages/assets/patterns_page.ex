
defmodule MoonWeb.Pages.Assets.PatternsPage do
  use Moon.LiveView

  alias Moon.Components.Inline
  alias Moon.Components.CodePreview

  alias Moon.Assets.Patterns
  alias Patterns.PatternCircles
  alias Patterns.PatternLines
  alias Patterns.PatternRipple
  alias Patterns.PatternSpeed
  alias Patterns.PatternStars
  alias Patterns.PatternWave

  def render(assigns) do
    ~H"""
    <Inline font_size="10em">
      <PatternCircles />
      <PatternLines />
      <PatternRipple />
      <PatternSpeed />
      <PatternStars />
      <PatternWave />
    </Inline>
    <#CodePreview>
      <Inline font_size="10em">
        <PatternCircles />
        <PatternLines />
        <PatternRipple />
        <PatternSpeed />
        <PatternStars />
        <PatternWave />
      </Inline>
    </#CodePreview>
    """
  end
end
    