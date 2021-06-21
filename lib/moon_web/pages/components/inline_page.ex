defmodule MoonWeb.Pages.Components.InlinePage do
  use MoonWeb, :live_view
  alias Moon.Components.Inline

  def mount(params, _session, socket) do
    {:ok,
     assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def render(assigns) do
    ~F"""
    <Inline>
      <div>a</div>
      <div>b</div>
    </Inline>
    """
  end
end
