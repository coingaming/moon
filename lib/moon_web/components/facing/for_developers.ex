defmodule MoonWeb.Components.Facing.ForDevelopers do
  @moduledoc false

  use MoonWeb, :stateless_component

  alias Moon.Design.Button
  alias Moon.Icons.ArrowsTopRight
  alias MoonWeb.Components.Facing.GithubIcon
  alias MoonWeb.Pages.GettingStartedPage

  def render(assigns) do
    ~F"""
    <div class="z-20 theme-moon-light text-bulma relative flex grow p-6 gap-6 theme-tokens rounded-moon-s-lg bg-for-developers 3xl:flex-col 3xl:h-96 3xl:w-80 3xl:rounded-tl-none 3xl:absolute 3xl:top-96 ltr:3xl:right-0 rtl:3xl:left-0">
      <div class="flex gap-6 align-center justify-between grow 3xl:flex-col 3xl:justify-end">
        <GithubIcon />
        <h2 class="text-moon-24 grow 3xl:grow-0">
          <a href={live_path(
            MoonWeb.Endpoint,
            GettingStartedPage,
            role: GettingStartedPage.developer_role()
          )}>
            For developers.
          </a>
        </h2>
        <div class="3xl:absolute 3xl:top-6 ltr:3xl:right-6 rtl:3xl:left-6 cursor-pointer">
          <a
            href={live_path(
              MoonWeb.Endpoint,
              GettingStartedPage,
              role: GettingStartedPage.developer_role()
            )}
            aria-label="Read more info for developers"
          >
            <ArrowsTopRight font_size="2rem" />
          </a>
        </div>
      </div>
      <div class="hidden flex-wrap gap-1 3xl:flex bg-transparent">
        <Button
          variant="secondary"
          as="a"
          href="https://github.com/coingaming/moon"
          target="_blank"
          rel="noreferrer"
        >Github</Button>
        <Button variant="secondary" as="a" href="/getting-started">Getting Started</Button>
        <Button variant="secondary" as="a" href="/tokens">Design Tokens</Button>
        <!--
          <Button variant="secondary" as="a" href="https://github.com/coingaming/theme-moon/blob/develop/packages/themes/src/moonDesignDark/moonDesignDark.ts"
          target="_blank"
          rel="noreferrer">Creating Themes</Button>
       -->
        <Button
          variant="secondary"
          as="a"
          href="https://github.com/coingaming/moon/blob/main/CONTRIBUTING.md"
          target="_blank"
          rel="noreferrer"
        >Contribution</Button>
        <Button variant="secondary" as="a" href="/components">Components</Button>
      </div>
    </div>
    """
  end
end
