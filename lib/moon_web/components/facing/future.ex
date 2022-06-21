defmodule MoonWeb.Components.Facing.Future do
  @moduledoc false

  use MoonWeb, :stateless_component
  alias Moon.Icons.ArrowsTopRight
  alias MoonWeb.Components.Facing.FutureIcon

  def render(assigns) do
    ~F"""
    <div>
      <a href="/howToContribute" class="group block relative">
        <div class="md:h-full text-gohan-100 flex box-border justify-between z-10 px-14 py-8 bg-[url('/moon/assets/images/facing/future_bg.png')] bg-cover rounded-moon-s-lg w-[1176px]">
          <div class="flex flex-col gap-6">
            <h3 class="relative text-goten text-moon-48 font-medium z-1">
              Want to contribute?
            </h3>
            <p class="max-w-md relative text-moon-24 text-goten z-1">
              Start building with our HTML/CSS framework and rapidly go from
              prototype to production.
            </p>
          </div>
          <div class="relative z-1 w-[196px] h-[151px]">
            <FutureIcon />
          </div>
          <div class="relative text-goten z-1">
            <ArrowsTopRight font_size="2rem" />
          </div>
        </div>
      </a>
    </div>
    """
  end
end
