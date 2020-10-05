defmodule Moon.Sites.Aposta10.Pages.MainPage do
  use Moon.LiveView
  use Moon.Components.Context

  alias Moon.Sites.Aposta10.Layouts.DefaultLayout
  alias Moon.Sites.Aposta10.Pages.MainPage
  alias MainPage.BannerCarousel
  alias MainPage.Picks
  alias MainPage.FeaturedBookmakers
  alias MainPage.Aposta10Academy
  alias MainPage.BlogCarousel
  alias MainPage.Guides
  alias MainPage.BestBookmakers

  def render(assigns) do
    ~H"""
    <DefaultLayout id="main-page">
      <BannerCarousel />
      <Picks />
      <FeaturedBookmakers />
      <Aposta10Academy />
      <BlogCarousel />
      <Guides />
      <BestBookmakers />
    </DefaultLayout>
    """
  end
end
