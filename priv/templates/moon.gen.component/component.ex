defmodule Moon.Design.<%= name %> do
  @moduledoc false

  use Moon.StatelessComponent

  @doc "Id attribute for DOM element"
  prop(id, :string)

  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)

  @doc "Additional Tailwind classes"
  prop(class, :css_class)

  @doc "Inner content of the component"
  slot(default, required: true)

  def render(assigns) do
    ~F"""

    """
  end
end
