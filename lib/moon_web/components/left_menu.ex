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
        optional
        active={active_page == @route}
        class={
          get_class(),
          "bg-trunks-100": active_page == @route
        }
        to={live_path(MoonWeb.Endpoint, @route, theme_name: theme_name)}
      ><#slot name="default" /></Link>
    </Context>
    """
  end

  def get_class() do
    "block text-bulma-100 hover:text-gohan-100 hover:bg-trunks-100 px-3 py-2 w-min whitespace-nowrap
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
  alias Moon.Components.Link, as: MoonLink

  prop theme_name, :any
  prop uri, :any
  prop active_page, :any

  def render(assigns) do
    ~F"""
    <Sidebar background_color="bg-gohan-100" open_width="16rem">
      <:short_logo>
        <div class="flex items-center h-10">
          <MoonLink
            to="/"
            class="text-bulma-100 hover:text-bulma-100 active:text-bulma-100 focus:text-bulma-100"
          >
            <LogoMoonDesignShort font_size="2.5rem" />
          </MoonLink>
        </div>
      </:short_logo>

      <:menu>
        <nav class="mt-5">
          <Context put={active_page: @active_page, theme_name: @theme_name}>
            <TopToDown class="p-4 text-lg">
              <MoonLink
                to="/"
                class="text-bulma-100 hover:text-bulma-100 active:text-bulma-100 focus:text-bulma-100"
              >
                <LogoMoonDesign font_size="5rem" />
              </MoonLink>

              <Link route={Pages.VisionPage}>Vision</Link>
              <Link route={Pages.GettingStartedPage}>Getting Started</Link>
              <Link route={Pages.ContributePage}>How to contribute</Link>
              <Link route={Pages.ColoursPalettePage}>Colours Palette</Link>
              <Link route={Pages.TokensPage}>Tokens</Link>
              <Link route={Pages.IconsPage}>Icons</Link>
              <Link route={Pages.TransformSvgPage}>Transform SVG</Link>
              <Accordion
                id="left-menu-components"
                open_by_default={active_page_contains(@active_page, Pages.Components)}
              >
                <:title>Components</:title>
                <:content>
                  <Link route={Pages.Components.AccordionPage}>Accordion</Link>
                  <Link route={Pages.Components.AvatarPage}>Avatar</Link>
                  <Link route={Pages.Components.BannerPage}>Banner</Link>
                  <Link route={Pages.Components.ButtonPage}>Button</Link>
                  <Link route={Pages.Components.CalendarPage}>Calendar *</Link>
                  <Link route={Pages.Components.CardPage}>Card *</Link>
                  <Link route={Pages.Components.CarouselPage}>Carousel</Link>

                  <Accordion
                    id="left-menu-components-select"
                    open_by_default={active_page_contains(@active_page, Pages.Components.Charts)}
                  >
                    <:title>Charts</:title>
                    <:content>
                      <Link route={Pages.Components.Charts.GeoMapPage}>GeoMap</Link>
                      <Link route={Pages.Components.Charts.LineChartPage}>LineChart</Link>
                      <Link route={Pages.Components.Charts.PiePage}>Pie</Link>
                      <Link route={Pages.Components.Charts.TablePage}>Table</Link>
                      <Link route={Pages.Components.Charts.VerticalBarPage}>Vertical Bar</Link>
                    </:content>
                  </Accordion>

                  <Link route={Pages.Components.CheckboxPage}>Checkbox</Link>
                  <Link route={Pages.Components.ChipPage}>Chip</Link>

                  <Accordion
                    id="left-menu-components-date"
                    open_by_default={active_page_contains(@active_page, Pages.Components.Date)}
                  >
                    <:title>Datepicker</:title>
                    <:content>
                      <Link route={Pages.Components.Date.DatepickerPage}>Datepicker</Link>
                      <Link route={Pages.Components.Date.SingleDatePage}>Single Date</Link>
                      <Link route={Pages.Components.Date.RangeDatePage}>Range</Link>
                    </:content>
                  </Accordion>

                  <Accordion
                    id="left-menu-components-dialog"
                    open_by_default={active_page_contains(@active_page, Pages.Components.Dialog)}
                  >
                    <:title>Dialog</:title>
                    <:content>
                      <Link route={Pages.Components.Dialog.ModalPage}>Dialog</Link>
                      <Link route={Pages.Components.Dialog.ContentPage}>Dialog Content</Link>
                      <Link route={Pages.Components.Dialog.OverlayPage}>Dialog Overlay</Link>
                      <Link route={Pages.Components.Dialog.HeaderPage}>Dialog Header</Link>
                      <Link route={Pages.Components.Dialog.FooterPage}>Dialog Footer</Link>
                      <Link route={Pages.Components.Dialog.PopoverPage}>Popover</Link>
                    </:content>
                  </Accordion>

                  <Link route={Pages.Components.DrawerPage}>Drawer *</Link>
                  <Link route={Pages.Components.FileInputPage}>File Input *</Link>
                  <Link route={Pages.Components.LabelPage}>Label</Link>
                  <Link route={Pages.Components.LinkPage}>Link *</Link>
                  <Link route={Pages.Components.ListItemsPage}>List items</Link>
                  <Link route={Pages.Components.LoaderPage}>Loader</Link>
                  <Link route={Pages.Components.PaginationPage}>Pagination</Link>

                  <Accordion
                    id="left-menu-components-progress"
                    open_by_default={active_page_contains(@active_page, Pages.Components.Progress)}
                  >
                    <:title>Progress</:title>
                    <:content>
                      <Link route={Pages.Components.Progress.CircularPage}>Circular</Link>
                      <Link route={Pages.Components.Progress.LinearPage}>Linear</Link>
                    </:content>
                  </Accordion>

                  <Link route={Pages.Components.RadioButtonPage}>RadioButton</Link>
                  <Link route={Pages.Components.SearchPage}>Search</Link>

                  <Accordion
                    id="left-menu-components-select"
                    open_by_default={active_page_contains(@active_page, Pages.Components.Select)}
                  >
                    <:title>Select</:title>
                    <:content>
                      <Link route={Pages.Components.Select.DropdownPage}>Dropdown</Link>
                      <Link route={Pages.Components.Select.SelectPage}>Select</Link>
                      <Link route={Pages.Components.Select.SingleSelectPage}>Single select</Link>
                      <Link route={Pages.Components.Select.MultiSelectPage}>Multi select</Link>
                    </:content>
                  </Accordion>

                  <Link route={Pages.Components.SidebarPage}>Sidebar *</Link> <!-- Hide -->
                  <Link route={Pages.Components.SwitchPage}>Switch</Link>
                  <Link route={Pages.Components.SwitcherPage}>Switcher *</Link> <!-- Hide -->
                  <Link route={Pages.Components.TabsPage}>Tabs</Link>
                  <Link route={Pages.Components.TablePage}>Table</Link>

                  <Accordion
                    id="left-menu-components-text"
                    open_by_default={active_page_contains(@active_page, Pages.Components.TextInput)}
                  >
                    <:title>Text Input</:title>
                    <:content>
                      <Link route={Pages.Components.TextInput.TextInputPage}>Text input</Link>
                      <Link route={Pages.Components.TextInput.NumberPage}>Number *</Link>
                      <Link route={Pages.Components.TextInput.DatePage}>Date *</Link>
                      <Link route={Pages.Components.TextInput.TimePage}>Time *</Link>
                      <Link route={Pages.Components.TextInput.DateTimePage}>DateTime *</Link>
                      <Link route={Pages.Components.TextInput.EmailPage}>Email *</Link>
                      <Link route={Pages.Components.TextInput.PasswordPage}>Password</Link>
                      <Link route={Pages.Components.TextInput.SearchPage}>Search *</Link>
                      <Link route={Pages.Components.TextInput.TelephonePage}>Telephone *</Link>
                      <Link route={Pages.Components.TextInput.UrlPage}>Url *</Link>
                    </:content>
                  </Accordion>

                  <Link route={Pages.Components.TextInputGroupPage}>Text input group</Link>
                  <Link route={Pages.Components.ToastPage}>Toast</Link>
                  <Link route={Pages.Components.TooltipPage}>Tooltip</Link>

                  <Accordion
                    id="left-menu-components-typography"
                    open_by_default={active_page_contains(@active_page, Pages.Components.Typography)}
                  >
                    <:title>Typography</:title>
                    <:content>
                      <Link route={Pages.Components.Typography.CaptionPage}>Caption</Link>
                      <Link route={Pages.Components.Typography.HeadingPage}>Heading</Link>
                      <Link route={Pages.Components.Typography.TextPage}>Text</Link>
                    </:content>
                  </Accordion>
                </:content>
              </Accordion>
            </TopToDown>
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
