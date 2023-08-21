defmodule Moon.Design.Carousel.CarouselControl do
  @moduledoc false

  use Moon.StatelessComponent

  @doc "Id attribute for DOM element"
  prop(id, :string)

  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)

  @doc "Additional Tailwind classes"
  prop(class, :css_class)

  @doc "The function to call when page is updated"
  prop(on_change, :event)

  @doc "Inner content of the component"
  slot(default, required: true)

  @doc "Will be got from Pagination in most cases"
  prop(value, :integer, from_context: :value)

  @doc "Aria label for DOM element"
  prop(aria_label, :string)

  def render(assigns) do
    ~F"""
    <button
      {=@id}
      class={merge([
        "max-sm:hidden align-middle shadow-moon-sm rounded-moon-i-sm bg-gohan text-bulma",
        "h-8 w-8 font-medium",
        "leading-[0] no-underline cursor-pointer absolute top-1/2 -translate-y-1/2",
        "origin-[top_center] z-5 disabled:opacity-60 disabled:cursor-not-allowed",
        @class
      ])}
      :on-click={@on_change}
      data-testid={@testid}
      aria-label={@aria_label}
      {=@value}
    >
      <#slot />
    </button>
    """
  end
end
