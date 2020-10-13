defmodule Moon.Sites.MoonDocs.Pages.Components.StackPage do
  use Moon.LiveView
  use Moon.Components.Context

  alias Moon.Sites.MoonDocs.Layouts.DefaultLayout
  alias Moon.Themed
  alias Moon.Components.Stack

  data(theme, :any, default: %Moon.Sites.MoonDocs.Themes.Light{})

  def render(assigns) do
    code_as_string = """
      <Stack>
        <div>a</div>
        <div>b</div>
      </Stack>
    """

    ~H"""
    <Themed theme={{ @theme }}>
      <DefaultLayout id="moondocs" user_token={{ "user_token" }}>
        <Stack>
          <div>a</div>
          <div>b</div>
        </Stack>
        <pre>{{ code_as_string }}</pre>
      </DefaultLayout>
    </Themed>
    """
  end
end
