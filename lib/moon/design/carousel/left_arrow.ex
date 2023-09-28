defmodule Moon.Design.Carousel.LeftArrow do
  @moduledoc false

  alias Moon.Design.Carousel.CarouselControl

  use Moon.StatelessComponent, slot: "left_arrow"

  @doc "Id attribute for DOM element"
  prop(id, :string)

  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)

  @doc "Additional Tailwind classes"
  prop(class, :css_class)

  @doc "Inner content of the component"
  slot(default, required: true)

  # Internal API
  @doc "Will be got from Carousel in most cases"
  prop(on_change, :event, from_context: :on_change)

  @doc "Will be got from Carousel in most cases"
  prop(value, :integer, from_context: :value)

  def render(assigns) do
    ~F"""
    <CarouselControl
      {=@id}
      class={merge(["-start-4", "moon-left-arrow", @class])}
      on_change={@on_change}
      testid={@testid}
      value={@value}
      aria_label="Scroll left"
    >
      <#slot />
    </CarouselControl>
    """
  end
end
