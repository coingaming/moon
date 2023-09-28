defmodule MoonWeb.Examples.Design.CarouselExample.Indicators do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Design.Carousel
  alias Moon.Icon

  prop(value, :integer, default: 0)

  def handle_event("set_selected_index", %{"value" => item}, socket) do
    socket = assign(socket, value: String.to_integer(item))
    {:noreply, socket}
  end

  def render(assigns) do
    ~F"""
    <div>
      <Carousel class="w-80" id="indicators" value={@value} on_change="set_selected_index">
        <Carousel.LeftArrow>
          <Icon name="controls_chevron_left_small" class="text-moon-24" />
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
          <Carousel.Indicator />
        </Carousel.Reel>
        <Carousel.RightArrow>
          <Icon name="controls_chevron_right_small" class="text-moon-24" />
        </Carousel.RightArrow>
      </Carousel>
    </div>
    """
  end

  def code() do
    """
    alias Moon.Design.Carousel
    alias Moon.Icon

    ...

    <Carousel class="w-80" id="indicators" value={1}>
      <Carousel.LeftArrow>
        <Icon name="controls_chevron_left_small" class="text-moon-24" />
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
        <Carousel.Indicator />
      </Carousel.Reel>
      <Carousel.RightArrow>
        <Icon name="controls_chevron_right_small" class="text-moon-24" />
      </Carousel.RightArrow>
    </Carousel>
    """
  end
end
