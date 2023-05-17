defmodule MoonWeb.Examples.Design.CarouselExample.Spaces do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Icons.ControlsChevronRight
  alias Moon.Icons.ControlsChevronLeft
  alias Moon.Design.Carousel

  def render(assigns) do
    ~F"""
    <Carousel id="spaces" step={2}>
      <Carousel.LeftArrow>
        <ControlsChevronLeft />
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
        <ControlsChevronRight />
      </Carousel.RightArrow>
    </Carousel>
    """
  end

  def code() do
    """
    alias Moon.Icons.ControlsChevronRight
    alias Moon.Icons.ControlsChevronLeft
    alias Moon.Design.Carousel

    ...

    <Carousel id="spaces" step={2}>
      <Carousel.LeftArrow>
        <ControlsChevronLeft />
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
        <ControlsChevronRight />
      </Carousel.RightArrow>
    </Carousel>
    """
  end
end
