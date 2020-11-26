defmodule MoonWeb.Pages.Components.InlinePage do
  use MoonWeb, :live_view
  alias Moon.Components.Inline

  def mount(%{"theme_name" => theme_name}, _session, socket) do
    {:ok, assign(socket, theme_name: theme_name, active_page: __MODULE__)}
  end

  def render(assigns) do
    ~H"""
    <Inline>
      <div>a</div>
      <div>b</div>
    </Inline>
    """
  end
end
