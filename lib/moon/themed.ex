defmodule Moon.Themed do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(theme, :any)

  def render(assigns) do
    ~H"""
    <Context put={{ theme: assigns.theme }}>
      <slot />
    </Context>
    """
  end
end
