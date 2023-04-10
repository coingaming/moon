defmodule Moon.Design.<%= name %> do
  @moduledoc false

  use Moon.StatelessComponent

  prop(id, :string)
  prop(testid, :string)
  prop(class, :css_class)

  def render(assigns) do
    ~F"""

    """
  end
end
