
defmodule MoonWeb.Pages.Assets.PatternsPage do
  use MoonWeb, :live_view

  alias Moon.Components.Inline
  alias Moon.Components.CodePreview

  alias Moon.Assets.Patterns
  alias Patterns.PatternCircles
  alias Patterns.PatternLines
  alias Patterns.PatternRipple
  alias Patterns.PatternSpeed
  alias Patterns.PatternStars
  alias Patterns.PatternWave

  def mount(params, _session, socket) do
    {:ok, assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

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
