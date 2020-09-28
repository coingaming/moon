defmodule Moon.Sites.Aposta10.Pages.MainPage.BannerCarousel.Item do
  use Moon.StatelessComponent
  alias Moon.Sites.Aposta10.Pages.MainPage.BannerCarousel.ItemMobile
  alias Moon.Sites.Aposta10.Pages.MainPage.BannerCarousel.ItemDesktop

  property label, :string
  property datetime, :string
  property title, :string
  property desc, :string
  property image_url, :string

  def render(assigns) do
    ~H"""
    <ItemMobile label={{ @label }} datetime={{ @datetime }} title={{ @title }} desc={{ @desc }} image_url={{ @image_url }} />
    <ItemDesktop label={{ @label }} datetime={{ @datetime }} title={{ @title }} desc={{ @desc }} image_url={{ @image_url }} />
    """
  end
end
