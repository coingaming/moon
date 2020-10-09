defmodule Moon.Sites.MoonDocs.Pages.Components.BadgePage do
  use Moon.LiveView
  use Moon.Components.Context

  alias Moon.Sites.MoonDocs.Layouts.DefaultLayout
  alias Moon.Themed
  alias Moon.Components.Badge
  alias Moon.Components.Inline

  data theme, :any, default: %Moon.Sites.MoonDocs.Themes.Light{}

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

        <pre>{{ code_as_string }}</pre>
      </DefaultLayout>
    </Themed>
    """
  end
end
