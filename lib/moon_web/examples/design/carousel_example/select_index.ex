defmodule MoonWeb.Examples.Design.CarouselExample.SelectIndex do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Design.MenuItem
  alias Moon.Design.Carousel

  prop(item_count, :integer, default: 4)

  prop(value, :integer, default: 0)

  defp get_items(item_count) do
    0..item_count
    |> Enum.to_list()
  end

  def render(assigns) do
    ~F"""
    <div class="flex flex-col items-center gap-4">
      <div class="flex gap-1">
        <MenuItem
          class="px-4"
          :for={item <- get_items(@item_count)}
          value={item}
          is_active={item == @value}
          on_click="set_selected_index"
        >
          {item}
        </MenuItem>
      </div>
      <Carousel class="w-80" id="selected_index" value={@value}>
        <Carousel.Reel class="overflow-x-hidden">
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
      </Carousel>
    </div>
    """
  end

  def handle_event("set_selected_index", %{"value" => item}, socket) do
    socket = assign(socket, value: String.to_integer(item))
    {:noreply, socket}
  end

  def code() do
    """
    alias Moon.Design.MenuItem
    alias Moon.Design.Carousel

    prop(item_count, :integer, default: 4)

    prop(value, :integer, default: 0)

    defp get_items(item_count) do
      0..item_count
      |> Enum.to_list()
    end

    def render(assigns) do
      ~F\"""
      <div class="flex flex-col items-center gap-4">
        <div class="flex gap-1">
          <MenuItem
            class="px-4"
            :for={item <- get_items(@item_count)}
            value={item}
            is_active={item == @value}
            on_click="set_selected_index"
          >
            {item}
          </MenuItem>
        </div>
        <Carousel class="w-80" id="selected_index" value={@value}>
          <Carousel.Reel class="overflow-x-hidden">
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
