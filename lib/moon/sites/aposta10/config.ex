defmodule Moon.Sites.Aposta10.Config do
  use Moon.StatelessComponent

  property conn, :any
  property routes, :any

  context set conn, :any, scope: :only_children
  context set routes, :any, scope: :only_children

  def init_context(assigns) do
    {:ok, conn: assigns.conn, routes: assigns.routes}
  end

  def render(assigns) do
    ~H"""
    <slot />
    """
  end
end
