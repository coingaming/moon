defmodule MoonWeb.Pages.MainPage do
  use Moon.LiveView
  alias Moon.Components.Link

  def render(assigns) do
    ~H"""
    <h1>Moon Elixir</h1>

    <Link to="https://github.com/coingaming/moon">https://github.com/coingaming/moon</Link>

    <h2>Assets</h2>
    Wrappers for SVG-s (for simplier life).

    <h2>Components</h2>
    Elements of Moon (Badge, Button, Link, TextInput etc).

    <h5>Pages</h5>
    In this Elixir libary, Page is construction of Figma/Scetch file, that passes mock data to components it requires.
    """
  end
end
