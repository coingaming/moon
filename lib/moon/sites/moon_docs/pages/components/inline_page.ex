defmodule Moon.Sites.MoonDocs.Pages.Components.InlinePage do
  use Moon.LiveView
  use Moon.Components.Context

  alias Moon.Sites.MoonDocs.Layouts.DefaultLayout
  alias Moon.Themed
  alias Moon.Components.Inline

  data(theme, :any, default: %Moon.Sites.MoonDocs.Themes.Light{})

  def render(assigns) do
    code_as_string = """
      <Inline>
        <div>a</div>
        <div>b</div>
      </Inline>
    """

    ~H"""
    <Themed theme={{ @theme }}>
      <DefaultLayout id="moondocs" user_token={{ "user_token" }}>
        <Inline>
          <div>a</div>
          <div>b</div>
        </Inline>
        <pre>{{ code_as_string }}</pre>
      </DefaultLayout>
    </Themed>
    """
  end
end
