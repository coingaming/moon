defmodule Moon.Sites.MoonDocs.Pages.Components.LinkPage do
  use Moon.LiveView
  use Moon.Components.Context

  alias Moon.Sites.MoonDocs.Layouts.DefaultLayout
  alias Moon.Themed
  alias Moon.Components.Link
  alias Moon.Components.CodePreview

  data(theme, :any, default: Moon.Themes.SportsbetLight.get_config())

  def render(assigns) do
    ~H"""
    <Themed theme={{ @theme }}>
      <DefaultLayout id="moondocs" user_token={{ "user_token" }}>
        <Link to="#">I'm a link</Link>

        <Link to="#" secondary>
          I'm a Secondary link
        </Link>

        <Link to="#" optional>
          I'm an Optional link
        </Link>

        <Link to="#" as="button">I look like a link, but really I'm a button</Link>

        <Link to="#" disabled>
          I'm a disabled link
        </Link>

        <#CodePreview>
          <Link to="#">I'm a link</Link>

          <Link to="#" secondary>
            I'm a Secondary link
          </Link>

          <Link to="#" optional>
            I'm an Optional link
          </Link>

          <Link to="#" as="button">I look like a link, but really I'm a button</Link>

          <Link to="#" disabled>
            I'm a disabled link
          </Link>
        </#CodePreview>
      </DefaultLayout>
    </Themed>
    """
  end
end
