defmodule Moon.Design.Carousel.Reel do
  @moduledoc false

  use Moon.StatelessComponent, slot: "reel"

  import Moon.Helpers.MakeList

  @doc "Id attribute for DOM element"
  prop(id, :string)

  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)

  @doc "Additional Tailwind classes"
  prop(class, :css_class)

  @doc "Additional Tailwind classes for indicator"
  prop(indicator_class, :css_class)

  @doc "Item of Carousel component, see Carousel.Item"
  slot(item)

  @doc "Indicator of Carousel component, see Carousel.Indicator"
  slot(indicator)

  @doc "Default slot of Carousel.Reel, used for examples with auto-generated Carousel items"
  slot(default)

  # Internal API
  @doc "Will be got from Carousel in most cases"
  prop(autoslide_delay, :integer, from_context: :autoslide_delay)

  @doc "Will be got from Carousel in most cases"
  prop(step, :integer, from_context: :step)

  @doc "Will be got from Carousel in most cases"
  prop(value, :integer, from_context: :value)

  @doc "Will be got from Carousel in most cases"
  prop(on_change, :event, from_context: :on_change)

  def render(assigns) do
    ~F"""
    <ul
      {=@id}
      class={merge([
        [
          "flex overflow-x-auto overflow-y-hidden h-auto hidden-scroll gap-4 no-scrollbar",
          "[-webkit-overflow-scrolling:touch] [scrollbar-width:none]",
          "[-ms-overflow-style:-ms-autohiding-scrollbar]",
          "[&>li]:list-none before:absolute [&>li]:before:content-[&quot;200B&quot;]",
          "[&>*]:flex-[0_0_auto] [&>img]:h-full [&>img]:basis-auto [&>img]:w-auto",
          "snap-x rtl:flex-row-reverse",
          "moon-reel",
          "overflow-x-hidden": @autoslide_delay
        ],
        @class
      ])}
      data-testid={@testid}
      step={@step}
    >
      {#for {item, index} <- Enum.with_index(make_list(@item))}
        <#slot
          {item}
          context_put={
            value: to_string(index),
            is_active: index == @value
          }
        />
      {/for}
      <#slot />
    </ul>
    <div class={merge([
      "flex absolute bottom-8 left-1/2 -translate-x-1/2 rtl:flex-row-reverse",
      @indicator_class
    ])}>
      {#for {_, index} <- Enum.with_index(make_list(@item))}
        <#slot
          {@indicator}
          context_put={
            on_change: @on_change,
            value: to_string(index)
          }
        />
      {/for}
    </div>
    """
  end
end
