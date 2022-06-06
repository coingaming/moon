defmodule MoonWeb.Components.Page do
  @moduledoc false

  use MoonWeb, :stateless_component

  alias MoonWeb.Components.Breadcrumbs
  alias MoonWeb.Components.Footer
  alias MoonWeb.Components.ThemesSelect

  prop class, :css_class
  prop breadcrumbs, :any
  prop theme_name, :any, default: "moon-design-light"
  prop active_page, :any
  slot default

  def render(assigns) do
    ~F"""
    <div role="main" class={"flex items-start h-screen overflow-hidden", @class}>
      <MoonWeb.Components.LeftMenu
        id="left-menu"
        theme_name={assigns.theme_name}
        active_page={assigns.active_page}
      />

      <div class="flex-1 h-screen overflow-auto">
        <div class="w-full p-28 py-10">
          <div>
            <Breadcrumbs theme_name={@theme_name} breadcrumbs={@breadcrumbs} class="mb-2" />
            <#slot />
            <Footer />
            <ThemesSelect id="themes_select" theme_name={@theme_name} active_page={@active_page} />
          </div>
        </div>
      </div>
    </div>
    """
  end
end
