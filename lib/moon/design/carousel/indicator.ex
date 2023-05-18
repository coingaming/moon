defmodule Moon.Design.Carousel.Indicator do
  @moduledoc false

  use Moon.StatelessComponent, slot: "indicator"

  @doc "Id attribute for DOM element"
  prop(id, :string)

  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)

  @doc "Additional Tailwind classes"
  prop(class, :css_class)

  @doc "Additional Tailwind classes for background color of indicator in default state"
  prop(default_bg_color, :css_class, default: "bg-beerus")

  @doc "Additional Tailwind classes for background color of indicator in selected state"
  prop(selected_bg_color, :css_class, default: "bg-piccolo")

  # Internal API
  @doc "Will be got from Carousel in most cases"
  prop(is_active, :boolean, from_context: :is_active)

  @doc "Will be got from Carousel in most cases"
  prop(on_change, :event, from_context: :on_change)

  @doc "Will be got from Carousel in most cases"
  prop(value, :integer, from_context: :value)

  @doc "Will be got from Carousel.Reel in most cases"
  prop(item_count, :integer, from_context: :item_count)

  def render(assigns) do
    ~F"""
    <button
      {=@id}
      type="button"
      class={merge([
        [
          "w-2 h-2 mx-1 rounded-full",
          "moon-indicator",
          (@is_active == true && @selected_bg_color) || @default_bg_color
        ],
        @class
      ])}
      {=@item_count}
      {=@value}
      data-value={@value}
      :on-click={@on_change}
      data-testid={@testid}
    />
    """
  end
end
