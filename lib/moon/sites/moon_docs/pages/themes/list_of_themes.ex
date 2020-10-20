defmodule Moon.Sites.MoonDocs.Pages.Themes.ListOfThemes do
  use Moon.LiveView
  use Moon.Components.Context

  alias Moon.Sites.MoonDocs.Layouts.DefaultLayout
  alias Moon.Themed
  alias Moon.Components.Link

  data(theme, :any, default: Moon.Themes.SportsbetLight.get_config())

  def render(assigns) do
    ~H"""
    <Themed theme={{ @theme }}>
      <DefaultLayout id="moondocs" user_token={{ "user_token" }}>
        <h1>Themes</h1>

        <p>
          <Link to="https://github.com/coingaming/moon/tree/master/lib/moon/themes">https://github.com/coingaming/moon/tree/master/lib/moon/themes</Link>
        </p>

        <p>
          1. Values should not be hard-coded, but paddings, margings, colors come from theme. <br />
          2. Themes should base on Moon.Theme for type hinting. <br />
        </p>

      </DefaultLayout>
    </Themed>
    """
  end
end
