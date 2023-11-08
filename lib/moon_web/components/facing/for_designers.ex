defmodule MoonWeb.Components.Facing.ForDesigners do
  @moduledoc false

  use MoonWeb, :stateless_component

  alias Moon.Design.Button
  alias Moon.Icons.ArrowsTopRight
  alias MoonWeb.Components.Facing.FigmaIcon
  alias MoonWeb.Pages.GettingStartedPage

  def render(assigns) do
    ~F"""
    <div class="z-20 theme-moon-dark text-bulma relative flex grow p-6 gap-6 theme-tokens rounded-moon-s-lg bg-whis 3xl:flex-col 3xl:h-96 3xl:w-80 3xl:rounded-br-none 3xl:absolute 3xl:top-0 ltr:3xl:right-80 rtl:3xl:left-80">
      <div class="flex gap-6 align-center justify-between grow 3xl:flex-col 3xl:justify-end">
        <FigmaIcon />
        <h2 class="text-moon-24 grow 3xl:grow-0">
          <a href={live_path(MoonWeb.Endpoint, GettingStartedPage)}>
            For designers.
          </a>
        </h2>
        <div class="3xl:absolute 3xl:top-6 ltr:3xl:right-6 rtl:3xl:left-6 cursor-pointer">
          <a
            href={live_path(MoonWeb.Endpoint, GettingStartedPage)}
            aria-label="Read more info for designers"
          >
            <ArrowsTopRight font_size="2rem" />
          </a>
        </div>
      </div>
      <div class="hidden flex-wrap gap-1 3xl:flex theme-moon-dark bg-transparent">
        <Button
          as="a"
          variant="outline"
          href="https://www.figma.com/community/file/1002945721703152933"
          target="_blank"
          rel="noreferrer"
        >Figma</Button>
        <Button variant="outline" as="a" href="/getting-started">Getting Started</Button>
        <Button variant="outline" as="a" href="/typography">Typography</Button>
        <Button variant="outline" as="a" href="/colours">Colour Convention</Button>
      </div>
    </div>
    """
  end
end
