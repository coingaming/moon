defmodule MoonWeb.Components.Page do
  @moduledoc false

  use MoonWeb, :stateless_component

  alias MoonWeb.Components.Breadcrumbs
  alias MoonWeb.Components.Footer
  alias MoonWeb.Components.Header
  alias MoonWeb.Components.LeftMenu
  alias MoonWeb.Components.ThemesSelect

  prop(class, :css_class)
  prop(breadcrumbs, :any)
  prop(theme_name, :any, default: "theme-moon-light")
  prop(direction, :string, values: ["ltr", "rtl"], default: "ltr")
  prop(active_page, :any)
  slot(default)

  def render(assigns) do
    ~F"""
    <div
      role="main"
      class={"pt-16 lg:pt-0 bg-goku text-bulma flex", @class, @theme_name}
      dir={@direction}
    >
      <LeftMenu theme_name={@theme_name} direction={@direction} active_page={@active_page} hide_items />
      <Header id="page_header" />
      <div class={
        "min-h-screen lg:ms-80 bg-gohan flex-1 w-0 flex flex-col ltr:lg:rounded-tl-3xl rtl:lg:rounded-tr-3xl px-5 xl:px-20 2xl:px-32 lg:pt-12 lg:pb-52",
        @theme_name
      }>
        <div class="flex flex-col grow max-w-screen-xl">
          <Breadcrumbs
            class="pb-12 hidden lg:block"
            :if={@breadcrumbs}
            theme_name={@theme_name}
            breadcrumbs={@breadcrumbs}
          />
          <div class="flex flex-col gap-12 flex-1 relative focus:outline-none">
            <#slot />
          </div>
          <Footer />
          <ThemesSelect id="themes_select" {=@theme_name} {=@active_page} {=@direction} />
        </div>
      </div>
    </div>
    """
  end
end
