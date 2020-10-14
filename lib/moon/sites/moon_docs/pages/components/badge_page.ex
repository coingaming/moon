defmodule Moon.Sites.MoonDocs.Pages.Components.BadgePage do
  use Moon.LiveView
  use Moon.Components.Context

  alias Moon.Sites.MoonDocs.Layouts.DefaultLayout
  alias Moon.Themed
  alias Moon.Components.Badge
  alias Moon.Components.Inline
  alias Moon.Components.CodePreview

  data(theme, :any, default: Moon.Themes.SportsbetLight.get_config())

  def render(assigns) do
    code_as_string = """
    <Inline>
      <Badge color="bulma_100" background_color="piccolo_100">
        Active
      </Badge>
      <Badge color="krillin_100" background_color="gohan_100">
        Active
      </Badge>
      <Badge color="bulma_100" background_color="dodoria_100">
        Active
      </Badge>
    </Inline>
    """

    ~H"""
    <Themed theme={{ @theme }}>
      <DefaultLayout id="moondocs" user_token={{ "user_token" }}>
        <Inline>
          <Badge color="bulma_100" background_color="piccolo_100">
            Active
          </Badge>
          <Badge color="krillin_100" background_color="gohan_100">
            Active
          </Badge>
          <Badge color="bulma_100" background_color="dodoria_100">
            Active
          </Badge>
        </Inline>

        <CodePreview code={{ code_as_string }} />
      </DefaultLayout>
    </Themed>
    """
  end
end
