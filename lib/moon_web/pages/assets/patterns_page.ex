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
    <Inline>
      <PatternCircles color="piccolo_100" height="1rem" width="1rem" />
        <PatternLines color="piccolo_100" height="1rem" width="1rem" />
        <PatternRipple color="piccolo_100" height="1rem" width="1rem" />
        <PatternSpeed color="piccolo_100" height="1rem" width="1rem" />
        <PatternStars color="piccolo_100" height="1rem" width="1rem" />
        <PatternWave color="piccolo_100" height="1rem" width="1rem" />
    </Inline>
    <#CodePreview>
      <Inline>

        <PatternCircles color="piccolo_100" height="1rem" width="1rem" />
        <PatternLines color="piccolo_100" height="1rem" width="1rem" />
        <PatternRipple color="piccolo_100" height="1rem" width="1rem" />
        <PatternSpeed color="piccolo_100" height="1rem" width="1rem" />
        <PatternStars color="piccolo_100" height="1rem" width="1rem" />
        <PatternWave color="piccolo_100" height="1rem" width="1rem" />
      </Inline>
    </#CodePreview>
    """
  end
end
