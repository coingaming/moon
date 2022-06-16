defmodule MoonWeb.Components.LeftMenu do
  @moduledoc false

  use MoonWeb, :stateful_component

  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Accordion
  alias Moon.Components.Sidebar
  alias MoonWeb.Components.Version
  alias MoonWeb.Pages
  alias Surface.Components.Context
  alias __MODULE__.Link
  alias Moon.Components.Link
  alias MoonWeb.Components.SidebarLink
  alias MoonWeb.Components.LargeLogo

  prop theme_name, :any
  prop uri, :any
  prop active_page, :any

  def render(assigns) do
    ~F"""
    <Sidebar background_color="bg-goku-100" open_width="20rem">
      <:short_logo>
        <div class="flex items-center h-10">
          <Link
            to="/"
            class="text-bulma-100 hover:text-bulma-100 active:text-bulma-100 focus:text-bulma-100"
          >
            <LargeLogo />
          </Link>
        </div>
      </:short_logo>

      <:menu>
        <nav class="flex flex-col grow gap-2">
          <Context put={active_page: @active_page, theme_name: @theme_name}>
            <div class="relative z-10 fixed top-0 h-screen w-80 flex flex-col flex-grow gap-10 pt-12 pb-6 px-5 lg:px-8 overflow-y-scroll">
              <div class="flex items-center flex-shrink-0 pl-3">
                <Link to="/">
                  <LargeLogo />
                </Link>
              </div>
              <div class="flex-grow flex flex-col gap-2">
                <SidebarLink route={Pages.VisionPage}>Vision</SidebarLink>
                <SidebarLink route={Pages.GettingStartedPage}>Getting Started</SidebarLink>
                <SidebarLink route={Pages.ContributePage}>How to contribute</SidebarLink>
                <SidebarLink route={Pages.ColoursPalettePage}>Colours Palette</SidebarLink>
                <SidebarLink route={Pages.TokensPage}>Tokens</SidebarLink>
                <SidebarLink route={Pages.IconsPage}>Icons</SidebarLink>
                <SidebarLink route={Pages.CountryFlagsPage}>CountryFlags</SidebarLink>
                <SidebarLink route={Pages.TransformSvgPage}>Transform SVG</SidebarLink>
                <Accordion
                  is_content_inside={false}
                  id="left-menu-components"
                  open_by_default={active_page_contains(@active_page, Pages.Components)}
                >
                  <:title>Components</:title>
                  <:content>
                    <TopToDown class="p-4 text-moon-18">
                      <SidebarLink route={Pages.Components.AccordionPage}>Accordion</SidebarLink>
                      <SidebarLink route={Pages.Components.AvatarPage}>Avatar</SidebarLink>
                      <SidebarLink route={Pages.Components.BannerPage}>Banner</SidebarLink>
                      <SidebarLink route={Pages.Components.ButtonPage}>Button</SidebarLink>
                      <SidebarLink route={Pages.Components.CarouselPage}>Carousel</SidebarLink>

                      <Accordion
                        is_content_inside={false}
                        id="left-menu-components-select"
                        open_by_default={active_page_contains(@active_page, Pages.Components.Charts)}
                      >
                        <:title>Charts</:title>
                        <:content>
                          <SidebarLink route={Pages.Components.Charts.GeoMapPage}>GeoMap</SidebarLink>
                          <SidebarLink route={Pages.Components.Charts.LineChartPage}>LineChart</SidebarLink>
                          <SidebarLink route={Pages.Components.Charts.PiePage}>Pie</SidebarLink>
                          <SidebarLink route={Pages.Components.Charts.TablePage}>Table</SidebarLink>
                          <SidebarLink route={Pages.Components.Charts.VerticalBarPage}>Vertical Bar</SidebarLink>
                        </:content>
                      </Accordion>

                      <SidebarLink route={Pages.Components.CheckboxPage}>Checkbox</SidebarLink>
                      <SidebarLink route={Pages.Components.ChipPage}>Chip</SidebarLink>

                      <Accordion
                        is_content_inside={false}
                        id="left-menu-components-date"
                        open_by_default={active_page_contains(@active_page, Pages.Components.Date)}
                      >
                        <:title>Datepicker</:title>
                        <:content>
                          <SidebarLink route={Pages.Components.Date.DatepickerPage}>Datepicker</SidebarLink>
                          <SidebarLink route={Pages.Components.Date.SingleDatePage}>Single Date</SidebarLink>
                          <SidebarLink route={Pages.Components.Date.RangeDatePage}>Range</SidebarLink>
                        </:content>
                      </Accordion>

                      <Accordion
                        is_content_inside={false}
                        id="left-menu-components-dialog"
                        open_by_default={active_page_contains(@active_page, Pages.Components.Dialog)}
                      >
                        <:title>Dialog</:title>
                        <:content>
                          <SidebarLink route={Pages.Components.Dialog.ModalPage}>Dialog</SidebarLink>
                          <SidebarLink route={Pages.Components.Dialog.ContentPage}>Dialog Content</SidebarLink>
                          <SidebarLink route={Pages.Components.Dialog.OverlayPage}>Dialog Overlay</SidebarLink>
                          <SidebarLink route={Pages.Components.Dialog.HeaderPage}>Dialog Header</SidebarLink>
                          <SidebarLink route={Pages.Components.Dialog.FooterPage}>Dialog Footer</SidebarLink>
                          <SidebarLink route={Pages.Components.Dialog.PopoverPage}>Popover</SidebarLink>
                        </:content>
                      </Accordion>

                      <SidebarLink route={Pages.Components.DrawerPage}>Drawer *</SidebarLink>
                      <SidebarLink route={Pages.Components.FileInputPage}>File Input *</SidebarLink>
                      <SidebarLink route={Pages.Components.LabelPage}>Label</SidebarLink>
                      <SidebarLink route={Pages.Components.ListItemsPage}>List items</SidebarLink>
                      <SidebarLink route={Pages.Components.LoaderPage}>Loader</SidebarLink>
                      <SidebarLink route={Pages.Components.PaginationPage}>Pagination</SidebarLink>

                      <Accordion
                        is_content_inside={false}
                        id="left-menu-components-progress"
                        open_by_default={active_page_contains(@active_page, Pages.Components.Progress)}
                      >
                        <:title>Progress</:title>
                        <:content>
                          <SidebarLink route={Pages.Components.Progress.CircularPage}>Circular</SidebarLink>
                          <SidebarLink route={Pages.Components.Progress.LinearPage}>Linear</SidebarLink>
                        </:content>
                      </Accordion>

                      <SidebarLink route={Pages.Components.RadioButtonPage}>RadioButton</SidebarLink>
                      <SidebarLink route={Pages.Components.SearchPage}>Search</SidebarLink>

                      <Accordion
                        is_content_inside={false}
                        id="left-menu-components-select"
                        open_by_default={active_page_contains(@active_page, Pages.Components.Select)}
                      >
                        <:title>Select</:title>
                        <:content>
                          <SidebarLink route={Pages.Components.Select.DropdownPage}>Dropdown</SidebarLink>
                          <SidebarLink route={Pages.Components.Select.SelectPage}>Select</SidebarLink>
                          <SidebarLink route={Pages.Components.Select.SingleSelectPage}>Single select</SidebarLink>
                          <SidebarLink route={Pages.Components.Select.MultiSelectPage}>Multi select</SidebarLink>
                        </:content>
                      </Accordion>

                      <SidebarLink route={Pages.Components.SwitchPage}>Switch</SidebarLink>
                      <SidebarLink route={Pages.Components.TabsPage}>Tabs</SidebarLink>
                      <SidebarLink route={Pages.Components.TablePage}>Table</SidebarLink>

                      <Accordion
                        is_content_inside={false}
                        id="left-menu-components-text"
                        open_by_default={active_page_contains(@active_page, Pages.Components.TextInput)}
                      >
                        <:title>Text Input</:title>
                        <:content>
                          <SidebarLink route={Pages.Components.TextInput.TextInputPage}>Text input</SidebarLink>
                          <SidebarLink route={Pages.Components.TextInput.NumberPage}>Number *</SidebarLink>
                          <SidebarLink route={Pages.Components.TextInput.DatePage}>Date *</SidebarLink>
                          <SidebarLink route={Pages.Components.TextInput.TimePage}>Time *</SidebarLink>
                          <SidebarLink route={Pages.Components.TextInput.DateTimePage}>DateTime *</SidebarLink>
                          <SidebarLink route={Pages.Components.TextInput.EmailPage}>Email *</SidebarLink>
                          <SidebarLink route={Pages.Components.TextInput.PasswordPage}>Password</SidebarLink>
                          <SidebarLink route={Pages.Components.TextInput.SearchPage}>Search *</SidebarLink>
                          <SidebarLink route={Pages.Components.TextInput.TelephonePage}>Telephone *</SidebarLink>
                          <SidebarLink route={Pages.Components.TextInput.UrlPage}>Url *</SidebarLink>
                        </:content>
                      </Accordion>

                      <SidebarLink route={Pages.Components.TextInputGroupPage}>Text input group</SidebarLink>
                      <SidebarLink route={Pages.Components.ToastPage}>Toast</SidebarLink>
                      <SidebarLink route={Pages.Components.TooltipPage}>Tooltip</SidebarLink>

                      <Accordion
                        is_content_inside={false}
                        id="left-menu-components-typography"
                        open_by_default={active_page_contains(@active_page, Pages.Components.Typography)}
                      >
                        <:title>Typography</:title>
                        <:content>
                          <SidebarLink route={Pages.Components.Typography.CaptionPage}>Caption</SidebarLink>
                          <SidebarLink route={Pages.Components.Typography.HeadingPage}>Heading</SidebarLink>
                          <SidebarLink route={Pages.Components.Typography.TextPage}>Text</SidebarLink>
                        </:content>
                      </Accordion>
                    </TopToDown>
                  </:content>
                </Accordion>
              </div>
              <Version />
            </div>
          </Context>
        </nav>
        <script>
          window.addEventListener("phx:page-loading-stop", info => {
            var activeLink = document.querySelectorAll('[data-moon-active]');
            if (activeLink[0]) {
              activeLink[0].scrollIntoView();
            }
          })
        </script>
      </:menu>
    </Sidebar>
    """
  end

  def active_page_contains(active_page, module_path) do
    String.contains?(to_string(active_page), to_string(module_path))
  end
end
