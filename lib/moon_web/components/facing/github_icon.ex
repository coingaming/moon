defmodule MoonWeb.Components.Facing.GithubIcon do
  @moduledoc false

  use Moon.StatelessComponent

  def render(assigns) do
    ~F"""
    <svg
      class="moon-icon"
      viewBox="0 0 32 32"
      style={get_style(color: "gohan-100", background_color: "gohan-100", font_size: "2rem")}
    >
      <use href="/moon/assets/svgs/moon_web/github_icon.svg#item" />
    </svg>
    """
  end
end
