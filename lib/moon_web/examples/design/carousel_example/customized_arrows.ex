defmodule MoonWeb.Examples.Design.CarouselExample.CustomizedArrows do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Carousel
  alias Phoenix.LiveView.JS

  prop(item_count, :integer, default: 25)

  defp get_items(item_count) do
    0..item_count
    |> Enum.to_list()
  end

  def render(assigns) do
    ~F"""
    <div class="relative w-full">
      <Carousel id="customized_arrows" value={5} step={5}>
        <button :on-click={JS.dispatch(
          "triggerLeftArrowClick",
          detail: %{}
        )}>
          Scroll to left
        </button>
        <button
          :on-click={JS.dispatch(
            "triggerRightArrowClick",
            detail: %{}
          )}
          class="absolute end-0"
        >
          Scroll to right
        </button>
        <Carousel.Reel>
          <Carousel.Item class="w-80 h-48" :for={item <- get_items(@item_count)}>
            {item}
          </Carousel.Item>
        </Carousel.Reel>
      </Carousel>
    </div>
    """
  end

  def code() do
    """
    alias Moon.Design.Carousel

    prop(item_count, :integer, default: 25)

    prop(step, :integer, default: 5)

    prop(value, :integer, default: 0)

    defp get_items(item_count) do
      0..item_count
      |> Enum.to_list()
    end

    def render(assigns) do
      ~F\"""
      <div class="relative w-full">
        <Carousel id="customized_arrows" value={@value}>
          <button :on-click="set_selected_index" value={@value - @step}>
            Scroll to left
          </button>
          <button :on-click="set_selected_index" value={@value + @step} class="absolute end-0">
            Scroll to right
          </button>
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
