defmodule Moon.Sites.Aposta10.Body.Guides do
  use Moon.StatelessComponent
  alias Moon.Sites.Aposta10.Body.Guides
  alias Guides.Item
  alias Moon.Components.Carousel

  def render(assigns) do
    ~H"""
    <style>
      .site-body-guides {
        padding-top: 10px;
        padding-bottom: 30px;
      }
    </style>

    <div class="site-body-guides">
      <Carousel style="padding: 10px;">
        <Item
          label="Guide"
          title="How to bet in Premier league"
          image_url="guide.svg"
        />
        <Item
          label="Guide"
          title="How to bet in Premier league"
          image_url="guide.svg"
        />
        <Item
          label="Guide"
          title="How to bet in Premier league"
          image_url="guide.svg"
        />
      </Carousel>
    </div>
    """
  end
end
