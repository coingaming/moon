defmodule MoonWeb.Components.Facing.ForDesigners do
  @moduledoc false

  use MoonWeb, :stateless_component

  alias Moon.Components.Button
  alias Moon.Icons.ArrowsTopRight
  alias MoonWeb.Components.Facing.FigmaIcon

  prop theme_name, :string, default: "moon-design-light"

  def render(assigns) do
    ~F"""
    <div class="relative flex grow p-6 gap-6 theme-tokens rounded-moon-s-lg bg-for-designers text-gohan-100 3xl:flex-col 3xl:h-96 3xl:w-80 3xl:rounded-br-none 3xl:absolute 3xl:top-0 3xl:right-80">
      <div class="flex gap-6 align-center justify-between grow 3xl:flex-col 3xl:justify-end">
        <FigmaIcon />
        <h2 class="text-moon-24 grow 3xl:grow-0">
          <a href={"/getting-started?theme_name=" <> @theme_name}>
            For designers.
          </a>
        </h2>
        <div class="3xl:absolute 3xl:top-6 3xl:right-6">
          <ArrowsTopRight font_size="2rem" />
        </div>
      </div>
      <div class="hidden flex-wrap gap-1 3xl:flex moon-design-dark bg-transparent">
        <a
          href="https://www.figma.com/community/file/1002945721703152933"
          target="_blank"
          rel="noreferrer"
        >
          <Button variant="secondary">Figma</Button>
        </a>
        <a href="gettingStarted">
          <Button variant="secondary">Getting Started</Button>
        </a>
        <a href="typography">
          <Button variant="secondary">Typography</Button>
        </a>
        <a href="colours">
          <Button variant="secondary">Colour Convention</Button>
        </a>
      </div>
    </div>
    """
  end
end
