defmodule Moon.Sites.Aposta10.Pages.MainPage.Aposta10Academy do
  use Moon.StatelessComponent

  alias Moon.Sites.Aposta10.Pages.MainPage.Aposta10Academy.Item
  alias Moon.Components.Carousel
  alias Moon.Components.Text
  alias Moon.Components.Button

  def render(assigns) do
    ~H"""
    <style>
      .site-body-aposta10-academy {
        background-color: #38A174;
        color: #fff;
        padding-top: 10px;
        border-radius: 18px;
      }
    </style>

    <div class="site-body-aposta10-academy">
      <div style="padding: 10px; text-align: center;">
        <Text size=20 style="padding-bottom: 20px;">Aposta10 Academy</Text>
        <Text>Looking to score some extra coins, win daily challenges, and unlock exciting...</Text>
      </div>
      <Carousel>
        <Item
          label="Beginner"
          length="2h 54min"
          title="Beginner: First step"
          image_url="mob-hero-bg.svg"
        />
        <Item
          label="Beginner"
          length="2h 54min"
          title="Beginner: First step"
          image_url="mob-hero-bg.svg"
        />
        <Item
          label="Beginner"
          length="2h 54min"
          title="Beginner: First step"
          image_url="mob-hero-bg.svg"
        />
        <Item
          label="Beginner"
          length="2h 54min"
          title="Beginner: First step"
          image_url="mob-hero-bg.svg"
        />
        <Item
          label="Beginner"
          length="2h 54min"
          title="Beginner: First step"
          image_url="mob-hero-bg.svg"
        />
      </Carousel>

      <div style="padding: 10px">
        <Button style="color: #38A174; background-color: #fff;">See all courses</Button>
      </div>
    </div>
    """
  end
end
