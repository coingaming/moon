defmodule Moon.Themed do
  use Moon.StatefulComponent

  context set theme, :any, scope: :only_children

  property theme, :any

  def init_context(assigns) do
    {:ok, %{theme: assigns.theme}}
  end

  def render(assigns) do
    ~H"""
      <slot />
    """
  end

end
