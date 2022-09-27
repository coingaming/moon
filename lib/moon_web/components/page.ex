defmodule MoonWeb.Components.Page do
  @moduledoc false

  use MoonWeb, :stateless_component

  alias MoonWeb.Components.Breadcrumbs
  alias MoonWeb.Components.Footer
  alias MoonWeb.Components.ThemesSelect

  prop class, :css_class
  prop breadcrumbs, :any
  prop theme_name, :any, default: "moon-design-light"
  prop main_content_theme_name, :any
  prop active_page, :any
  slot default

  def render(assigns) do
    ~F"""
    <div role="main" class={"bg-goku-100 text-bulma-100 flex", @class, @theme_name}>
      <MoonWeb.Components.LeftMenu
        id="left-menu"
        theme_name={assigns.theme_name}
        active_page={assigns.active_page}
        hide_items
      />

      <div class={
        "min-h-screen lg:ml-80 bg-gohan-100 flex-1 w-0 flex flex-col lg:rounded-tl-3xl lg:rounded-bl-3xl px-5 xl:px-20 2xl:px-32 lg:pt-12",
        @theme_name
      }>
        <div class="flex flex-col grow max-w-screen-xl">
          <Breadcrumbs
            class="pb-12"
            :if={@breadcrumbs}
            theme_name={@theme_name}
            breadcrumbs={@breadcrumbs}
          />
          <div class="flex flex-col gap-12 flex-1 relative overflow-y-auto focus:outline-none">
            <#slot />
          </div>
          <Footer />
          <ThemesSelect id="themes_select" theme_name={@theme_name} active_page={@active_page} />
        </div>
      </div>
    </div>
    """
  end
end
