defmodule Moon.Design.Carousel do
  @moduledoc false

  use Moon.StatefulComponent

  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)

  @doc "Additional Tailwind classes"
  prop(class, :css_class)

  @doc "Index of selected item"
  prop(value, :integer, default: 0)

  @doc "The number of carousel items"
  prop(total_items, :integer)

  @doc "Whether carousel item/indicator is active"
  prop(is_active, :boolean)

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
    >
      <#slot />
      <#slot
        {@left_arrow}
        context_put={
          on_change: @on_change || %{name: "set_selected_index", target: @myself},
          value: @value - @step
        }
      />
      <#slot
        {@reel}
        context_put={
          is_active: @value,
          value: @value,
          autoslide_delay: @autoslide_delay,
          on_change: @on_change || %{name: "set_selected_index", target: @myself}
        }
      />
      <#slot
        {@right_arrow}
        context_put={
          on_change: @on_change || %{name: "set_selected_index", target: @myself},
          value: @value + @step
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
