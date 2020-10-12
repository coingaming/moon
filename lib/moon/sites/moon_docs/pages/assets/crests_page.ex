defmodule Moon.Sites.MoonDocs.Pages.Assets.CrestsPage do
  use Moon.LiveView
  use Moon.Components.Context

  alias Moon.Sites.MoonDocs.Layouts.DefaultLayout
  alias Moon.Themed
  alias Moon.Components.Inline

  alias Moon.Assets.Crests
  alias Crests.CrestArsenal
  alias Crests.CrestFlamengo
  alias Crests.CrestSouthampton
  alias Crests.CrestWatford

  data theme, :any, default: %Moon.Sites.MoonDocs.Themes.Light{}

  def render(assigns) do
    code_as_string = """
      <Inline>

        <CrestArsenal color="piccolo_100" height="1rem" width="1rem" />
        <CrestFlamengo color="piccolo_100" height="1rem" width="1rem" />
        <CrestSouthampton color="piccolo_100" height="1rem" width="1rem" />
        <CrestWatford color="piccolo_100" height="1rem" width="1rem" />
      </Inline>
    """

    ~H"""
    <Themed theme={{ @theme }}>
      <DefaultLayout id="moondocs" user_token={{ "user_token" }}>
        <Inline>

          <CrestArsenal color="piccolo_100" height="1rem" width="1rem" />
          <CrestFlamengo color="piccolo_100" height="1rem" width="1rem" />
          <CrestSouthampton color="piccolo_100" height="1rem" width="1rem" />
          <CrestWatford color="piccolo_100" height="1rem" width="1rem" />
        </Inline>
        <pre>{{ code_as_string }}</pre>
      </DefaultLayout>
    </Themed>
    """
  end
end
