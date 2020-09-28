defmodule Moon.Sites.Aposta10.Pages.MainPage do
  use Moon.LiveView

  alias Moon.Themed
  alias Moon.Sites.Aposta10.Header
  alias Moon.Sites.Aposta10.Body

  data theme, :any, default: Moon.Sites.Aposta10.Themes.Light

  def render(assigns) do
    ~H"""
    <Themed theme={{ @theme }}>
      <Header />
      <Body />
    </Themed>
    """
  end
end
