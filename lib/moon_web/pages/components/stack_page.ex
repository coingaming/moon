defmodule MoonWeb.Pages.Components.StackPage do
  use MoonWeb, :live_view
  alias Moon.Components.Stack

  def mount(%{"theme_name" => theme_name}, _session, socket) do
    {:ok, assign(socket, theme_name: theme_name, active_page: __MODULE__)}
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
