defmodule MoonWeb.Components.Header do
  @moduledoc false

  use MoonWeb, :stateful_component

  alias Moon.Assets.Logos.LogoMoonDesignShort
  alias Moon.Icons.GenericMenu

  slot(default)

  def render(assigns) do
    ~F"""
    <header class="fixed top-0 bg-goku z-50 px-5 w-full">
      <div class="relative z-10 py-4 lg:hidden flex flex-row gap-2 items-center justify-between text-bulma">
        <button type="button" class="focus:outline-none" :on-click="open_left_menu">
          <span class="sr-only">Open sidebar</span>
          <GenericMenu class="text-moon-32" />
        </button>
        <a href="/" aria-label="surface.moon.io main page">
          <LogoMoonDesignShort height="2em" width="2em" />
        </a>
      </div>
      <#slot />
    </header>
    """
  end

  def handle_event("open_left_menu", _, socket) do
    Moon.Design.Drawer.open("left-menu")
    {:noreply, socket}
  end
end
