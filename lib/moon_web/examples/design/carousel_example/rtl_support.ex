defmodule MoonWeb.Examples.Design.CarouselExample.RtlSupport do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Icon
  alias Moon.Design.Carousel

  def render(assigns) do
    ~F"""
    <div class="flex flex-wrap items-center justify-around w-full" dir="rtl">
      <Carousel id="rtl_support" is_rtl>
        <Carousel.LeftArrow>
          <Icon name="controls_chevron_left_small" class="text-moon-24 rtl:rotate-180" />
        </Carousel.LeftArrow>
        <Carousel.Reel>
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
          <Icon name="controls_chevron_right_small" class="text-moon-24 rtl:rotate-180" />
        </Carousel.RightArrow>
      </Carousel>
    </div>
    """
  end

  def code() do
    """
    alias Moon.Icon
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
            <Icon name="controls_chevron_left_small" class="text-moon-24" />
          </Carousel.LeftArrow>
          <Carousel.Reel>
            <Carousel.Item class="w-80 h-48" :for={item <- get_items(@item_count)}>
              {item}
            </Carousel.Item>
            <Carousel.Indicator />
          </Carousel.Reel>
          <Carousel.RightArrow>
            <Icon name="controls_chevron_right_small" class="text-moon-24" />
          </Carousel.RightArrow>
        </Carousel>
      </div>
      \"""
    end
    """
  end
end
