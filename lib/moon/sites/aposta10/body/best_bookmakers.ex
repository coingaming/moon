defmodule Moon.Sites.Aposta10.Body.BestBookmakers do
  use Moon.StatelessComponent
  alias Moon.Sites.Aposta10.Body.BestBookmakers
  alias BestBookmakers.Item
  alias Moon.Components.Carousel
  alias Moon.Components.Text
  alias Moon.Components.Button

  def render(assigns) do
    class_name = get_class_name("site-body-best-bookmakers")

    ~H"""
    <style>
      .{{ class_name }} {
        padding-top: 10px;
        padding-bottom: 30px;
      }
    </style>

    <div class={{ class_name }}>
      <Text size=20 style="padding: 20px;">Best bookmakers</Text>

      <Carousel style="padding: 10px;">
        <Item
          image_url="sportsbet.io.svg"
        />
        <Item
          image_url="sportsbet.io.svg"
        />
        <Item
          image_url="sportsbet.io.svg"
        />
        <Item
          image_url="sportsbet.io.svg"
        />
        <Item
          image_url="sportsbet.io.svg"
        />
        <Item
          image_url="sportsbet.io.svg"
        />

        <br />
        <Item
          image_url="sportsbet.io.svg"
        />
        <Item
          image_url="sportsbet.io.svg"
        />
        <Item
          image_url="sportsbet.io.svg"
        />
        <Item
          image_url="sportsbet.io.svg"
        />
        <Item
          image_url="sportsbet.io.svg"
        />
        <Item
          image_url="sportsbet.io.svg"
        />
      </Carousel>
      <div style="padding: 10px">
        <Button margin="10px">See all</Button>
      </div>
    </div>
    """
  end
end
