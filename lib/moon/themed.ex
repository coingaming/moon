defmodule Moon.Themed do
  use Moon.StatefulComponent
  use Moon.Components.Context

  property theme, :any

  def render(assigns) do
    ~H"""
    <Context set={{ :theme, assigns.theme }}
      <slot />
    </Context>
    """
  end

end
