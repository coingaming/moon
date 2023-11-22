defmodule Moon.Parts.Header.ButtonGroup do
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
    <div
      {=@id}
      data-testid={@testid}
      class={merge(["gap-2 hidden lg:inline absolute top-8 end-8", ["lg:hidden": @is_hidden], @class])}
    >
      <#slot />
    </div>
    """
  end
end
