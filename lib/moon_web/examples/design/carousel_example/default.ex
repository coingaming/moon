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
      <Carousel id="default" value={13} step={5}>
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

    prop(value, :integer, default: 0)

    defp get_items(item_count) do
      0..item_count
      |> Enum.to_list()
    end

    def render(assigns) do
      ~F\"""
      <div class="relative w-full">
        <Carousel id="default" value={@value} on_change="set_selected_index" step={5}>
          <Carousel.LeftArrow>
            <ControlsChevronLeft />
          </Carousel.LeftArrow>
          <Carousel.Reel>
            <Carousel.Item
              class="w-80 h-48"
              :for={item <- get_items(@item_count)}
              value={item}
              is_active={item == @value}
            >
              {item}
            </Carousel.Item>
          </Carousel.Reel>
          <Carousel.RightArrow>
            <ControlsChevronRight />
          </Carousel.RightArrow>
        </Carousel>
      </div>
      \"""
    end

    def handle_event("set_selected_index", %{"value" => item}, socket) do
      socket = assign(socket, value: String.to_integer(item))
      {:noreply, socket}
    end
    """
  end
end
