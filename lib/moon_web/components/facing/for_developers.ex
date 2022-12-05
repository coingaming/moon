defmodule MoonWeb.Components.Facing.ForDevelopers do
  @moduledoc false

  use MoonWeb, :stateless_component

  alias Moon.Components.Button
  alias Moon.Icons.ArrowsTopRight
  alias MoonWeb.Components.Facing.GithubIcon
  alias MoonWeb.Pages.GettingStartedPage

  prop(theme_name, :string, default: "theme-moon-light")
  prop(direction, :string, default: "ltr")

  def render(assigns) do
    ~F"""
    <div class="z-20 theme-moon-light text-bulma relative flex grow p-6 gap-6 theme-tokens rounded-moon-s-lg bg-for-developers 3xl:flex-col 3xl:h-96 3xl:w-80 3xl:rounded-tl-none 3xl:absolute 3xl:top-96 ltr:3xl:right-0 rtl:3xl:left-0">
      <div class="flex gap-6 align-center justify-between grow 3xl:flex-col 3xl:justify-end">
        <GithubIcon />
        <h2 class="text-moon-24 grow 3xl:grow-0">
          <a href={live_path(MoonWeb.Endpoint, GettingStartedPage,
            theme_name: @theme_name,
            direction: @direction,
            role: GettingStartedPage.developer_role()
          )}>
            For developers.
          </a>
        </h2>
        <div class="3xl:absolute 3xl:top-6 ltr:3xl:right-6 rtl:3xl:left-6 cursor-pointer">
          <a href={live_path(MoonWeb.Endpoint, GettingStartedPage,
            theme_name: @theme_name,
            direction: @direction,
            role: GettingStartedPage.developer_role()
          )}>
            <ArrowsTopRight font_size="2rem" />
          </a>
        </div>
      </div>
      <div class="hidden flex-wrap gap-1 3xl:flex bg-transparent">
        <a href="https://github.com/coingaming/theme-moon" target="_blank" rel="noreferrer">
          <Button variant="secondary">Github</Button>
        </a>
        <a href="gettingStarted">
          <Button variant="secondary">Getting Started</Button>
        </a>
        <a href="tokens">
          <Button variant="secondary">Design Tokens</Button>
        </a>
        <a
          href="https://github.com/coingaming/theme-moon/blob/develop/packages/themes/src/moonDesignDark/moonDesignDark.ts"
          target="_blank"
          rel="noreferrer"
        >
          <Button variant="secondary">Creating Themes</Button>
        </a>
        <a
          href="https://github.com/coingaming/theme-moon/blob/develop/CONTRIBUTING.md"
          target="_blank"
          rel="noreferrer"
        >
          <Button variant="secondary">Contribution</Button>
        </a>
        <a href="components/accordion">
          <Button variant="secondary">Components</Button>
        </a>
      </div>
    </div>
    """
  end
end
