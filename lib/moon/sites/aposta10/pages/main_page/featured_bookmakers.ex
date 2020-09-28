defmodule Moon.Sites.Aposta10.Pages.MainPage.FeaturedBookmakers do
  use Moon.StatelessComponent

  alias Moon.Components.Text
  alias Moon.Components.Button
  alias Moon.Components.Carousel

  alias Moon.Sites.Aposta10.Pages.MainPage.FeaturedBookmakers.Item

  def render(assigns) do
    ~H"""
    <style>
      .site-body-featured-bookmakers {
        padding-top: 10px;
        padding-bottom: 20px;
      }
    </style>

    <div class="site-body-featured-bookmakers">
      <Text size=20 style="padding: 20px; position: relative; display: inline-block;">
        Featured Bookmakers
        <Text size=12 color="#38A174" style="position: absolute; right: 0px; top: 20px;">
          12
        </Text>
      </Text>
      <Carousel style="padding: 10px;">
        <Item
          logo="sportsbet.io.svg"
          description="Welcome to Sportsbet.io, a Bitcoin Sportsbook, which focuses on 3 core principals: fast, fun and fair. Our team continues to work hard to make something special for all sports fans and bitcoin users and we hope you are enjoying it."
          action="Create account"
        />
        <Item
          logo="sportsbet.io.svg"
          description="Welcome to Sportsbet.io, a Bitcoin Sportsbook, which focuses on 3 core principals: fast, fun and fair. Our team continues to work hard to make something special for all sports fans and bitcoin users and we hope you are enjoying it."
          action="Create account"
        />
        <Item
          logo="sportsbet.io.svg"
          description="Welcome to Sportsbet.io, a Bitcoin Sportsbook, which focuses on 3 core principals: fast, fun and fair. Our team continues to work hard to make something special for all sports fans and bitcoin users and we hope you are enjoying it."
          action="Create account"
        />
        <Item
          logo="sportsbet.io.svg"
          description="Welcome to Sportsbet.io, a Bitcoin Sportsbook, which focuses on 3 core principals: fast, fun and fair. Our team continues to work hard to make something special for all sports fans and bitcoin users and we hope you are enjoying it."
          action="Create account"
        />
      </Carousel>
      <div style="padding: 10px">
        <Button margin="10px">See all</Button>
      </div>
    </div>
    """
  end
end
