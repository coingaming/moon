defmodule Moon.Light.Carousel do
  @moduledoc false
  alias Phoenix.LiveView.JS
  use Moon.Light.LiveComponent
  @doc "Data-testid attribute for DOM element"
  attr(:testid, :string)
  @doc "Additional Tailwind classes"
  attr(:class, :any)
  @doc "Index of selected item"
  attr(:value, :integer, default: 0)
  @doc "The function to call when reel is updated"
  attr(:on_change, :any)
  @doc "Step of scroll"
  attr(:step, :integer, default: 1)
  @doc "Interval of auto sliding in milliseconds. No auto sliding if undefined"
  attr(:autoslide_delay, :integer)
  @doc "Reel of Carousel component, see Carousel.Reel"
  slot(:reel)
  @doc "Left arrow of Carousel component, see Carousel.LeftArrow"
  slot(:left_arrow)
  @doc "Right arrow of Carousel component, see Carousel.RightArrow"
  slot(:right_arrow)
  @doc "Default slot of Carousel component, used for customized arrows"
  slot(:inner_block)

  def render(assigns) do
    ~H"""
    <div
      id={@id}
      class={merge(["relative w-full ", @class])}
      data-testid={@testid}
      phx-hook="default"
      data-autoslide_delay={@autoslide_delay}
      data-step={@step}
      data-value={@value}
    >
      <%= 1..10 |> Enum.join(" ") %>
      <%= render_slot(@inner_block) %>
      <%= render_slot(@left_arrow) %>
      <%= render_slot(@reel) %>
      <%= render_slot(@right_arrow) %>
    </div>
    """
  end

  def handle_event("set_selected_index", %{"value" => item}, socket) do
    new_value = String.to_integer(item)
    {:noreply, assign(socket, value: new_value)}
  end
end
