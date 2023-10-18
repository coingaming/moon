defmodule Moon.Parts.Header.Title do
  @moduledoc false

  use Moon.StatelessComponent, slot: "title"

  @doc "Id for DOM element"
  prop(id, :string)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "Additional Tailwind classes"
  prop(header_class, :css_class, from_context: :header_class)
  @doc "Title only"
  prop(title_only, :boolean, from_context: :title_only)
  @doc "Default slot"
  slot(default)

  def render(assigns) do
    ~F"""
    <h3
      {=@id}
      data-testid={@testid}
      class={merge([
        ["text-bulma text-moon-32 font-grotesk mb-3", "mb-0": @title_only],
        @header_class,
        @class
      ])}
    >
      <#slot />
    </h3>
    """
  end
end
