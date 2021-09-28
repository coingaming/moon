defmodule MoonWeb.Pages.Themes.ListOfThemes do
  @moduledoc false

  use Moon.LiveView
  alias Moon.Components.Link

  def render(assigns) do
    ~F"""
    <h1>Themes</h1>

    <p>
      <Link to="https://github.com/coingaming/moon/tree/master/lib/moon/themes">https://github.com/coingaming/moon/tree/master/lib/moon/themes</Link>
    </p>

    <p>
      1. Values should not be hard-coded, but paddings, margings, colors come from theme. <br>
      2. Themes should base on Moon.Theme for type hinting. <br>
    </p>
    """
  end
end
