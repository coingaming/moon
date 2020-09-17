defmodule Moon.Sites.Aposta10.Config do
  use Moon.StatelessComponent

  alias Aposta10AppWeb.Router.Helpers, as: Routes

  property conn, :any
  property routes, :any

  context set conn, :any, scope: :only_children
  context set routes, :any, scope: :only_children

  def init_context(assigns) do
    {:ok, conn: assigns.conn, routes: assigns.routes}
  end

  def static_path(endpoint, path) do
    Routes.static_path(endpoint, path)
  end

  def colors do
    %{
      color1: "#FF5111",
      color2: "rgba(255, 255, 255, 0.4)",
      color3: "#F3F5F6",
      color4: "#38A174",
      color5: "#109A3C",
      color6: "#8697A2",
      color7: "#FFFFFF"
    }
  end

  def render(assigns) do
    ~H"""
    <slot />
    """
  end
end
