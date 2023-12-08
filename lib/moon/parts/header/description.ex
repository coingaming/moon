defmodule Moon.Parts.Header.Description do
  @moduledoc false

  use Moon.StatelessComponent

  @doc "Id attribute for DOM element"
  prop(id, :string)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "Conditional displaying due to an issue with named slots in Surface"
  prop(is_hidden, :boolean, default: false)
  @doc "Default slot"
  slot(default)

  def render(assigns) do
    ~F"""
    <p
      {=@id}
      data-testid={@testid}
      class={merge(["text-trunks text-moon-16 md:text-moon-18 mt-4", ["hidden mt-0": @is_hidden], @class])}
    >
      <#slot />
    </p>
    """
  end
end
