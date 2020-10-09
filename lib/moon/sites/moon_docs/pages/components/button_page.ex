defmodule Moon.Sites.MoonDocs.Pages.Components.ButtonPage do
  use Moon.LiveView
  use Moon.Components.Context

  alias Moon.Sites.MoonDocs.Layouts.DefaultLayout
  alias Moon.Themed
  alias Moon.Components.Button
  alias Moon.Components.Inline

  data theme, :any, default: %Moon.Sites.MoonDocs.Themes.Light{}

  def render(assigns) do
    code_as_string = """
      <Inline>
        <Button variant="primary">Default</Button>
        <Button variant="secondary" size="small">Default</Button>
        <Button variant="primary" mock_state="hover">
          Hover
        </Button>
        <Button variant="primary" mock_state="active">
          Focus
        </Button>
        <Button variant="primary" disabled>
          Disabled
        </Button>
      </Inline>
    """

    ~H"""
    <Themed theme={{ @theme }}>
      <DefaultLayout id="moondocs" user_token={{ "user_token" }}>

        <Inline>
          <Button variant="primary">Default</Button>
          <Button variant="secondary" size="small">Default</Button>
          <Button variant="primary" mock_state="hover">
            Hover
          </Button>
          <Button variant="primary" mock_state="active">
            Focus
          </Button>
          <Button variant="primary" disabled>
            Disabled
          </Button>
        </Inline>

        <pre>{{ code_as_string }}</pre>
      </DefaultLayout>
    </Themed>
    """
  end
end
