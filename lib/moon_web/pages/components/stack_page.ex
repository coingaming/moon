defmodule MoonWeb.Pages.Components.StackPage do
  use MoonWeb, :live_view
  alias Moon.Components.Stack

  def mount(params, _session, socket) do
    {:ok, assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def render(assigns) do
    ~H"""
    <Stack>
      <div>a</div>
      <div>b</div>
    </Stack>
    """
  end
end
