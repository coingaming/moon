defmodule Moon.Design.Carousel.Item do
  @moduledoc false

  use Moon.StatelessComponent, slot: "item"

  @doc "Id attribute for DOM element"
  prop(id, :string)

  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)

  @doc "Additional Tailwind classes"
  prop(class, :css_class)

  @doc "Inner content of the Carousel.Item"
  slot(default)

  # Internal API
  @doc "Will be got from Carousel in most cases"
  prop(value, :integer, from_context: :value)

  @doc "Will be got from Carousel in most cases"
  prop(is_active, :boolean, from_context: :is_active)

  @doc "Conditional displaying due to an issue with named slots in Surface"
  prop(is_hidden, :boolean, default: false)

  def render(assigns) do
    ~F"""
    <li
      :if={!@is_hidden}
      {=@id}
      {=@value}
      class={merge([
        [
          "snap-center flex bg-goku rounded-moon-s-sm items-center justify-center",
          active: @is_active
        ],
        @class
      ])}
      data-testid={@testid}
    >
      <#slot />
    </li>
    """
  end
end
