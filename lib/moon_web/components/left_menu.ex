defmodule MoonWeb.Components.LeftMenu.Link do
  @moduledoc false
  use MoonWeb, :stateless_component
  alias Moon.Components.Link
  prop route, :any
  slot default

  def render(assigns) do
    ~F"""
    <Context get={active_page: active_page, theme_name: theme_name}>
      <Link
        class={
          get_class(),
          "bg-trunks-100 text-gohan-100": active_page == @route
        }
        to={live_path(MoonWeb.Endpoint, @route, theme_name: theme_name)}
      ><#slot name="default" /></Link>
    </Context>
    """
  end

  def get_class() do
    "block text-piccolo-100 hover:text-gohan-100 hover:bg-trunks-100 text-lg px-3 py-2 w-min whitespace-nowrap
            leading-7 group w-full flex items-center py-2 rounded transition-colors ease-in-out duration-150 cursor-pointer"
  end
end

defmodule MoonWeb.Components.LeftMenu do
  @moduledoc false

  use MoonWeb, :stateful_component

  alias Moon.Assets.Logos.LogoMoonDesign
  alias Moon.Assets.Logos.LogoMoonDesignShort
  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Accordion
  alias Moon.Components.Sidebar
  alias MoonWeb.Pages
  alias Surface.Components.Context
  alias __MODULE__.Link

  prop theme_name, :any
  prop uri, :any
  prop active_page, :any

  def render(assigns) do
    ~F"""
    <Sidebar background_color="bg-gohan-100" open_width="16rem">
      <:short_logo>
        <div class="flex items-center h-10">
          <LogoMoonDesignShort font_size="2.5rem" />
        </div>
      </:short_logo>

      <:menu>
        <nav class="mt-5">
          <Context put={active_page: @active_page, theme_name: @theme_name}>
            <TopToDown class="p-4">
              <LogoMoonDesign font_size="5rem" />

              <Link route={Pages.IconsPage}>Icons</Link>
              <Accordion
                id="left-menu-components"
                open_by_default={active_page_contains(@active_page, Pages.Components)}
              >
                <:title>Components</:title>
                <:content>
                  <Link route={Pages.Components.AccordionPage}>Accordion</Link>
                  <Link route={Pages.Components.AvatarPage}>Avatar</Link>
                  <Link route={Pages.Components.BadgePage}>Badge</Link>
                  <Link route={Pages.Components.ButtonPage}>Button</Link>
                  <Link route={Pages.Components.CalendarPage}>Calendar</Link>
                  <Link route={Pages.Components.CardPage}>Card</Link>
                  <Link route={Pages.Components.CarouselPage}>Carousel</Link>
                  <Link route={Pages.Components.CheckboxPage}>Checkbox</Link>
                  <Link route={Pages.Components.DatepickerPage}>Datepicker</Link>
                  <Link route={Pages.Components.DrawerPage}>Drawer</Link>
                  <Accordion
                    id="left-menu-components-select"
                    open_by_default={active_page_contains(@active_page, Pages.Components.Dialog)}
                  >
                    <:title>Dialog</:title>
                    <:content>
                      <Link route={Pages.Components.Dialog.ModalPage}>Dialog</Link>
                    </:content>
                  </Accordion>
                  <Link route={Pages.Components.FileInputPage}>File Input</Link>
                  <Link route={Pages.Components.HeadingPage}>Heading</Link>
                  <Link route={Pages.Components.LinkPage}>Link</Link>
                  <Link route={Pages.Components.ListItemsPage}>List items</Link>
                  <Link route={Pages.Components.PaginationPage}>Pagination</Link>
                  <Link route={Pages.Components.PasswordInputPage}>Password Input</Link>
                  <Link route={Pages.Components.PopoverPage}>Popover</Link>
                  <Accordion
                    id="left-menu-components-select"
                    open_by_default={active_page_contains(@active_page, Pages.Components.Select)}
                  >
                    <:title>Select</:title>
                    <:content>
                      <Link route={Pages.Components.Select.MultiSelectPage}>Multi select</Link>
                      <Link route={Pages.Components.Select.SingleSelectPage}>Single select</Link>
                    </:content>
                  </Accordion>
                  <Link route={Pages.Components.SidebarPage}>Sidebar</Link>
                  <Link route={Pages.Components.SwitchPage}>Switch</Link>
                  <Link route={Pages.Components.SwitcherPage}>Switcher</Link>
                  <Link route={Pages.Components.TabsPage}>Tabs</Link>
                  <Link route={Pages.Components.TextPage}>Text</Link>
                  <Link route={Pages.Components.TextInputPage}>Text input</Link>
                  <Link route={Pages.Components.ToastPage}>Toast</Link>
                  <Link route={Pages.Components.TooltipPage}>Tooltip</Link>
                  <Link route={Pages.Components.LineChartPage}>LineChart</Link>
                </:content>
              </Accordion>
            </TopToDown>
          </Context>
        </nav>
      </:menu>
    </Sidebar>
    """
  end

  def active_page_contains(active_page, module_path) do
    String.contains?(to_string(active_page), to_string(module_path))
  end
end
