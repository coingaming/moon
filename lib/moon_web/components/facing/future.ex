defmodule MoonWeb.Components.Facing.Future do
  @moduledoc false

  use MoonWeb, :stateless_component
  alias Moon.Icons.ArrowsTopRight
  alias MoonWeb.Components.Facing.FutureIcon

  def render(assigns) do
    ~F"""
      <div>
        <a href="/howToContribute" class="group block relative">
          <div class="relative h-[240px] w-[1176px] text-gohan-100">
            <div class="flex absolute top-0 left-0 z-20 mx-14 my-6 w-[1176px]">
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
                <ArrowsTopRight font_size="3rem"/>
              </div>
            </div>
            <div class="md:h-full absolute top-0 left-0 z-10 w-[1176px]">
              <img
                class="rounded-moon-s-lg object-left"
                src="/moon/assets/images/facing/future_bg.png"
                layout="fill"
                objectFit="cover"
                quality={100}
              />
            </div>
          </div>
        </a>
      </div>
    """
  end
end
