defmodule MoonWeb.Components.Footer do
  @moduledoc false

  use MoonWeb, :stateless_component

  alias MoonWeb.Components.Version

  data(show_themes, :boolean, default: false)

  def render(assigns) do
    ~F"""
    <footer class="theme-moon-dark relative lg:fixed -mx-5 lg:mx-0 mt-16 lg:mt-0 z-50 lg:z-[9999] lg:bottom-0 inset-x-0 flex lg:flex-row gap-x-8 gap-y-6 2xl:ps-80 flex-wrap items-center text-moon-14 text-bulma bg-goku justify-center md:justify-between">
      <div class="w-full py-5 px-5 lg:ps-8 lg:pe-5 xl:pe-20 2xl:px-32">
        <div class="flex 2xl:max-w-screen-xl gap-x-4 gap-y-6 flex-col lg:flex-row w-full justify-between items-center">
          <Version />
          <div class="flex gap-x-4 gap-y-6 flex-wrap justify-center items-center text-trunks">
            <a
              href="https://github.com/coingaming/moon"
              class="hover:underline"
              target="_blank"
              rel="noreferrer"
            >
              Github
            </a>
            <span>•</span>
            <a
              href="https://www.figma.com/community/file/1002945721703152933"
              class="hover:underline"
              target="_blank"
              rel="noreferrer"
            >
              Figma
            </a>
            <span>•</span>
            <a href="https://moonds.medium.com/" class="hover:underline" target="_blank" rel="noreferrer">
              Medium
            </a>
            <span>•</span>
            <a
              href="https://www.linkedin.com/company/moon-io/"
              class="hover:underline"
              target="_blank"
              rel="noreferrer"
            >
              LinkedIn
            </a>
            <span>•</span>
            <a
              href="https://github.com/coingaming/moon/blob/main/LICENSE"
              class="hover:underline"
              target="_blank"
              rel="noreferrer"
            >
              License
            </a>
          </div>

          <p>
            With the help of
            <a
              href="https://yolo.com/"
              class="hover:underline font-semibold"
              target="_blank"
              rel="noreferrer"
            >
              Yolo Group
            </a>
            ❤️
          </p>
        </div>
      </div>
    </footer>
    """
  end
end
