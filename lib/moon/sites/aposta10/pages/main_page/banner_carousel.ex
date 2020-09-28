defmodule Moon.Sites.Aposta10.Pages.MainPage.BannerCarousel do
  use Moon.StatelessComponent
  alias Moon.Sites.Aposta10.Pages.MainPage.BannerCarousel
  alias BannerCarousel.Item
  alias Moon.Components.Carousel

  def render(assigns) do
    ~H"""
    <style>
      .site-body-banner-carousel {
        padding-top: 10px;
        padding-bottom: 30px;
      }
    </style>

    <div class="site-body-banner-carousel">
      <Carousel>
        <Item
          label="Popular"
          datetime="Feb 7, 2019"
          title="Choose your own Price Boost on every sport, every day!"
          desc="Looking to score some extra coins, win daily challenges, and unlock exciting..."
          image_url="mob-hero-bg.svg"
        />
        <Item
          label="Popular"
          datetime="Feb 7, 2019"
          title="Choose your own Price Boost on every sport, every day!"
          desc="Looking to score some extra coins, win daily challenges, and unlock exciting..."
          image_url="mob-hero-bg.svg"
        />
        <Item
          label="Popular"
          datetime="Feb 7, 2019"
          title="Choose your own Price Boost on every sport, every day!"
          desc="Looking to score some extra coins, win daily challenges, and unlock exciting..."
          image_url="mob-hero-bg.svg"
        />
      </Carousel>
    </div>
    """
  end
end
