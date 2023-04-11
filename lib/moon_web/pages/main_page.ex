defmodule MoonWeb.Pages.MainPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.Breadcrumbs
  alias MoonWeb.Components.Footer
  alias MoonWeb.Components.Header
  alias MoonWeb.Components.LeftMenu
  alias MoonWeb.Components.ThemesSelect
  alias Phoenix.LiveView.JS

  alias MoonWeb.Components.Page
  alias MoonWeb.Components.Facing.ForDesigners
  alias MoonWeb.Components.Facing.ForDevelopers
  alias MoonWeb.Components.Facing.Updates
  alias MoonWeb.Components.Facing.Future
  alias MoonWeb.Components.Facing.Contributors
  alias MoonWeb.Components.Facing.MoonEarth

  alias Moon.Design.Tag
  alias Moon.Design.Button

  prop(class, :css_class)
  prop(breadcrumbs, :any)
  prop(theme_name, :any, default: "theme-moon-light")
  prop(direction, :string, values: ["ltr", "rtl"], default: "ltr")
  prop(active_page, :any)

  def render(assigns) do
    ~F"""
    <div role="main" class="pt-16 lg:pt-0 bg-goku text-bulma flex">
      <LeftMenu
        id="left-menu"
        theme_name={@theme_name}
        direction={@direction}
        active_page={@active_page}
        hide_items
      />
      <Header click="set_open" />
      <div class={
        "min-h-screen lg:ms-80 bg-gohan flex-1 w-0 flex flex-col lg:rounded-tl-3xl lg:rounded-bl-3xl px-5 xl:px-20 2xl:px-32 lg:pt-12",
        @theme_name
      }>
        <div class="flex flex-col grow max-w-screen-xl">
          <div class="flex flex-col gap-12 flex-1 relative focus:outline-none">
            <div class="relative z-5 flex flex-col gap-12">
              <div class="self-start"><Tag size="2xs">Open Source</Tag></div>
              <div class="flex flex-col gap-16">
                <div class="relative z-30 flex flex-col items-start gap-6">
                  <h1 class="text-moon-64 font-semibold">Moon design system.</h1>
                  <p class="text-moon-24 max-w-screen-sm">
                    Moon is Yolo Group product design system that helps us maintain the
                    integrity of their user experience and optimize design and development
                    resources.
                  </p>
                  <p class="flex items-center gap-2 text-moon-16 max-w-screen-sm font-semibold">
                    <span>Try out Moon DS for
                    </span>
                    <a href="https://moon.io/" target="_blank" rel="noreferrer">
                      <Button size="sm">React</Button>
                    </a>
                  </p>
                </div>
                <div class="flex flex-col lg:flex-row gap-4 3xl:fixed 3xl:top-12 ltr:3xl:right-12 rtl:3xl:left-12 z-30">
                  <ForDevelopers {=@theme_name} {=@direction} />
                  <ForDesigners {=@theme_name} {=@direction} />
                </div>
                <Updates />
                <Future />
                <Contributors />
              </div>
            </div>
            <MoonEarth />
          </div>
          <Footer />
          <ThemesSelect id="themes_select" {=@theme_name} {=@active_page} {=@direction} />
        </div>
      </div>
    </div>

    <!--<Page {=@theme_name} {=@active_page} {=@direction}>
      <div class="relative z-5 flex flex-col gap-12">
        <div class="self-start"><Tag size="2xs">Open Source</Tag></div>
        <div class="flex flex-col gap-16">
          <div class="relative z-30 flex flex-col items-start gap-6">
            <h1 class="text-moon-64 font-semibold">Moon design system.</h1>
            <p class="text-moon-24 max-w-screen-sm">
              Moon is Yolo Group product design system that helps us maintain the
              integrity of their user experience and optimize design and development
              resources.
            </p>
            <p class="flex items-center gap-2 text-moon-16 max-w-screen-sm font-semibold">
              <span>Try out Moon DS for
              </span>
              <a href="https://moon.io/" target="_blank" rel="noreferrer">
                <Button size="sm">React</Button>
              </a>
            </p>
          </div>
          <div class="flex flex-col lg:flex-row gap-4 3xl:fixed 3xl:top-12 ltr:3xl:right-12 rtl:3xl:left-12 z-30">
            <ForDevelopers {=@theme_name} {=@direction} />
            <ForDesigners {=@theme_name} {=@direction} />
          </div>
          <Updates />
          <Future />
          <Contributors />
        </div>
      </div>
      <MoonEarth />
    </Page>-->
    """
  end

  # def show_left_menu(js \\ %JS{}) do
  #   JS.remove_class(js, "hidden", to: "#left-menu-container")
  # end

  # def hide_left_menu(js \\ %JS{}) do
  #   JS.add_class(js, "hidden", to: "#left-menu-container")
  # end

  def handle_event("set_open", _, socket) do
    LeftMenu.open("left-menu")
    {:noreply, socket}
  end
end
