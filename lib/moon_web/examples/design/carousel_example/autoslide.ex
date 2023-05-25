defmodule MoonWeb.Examples.Design.CarouselExample.Autoslide do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Carousel

  prop(item_count, :integer, default: 25)

  defp get_items(item_count) do
    0..item_count
    |> Enum.to_list()
  end

  def render(assigns) do
    ~F"""
    <div class="relative w-full">
      <Carousel id="autoslide" autoslide_delay={3000} step={1}>
        <Carousel.Reel>
          <Carousel.Item class="w-80 h-48" :for={item <- get_items(@item_count)}>
            {item}
          </Carousel.Item>
          <Carousel.Indicator />
        </Carousel.Reel>
      </Carousel>
    </div>
    """
  end

  def code() do
    """

    """
  end
end
