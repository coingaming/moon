defmodule Moon.Sites.MoonDocs.Pages.Components.InlinePage do
  use Moon.LiveView
  use Moon.Components.Context

  alias Moon.Sites.MoonDocs.Layouts.DefaultLayout
  alias Moon.Themed
  alias Moon.Components.Button

  data theme, :any, default: %Moon.Sites.MoonDocs.Themes.Light{}

  def render(assigns) do
    code_as_string = """
      <Button>Hello<Button>
    """

    ~H"""
    <Themed theme={{ @theme }}>
      <DefaultLayout id="moondocs" user_token={{ "user_token" }}>
        <Button>Hello</Button>
        <pre>{{ code_as_string }}</pre>
      </DefaultLayout>
    </Themed>
    """
  end
end
