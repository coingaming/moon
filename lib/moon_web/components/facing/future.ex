defmodule MoonWeb.Components.Facing.Future do
  @moduledoc false

  use MoonWeb, :stateless_component
  alias Moon.Icons.ArrowsTopRight
  alias MoonWeb.Components.Facing.FutureIcon

  def render(assigns) do
    ~F"""
    <a
      href="/contribute"
      class="group block relative p-6 md:px-14 md:py-8 rounded-moon-s-lg bg-[url('/moon/assets/images/facing/future_bg.png')] bg-cover z-20"
    >
      <div class="flex justify-between align-start">
        <div class="flex flex-col gap-6">
          <h3 class="relative text-goten text-moon-48 font-medium z-10">
            Want to contribute?
          </h3>
          <p class="max-w-md relative text-moon-24 text-goten z-1">
            Start building with our HTML/CSS framework and rapidly go from
            prototype to production.
          </p>
        </div>
        <div class="hidden md:block relative z-10">
          <FutureIcon />
        </div>
        <div class="absolute md:static top-6 ltr:right-6 rtl:left-6 text-goten z-10 rtl:-rotate-90">
          <ArrowsTopRight font_size="2rem" />
        </div>
      </div>
    </a>
    """
  end
end
