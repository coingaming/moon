defmodule MoonWeb.Components.Footer do
  @moduledoc false

  use MoonWeb, :stateless_component

  alias Moon.Assets.Logos.LogoMoonDesign
  alias Moon.Components.Link

  prop class, :string, default: nil
  data show_themes, :boolean, default: false

  def render(assigns) do
    ~F"""
    <div class={"mt-auto py-8 px-4 lg:pt-24 flex mt-10 gap-8 bottom-0 justify-start items-center #{@class}"}>
      <LogoMoonDesign font_size="5rem" />
      <Link to="https://github.com/coingaming/moon" class="text-trunks-100">
        GitHub
      </Link>
      Moon with Elixir
    </div>
    """
  end
end
