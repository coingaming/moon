defmodule Moon.Design.Carousel do
  @moduledoc false

  use Moon.StatefulComponent

  alias Phoenix.LiveView.JS

  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)

  @doc "Additional Tailwind classes"
  prop(class, :css_class)

  @doc "Index of selected item"
  prop(value, :integer, default: 0)

  @doc "The function to call when reel is updated"
  prop(on_change, :event)

  @doc "Step of scroll"
  prop(step, :integer, default: 1)

  @doc "Interval of auto sliding in milliseconds. No auto sliding if undefined"
  prop(autoslide_delay, :integer)

  @doc "Reel of Carousel component, see Carousel.Reel"
  slot(reel)

  @doc "Left arrow of Carousel component, see Carousel.LeftArrow"
  slot(left_arrow)

  @doc "Right arrow of Carousel component, see Carousel.RightArrow"
  slot(right_arrow)

  @doc "Default slot of Carousel component, used for customized arrows"
  slot(default)

  def render(assigns) do
    ~F"""
    <div
      {=@id}
      class={merge(["relative w-full", @class])}
      data-testid={@testid}
      phx-hook="Carousel"
      data-autoslide_delay={@autoslide_delay}
      data-step={@step}
      data-value={@value}
    >
      <#slot />
      <#slot
        {@left_arrow}
        context_put={
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
          on_change: @on_change || JS.dispatch("triggerRightArrowClick", detail: %{})
        }
      />
    </div>
    """
  end

  def handle_event("set_selected_index", params = %{"value" => item}, socket) do
    dbg(params)
    new_value = String.to_integer(item)
    {:noreply, assign(socket, value: new_value)}
  end
end
