defmodule Moon.Parts.Header.Title do
  @moduledoc false

  use Moon.StatelessComponent, slot: "title"

  @doc "Id for DOM element"
  prop(id, :string)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "Title"
  prop(title, :string)
  @doc "Default slot"
  slot(default)

  def render(assigns) do
    ~F"""
    <h3
      {=@id}
      data-testid={@testid}
      class={merge([
        "w-full text-bulma text-moon-24 font-grotesk mt-2 lg:mt-0 px-4 py-4 lg:px-8 lg:not-first:pt-0 lg:py-7 self-center lg:text-start text-center leading-normal",
        @class
      ])}
    >
      <#slot>{@title}</#slot>
    </h3>
    """
  end
end
