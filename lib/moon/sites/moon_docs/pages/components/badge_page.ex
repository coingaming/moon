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
    ~H"""
    <Themed theme={{ @theme }}>
      <DefaultLayout id="moondocs" user_token={{ "user_token" }}>
        <p>
          <h1>Badge</h1>
          Default size count and labeling component
        </p>

        <Badge color="bulma_100" background_color="dodoria_100">
          Active
        </Badge>

        <#CodePreview>
          <Badge color="bulma_100" background_color="dodoria_100">
            Active
          </Badge>
        </#CodePreview>
      </DefaultLayout>
    </Themed>
    """
  end
end
