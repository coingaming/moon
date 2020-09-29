defmodule Moon.Sites.MoonDocs.Pages.MainPage do
  use Moon.LiveView
  use Moon.Components.Context

  alias Moon.Sites.MoonDocs.Layouts.DefaultLayout

  def mount(socket) do
    socket = Surface.init(socket)
    IO.puts(inspect(socket))
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <DefaultLayout id="moondocs" user_token={{ "user_token" }}>
      {{ inspect(@socket) }}
    </DefaultLayout>
    """
  end
end
