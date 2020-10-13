defmodule Moon.Sites.MoonDocs.Pages.Assets.PatternsPage do
  use Moon.LiveView
  use Moon.Components.Context

  alias Moon.Sites.MoonDocs.Layouts.DefaultLayout
  alias Moon.Themed
  alias Moon.Components.Inline

  alias Moon.Assets.Patterns
  alias Patterns.PatternCircles
  alias Patterns.PatternLines
  alias Patterns.PatternRipple
  alias Patterns.PatternSpeed
  alias Patterns.PatternStars
  alias Patterns.PatternWave

  data(theme, :any, default: %Moon.Sites.MoonDocs.Themes.Light{})

  def render(assigns) do
    code_as_string = """
      <Inline>
        
        <PatternCircles color="piccolo_100" height="1rem" width="1rem" />
        <PatternLines color="piccolo_100" height="1rem" width="1rem" />
        <PatternRipple color="piccolo_100" height="1rem" width="1rem" />
        <PatternSpeed color="piccolo_100" height="1rem" width="1rem" />
        <PatternStars color="piccolo_100" height="1rem" width="1rem" />
        <PatternWave color="piccolo_100" height="1rem" width="1rem" />
      </Inline>
    """

    ~H"""
    <Themed theme={{ @theme }}>
      <DefaultLayout id="moondocs" user_token={{ "user_token" }}>
        <Inline>
          
          <PatternCircles color="piccolo_100" height="1rem" width="1rem" />
          <PatternLines color="piccolo_100" height="1rem" width="1rem" />
          <PatternRipple color="piccolo_100" height="1rem" width="1rem" />
          <PatternSpeed color="piccolo_100" height="1rem" width="1rem" />
          <PatternStars color="piccolo_100" height="1rem" width="1rem" />
          <PatternWave color="piccolo_100" height="1rem" width="1rem" />
        </Inline>
        <pre>{{ code_as_string }}</pre>
      </DefaultLayout>
    </Themed>
    """
  end
end
