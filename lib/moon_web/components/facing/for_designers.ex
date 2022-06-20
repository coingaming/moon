defmodule MoonWeb.Components.Facing.ForDesigners do
  @moduledoc false

  use MoonWeb, :stateless_component

  def render(assigns) do
    ~F"""
    <div class="theme-moon-dark relative flex grow p-6 gap-6 theme-tokens rounded-moon-s-lg bg-whis text-bulma 3xl:flex-col 3xl:h-96 3xl:w-80 3xl:rounded-br-none 3xl:absolute 3xl:top-0 3xl:right-80">
      <div class="flex gap-6 align-center justify-between grow 3xl:flex-col 3xl:justify-end">
        <FigmaIcon />
        <h2 class="text-moon-24 grow 3xl:grow-0">
          <a
            href="https://www.figma.com/community/file/1002945721703152933"
            target="_blank"
            rel="noreferrer"
          >
            For designers.
          </a>
        </h2>
        <div class="3xl:absolute 3xl:top-6 3xl:right-6">
          <TopRightArrowIcon />
        </div>
      </div>
      <div class="hidden flex-wrap gap-1 3xl:flex">
        <Link href="https://www.figma.com/community/file/1002945721703152933">
          <a target="_blank" rel="noreferrer">
            <Button variant="secondary">Figma</Button>
          </a>
        </Link>
        <Link href="gettingStarted">
          <a>
            <Button variant="secondary">Getting Started</Button>
          </a>
        </Link>
        <Link href="typography">
          <a>
            <Button variant="secondary">Typography</Button>
          </a>
        </Link>
        <Link href="colours">
          <a>
            <Button variant="secondary">Colour Convention</Button>
          </a>
        </Link>
      </div>
    </div>
    """
  end
end
