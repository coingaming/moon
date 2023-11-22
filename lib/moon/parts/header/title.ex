defmodule Moon.Parts.Header.Title do
  @moduledoc false

  use Moon.StatelessComponent

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
  @doc "Conditional displaying due to an issue with named slots in Surface"
  prop(is_hidden, :boolean, default: false)

  @doc "Default slot"
  slot(default)

  def render(assigns) do
    ~F"""
    <h3
      {=@id}
      data-testid={@testid}
      class={merge([
        [
          "text-bulma text-moon-32 font-grotesk mt-6",
          "mb-0": @title_only,
          "hidden mt-0": @is_hidden
        ],
        @header_class,
        @class
      ])}
    >
      <#slot />
    </h3>
    """
  end
end
