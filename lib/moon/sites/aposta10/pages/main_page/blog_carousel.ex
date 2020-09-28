defmodule Moon.Sites.Aposta10.Pages.MainPage.BlogCarousel do
  use Moon.StatelessComponent
  alias Moon.Sites.Aposta10.Pages.MainPage.BlogCarousel
  alias BlogCarousel.Item
  alias Moon.Components.Carousel
  alias Moon.Components.Text
  alias Moon.Components.Button

  def render(assigns) do
    ~H"""
    <style>
      .site-body-blog-carousel {
        padding-top: 10px;
        padding-bottom: 30px;
      }
    </style>

    <div class="site-body-blog-carousel">
      <Text size=20 style="padding: 20px;">Latest from blog</Text>
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
      <div style="padding: 10px">
        <Button margin="10px">See all</Button>
      </div>
    </div>
    """
  end
end
