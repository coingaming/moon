defmodule MoonWeb.Examples.Design.CarouselExample.Default do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Icons.ControlsChevronRight
  alias Moon.Icons.ControlsChevronLeft
  alias Moon.Design.Carousel

  prop(item_count, :integer, default: 25)

  defp get_items(item_count) do
    0..item_count
    |> Enum.to_list()
  end

  def render(assigns) do
    ~F"""
    <div class="relative w-full">
      <Carousel id="default" value={6} step={5}>
        <Carousel.LeftArrow>
          <ControlsChevronLeft />
        </Carousel.LeftArrow>
        <Carousel.Reel>
          <Carousel.Item class="w-80 h-48" :for={item <- get_items(@item_count)}>
            {item}
          </Carousel.Item>
          <Carousel.Indicator />
        </Carousel.Reel>
        <Carousel.RightArrow>
          <ControlsChevronRight />
        </Carousel.RightArrow>
      </Carousel>
    </div>
    """
  end

  def code() do
    """
    alias Moon.Icons.ControlsChevronRight
    alias Moon.Icons.ControlsChevronLeft
    alias Moon.Design.Carousel

    prop(item_count, :integer, default: 25)

    defp get_items(item_count) do
      0..item_count
      |> Enum.to_list()
    end

    def render(assigns) do
      ~F\"""
      <div class="relative w-full">
        <Carousel id="default" value={6} step={5}>
          <Carousel.LeftArrow>
            <ControlsChevronLeft />
          </Carousel.LeftArrow>
          <Carousel.Reel>
            <Carousel.Item class="w-80 h-48" :for={item <- get_items(@item_count)}>
              {item}
            </Carousel.Item>
            <Carousel.Indicator />
          </Carousel.Reel>
          <Carousel.RightArrow>
            <ControlsChevronRight />
          </Carousel.RightArrow>
        </Carousel>
      </div>
      \"""
    end
    """
  end
end
