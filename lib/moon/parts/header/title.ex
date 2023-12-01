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
  @doc "If is table header"
  prop(is_table_header, :boolean, from_context: :is_table_header)
  @doc "Default slot"
  slot(default)

  def render(assigns) do
    ~F"""
    <h3
      {=@id}
      data-testid={@testid}
      class={merge([
        [
          "w-full text-bulma text-moon-24 font-grotesk mt-2 md:mt-0 px-4 py-4 md:px-8 md:not-first:pt-0 md:py-7 self-center md:text-start text-center leading-normal",
          "md:px-6 md:pt-6 md:pb-8": @is_table_header
        ],
        @class
      ])}
    >
      <#slot>{@title}</#slot>
    </h3>
    """
  end
end
