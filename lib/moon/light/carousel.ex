defmodule Moon.Light.Carousel do
  @moduledoc false
  alias Phoenix.LiveView.JS
  use Moon.Light.LiveComponent
  @doc "Data-testid attribute for DOM element"
  attr(:testid, :string)
  @doc "Additional Tailwind classes"
  attr(:class, :css_class)
  @doc "Index of selected item"
  attr(:value, :integer, default: 0)
  @doc "The function to call when reel is updated"
  attr(:on_change, :event)
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
    ~F"""
    <div
      id={@id}
      class={merge(["relative w-full ", @class])}
      data-testid={@testid}
      :hook="default"
      data-autoslide_delay={@autoslide_delay}
      data-step={@step}
      data-value={@value}
    >
      <#slot />
      <#slot
        {@left_arrow}
        context_put={
          value: @value - @step,
          on_change: @on_change || JS.dispatch("triggerLeftArrowClick", detail: %{})
        }
      />
      <#slot
        {@reel}
        context_put={
          value: @value,
          autoslide_delay: @autoslide_delay,
          on_change: @on_change || %{name: "set_selected_index", target: @myself}
        }
      />
      <#slot
        {@right_arrow}
        context_put={
          value: @value + @step,
          on_change: @on_change || JS.dispatch("triggerRightArrowClick", detail: %{})
        }
      />
    </div>
    """
  end

  def handle_event("set_selected_index", %{"value" => item}, socket) do
    new_value = String.to_integer(item)
    {:noreply, assign(socket, value: new_value)}
  end
end
