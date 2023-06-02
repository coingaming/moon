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
  prop(on_change, :event, from_context: :on_change)

  @doc "Will be got from Carousel in most cases"
  prop(value, :integer, from_context: :value)

  def render(assigns) do
    ~F"""
    <button
      {=@id}
      type="button"
      data-default_bg_color={@default_bg_color}
      data-selected_bg_color={@selected_bg_color}
      class={merge([
        [
          "w-2 h-2 mx-1 rounded-full",
          @default_bg_color,
          "moon-indicator"
        ],
        @class
      ])}
      {=@value}
      :on-click={@on_change}
      data-testid={@testid}
    />
    """
  end
end
