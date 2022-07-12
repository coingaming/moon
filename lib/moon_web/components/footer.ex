defmodule MoonWeb.Components.Footer do
  @moduledoc false

  use MoonWeb, :stateless_component

  alias Moon.Assets.Logos.LogoMoonDesign
  alias Moon.Components.Link

  data show_themes, :boolean, default: false

  def render(assigns) do
    ~F"""
    <footer class="relative z-10 flex gap-x-8 gap-y-6 pt-16 pb-6 flex-wrap items-center text-moon-16 text-bulma-100 justify-center md:justify-between">
      <div class="flex gap-x-8 gap-y-6 flex-wrap justify-center items-center">
        <LogoMoonDesign font_size="5rem" />
        <div class="flex gap-x-8 gap-y-4 flex-wrap justify-center items-center">
          <Link to="https://github.com/coingaming/moon" target="_blank" rel="noreferrer">
            GitHub
          </Link>
          <Link
            to="https://www.figma.com/community/file/1002945721703152933"
            target="_blank"
            rel="noreferrer"
          >
            Figma
          </Link>
          <Link to="https://moonds.medium.com/" target="_blank" rel="noreferrer">
            Medium
          </Link>
          <Link to="https://www.linkedin.com/company/moon-io/" target="_blank" rel="noreferrer">
            LinkedIn
          </Link>
        </div>
      </div>
      <p>
        With the help of <span class="font-semibold">Yolo Group</span>
      </p>
    </footer>
    """
  end
end
