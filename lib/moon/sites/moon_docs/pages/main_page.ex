defmodule Moon.Sites.MoonDocs.Pages.MainPage do
  use Moon.LiveView
  use Moon.Components.Context

  alias Moon.Sites.MoonDocs.Layouts.DefaultLayout

  def render(assigns) do
    ~H"""
    <DefaultLayout id="moondocs">
      Hello
    </DefaultLayout>
    """
  end
end
