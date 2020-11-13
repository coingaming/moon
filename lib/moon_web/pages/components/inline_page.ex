defmodule MoonWeb.Pages.Components.InlinePage do
  use Moon.LiveView
  use Moon.Components.Context

  alias MoonWeb.Layouts.DefaultLayout
  alias Moon.Themed
  alias Moon.Components.Inline

  data(theme, :any, default: Moon.Themes.SportsbetLight.get_config())

  def render(assigns) do
    ~H"""
    <Themed theme={{ @theme }}>
      <DefaultLayout id="moondocs" user_token={{ "user_token" }}>
        <Inline>
          <div>a</div>
          <div>b</div>
        </Inline>
      </DefaultLayout>
    </Themed>
    """
  end
end
