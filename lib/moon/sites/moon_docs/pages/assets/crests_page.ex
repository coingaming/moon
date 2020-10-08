defmodule Moon.Sites.MoonDocs.Pages.Assets.CrestsPage do
  use Moon.LiveView
  use Moon.Components.Context

  alias Moon.Sites.MoonDocs.Layouts.DefaultLayout
  alias Moon.Themed

  data theme, :any, default: %Moon.Sites.MoonDocs.Themes.Light{}

  def mount(socket) do
    socket = Surface.init(socket)
    IO.puts(inspect(socket))
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <Themed theme={{ @theme }}>
      <DefaultLayout id="moondocs" user_token={{ "user_token" }}>
        Crests
      </DefaultLayout>
    </Themed>
    """
  end
end
