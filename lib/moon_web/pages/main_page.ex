defmodule MoonWeb.Pages.MainPage do
  use MoonWeb, :live_view
  alias Moon.Components.Link

  def mount(params, _session, socket) do
    {:ok, assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def render(assigns) do
    ~H"""
    <h1>Moon Elixir</h1>

    <Link to="https://github.com/coingaming/moon">https://github.com/coingaming/moon</Link>

    <h2>Assets</h2>
    Wrappers for SVG-s (for simplier life).

    <h2>Components</h2>
    Elements of Moon (Badge, Button, Link, TextInput etc).
    """
  end
end
