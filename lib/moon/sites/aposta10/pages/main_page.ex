defmodule Moon.Sites.Aposta10.Pages.MainPage do
  use Moon.LiveView
  use Moon.Components.Context
  alias Moon.Themed

  alias Moon.Sites.Aposta10.Layouts.DefaultLayout
  alias Moon.Sites.Aposta10.Pages.MainPage
  alias MainPage.BannerCarousel
  alias MainPage.Picks
  alias MainPage.FeaturedBookmakers
  alias MainPage.Aposta10Academy
  alias MainPage.BlogCarousel
  alias MainPage.Guides
  alias MainPage.BestBookmakers

  data(theme, :any, default: Moon.Themes.SportsbetLight.get_config())

  def render(assigns) do
    ~H"""
    <Themed theme={{ @theme }}>
      <DefaultLayout id="main-page">
        <BannerCarousel  />
        <Picks />
        <FeaturedBookmakers />
        <Aposta10Academy />
        <BlogCarousel />
        <Guides />
        <BestBookmakers />
      </DefaultLayout>
    </Themed>
    """
  end
end
