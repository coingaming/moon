defmodule MoonWeb.Pages.MainPage do
  use Moon.LiveView
  alias Moon.Components.Link

  def render(assigns) do
    ~H"""
    <h1>Moon Elixir</h1>

    <Link to="https://github.com/coingaming/moon">https://github.com/coingaming/moon</Link>

    <h2>Assets</h2>
    Surface components generated from SVG-s. (So colors or movements can be changed runtime.)

    <h2>Components</h2>
    Elements of Moon (Badge, Button, Link, TextInput etc).

    <h2>Sites</h2>
    Site presents more "type of site" rather than specific site, but in edge case, it can be a site.

    <h5>Pages</h5>
    In this Elixir libary, Page is construction of Figma/Scetch file, that passes mock data to components it requires.
    """
  end
end
