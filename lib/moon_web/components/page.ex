defmodule MoonWeb.Components.Page do
  @moduledoc false

  use MoonWeb, :stateless_component

  alias MoonWeb.Components.Breadcrumbs
  alias MoonWeb.Components.Footer
  alias MoonWeb.Components.Header
  alias MoonWeb.Components.LeftMenu
  alias MoonWeb.Components.ThemesSelect
  alias Phoenix.LiveView.JS

  prop class, :css_class
  prop breadcrumbs, :any
  prop theme_name, :any, default: "moon-design-light"
  prop active_page, :any
  slot default

  def render(assigns) do
    ~F"""
    <div role="main" class={"bg-goku-100 text-bulma-100 flex", @class, @theme_name}>
      <LeftMenu
        id="left-menu"
        theme_name={assigns.theme_name}
        active_page={assigns.active_page}
        click={hide_left_menu()}
        hide_items
      />

      <div class={
        "min-h-screen lg:ml-80 bg-gohan-100 flex-1 w-0 flex flex-col lg:rounded-tl-3xl lg:rounded-bl-3xl px-5 xl:px-20 2xl:px-32 lg:pt-12",
        @theme_name
      }>
        <div class="flex flex-col grow max-w-screen-xl">
          <Header click={show_left_menu()}>
            <Breadcrumbs
              class="pb-12 hidden lg:block"
              :if={@breadcrumbs}
              theme_name={@theme_name}
              breadcrumbs={@breadcrumbs}
            />
          </Header>
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

  def show_left_menu(js \\ %JS{}) do
    JS.remove_class(js, "hidden", to: "#left-menu-container")
  end

  def hide_left_menu(js \\ %JS{}) do
    JS.add_class(js, "hidden", to: "#left-menu-container")
  end
end
