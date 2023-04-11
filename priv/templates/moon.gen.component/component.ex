defmodule Moon.Design.<%= name %> do
  @moduledoc false

  use Moon.StatelessComponent

  @doc "id attribute for DOM element"
  prop(id, :string)
  @doc "data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "additional Tailwind classes"
  prop(class, :css_class)

  @doc "Inner content of the component"
  slot(default, required: true)

  def render(assigns) do
    ~F"""

    """
  end
end
