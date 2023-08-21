defmodule MoonWeb.Examples.Design.CarouselExample.Spaces do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Carousel
  alias Moon.Icon

  def render(assigns) do
    ~F"""
    <Carousel id="spaces" step={2}>
      <Carousel.LeftArrow>
        <Icon name="controls_chevron_left_small" class="text-moon-24" />
      </Carousel.LeftArrow>
      <Carousel.Reel class="gap-10">
        <Carousel.Item class="w-80 h-48">
          0
        </Carousel.Item>
        <Carousel.Item class="w-80 h-48">
          1
        </Carousel.Item>
        <Carousel.Item class="w-80 h-48">
          2
        </Carousel.Item>
        <Carousel.Item class="w-80 h-48">
          3
        </Carousel.Item>
        <Carousel.Item class="w-80 h-48">
          4
        </Carousel.Item>
      </Carousel.Reel>
      <Carousel.RightArrow>
        <Icon name="controls_chevron_right_small" class="text-moon-24" />
      </Carousel.RightArrow>
    </Carousel>
    """
  end

  def code() do
    """
    alias Moon.Design.Carousel
    alias Moon.Icon

    ...

    <Carousel id="spaces" step={2}>
      <Carousel.LeftArrow>
        <Icon name="controls_chevron_left_small" class="text-moon-24" />
      </Carousel.LeftArrow>
      <Carousel.Reel class="gap-10">
        <Carousel.Item class="w-80 h-48">
          0
        </Carousel.Item>
        <Carousel.Item class="w-80 h-48">
          1
        </Carousel.Item>
        <Carousel.Item class="w-80 h-48">
          2
        </Carousel.Item>
        <Carousel.Item class="w-80 h-48">
          3
        </Carousel.Item>
        <Carousel.Item class="w-80 h-48">
          4
        </Carousel.Item>
      </Carousel.Reel>
      <Carousel.RightArrow>
        <Icon name="controls_chevron_right_small" class="text-moon-24" />
      </Carousel.RightArrow>
    </Carousel>
    """
  end
end
