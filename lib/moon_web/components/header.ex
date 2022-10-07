defmodule MoonWeb.Components.Header do
  @moduledoc false

  use MoonWeb, :stateless_component

  prop click, :event
  slot default

  def render(assigns) do
    ~F"""
    <header>
      <div class="relative z-10 py-4 lg:hidden flex flex-row gap-2 items-center justify-between text-bulma">
        <button type="button" class="focus:outline-none" :on-click={@click}>
          <span class="sr-only">Open sidebar</span>
          <img src={static_path(MoonWeb.Endpoint, "/svgs/moon_web/left_menu.svg")}>
        </button>
        <a href="/">
          <img src={static_path(MoonWeb.Endpoint, "/svgs/moon_web/moon_logo.svg")}>
        </a>
      </div>
      <#slot />
    </header>
    """
  end
end
