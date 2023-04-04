defmodule MoonWeb.Components.LeftMenu do
  @moduledoc false

  use MoonWeb, :stateful_component

  alias MoonWeb.Components.LargeLogo
  alias Moon.Components.Accordion
  alias Moon.Components.Sidebar
  alias MoonWeb.Components.Version
  alias MoonWeb.Pages
  alias MoonWeb.Components.SidebarLink

  prop(theme_name, :any)
  prop(direction, :string)
  prop(uri, :any)
  prop(active_page, :any)
  prop(hide_items, :boolean)
  prop(click, :event)

  def render(assigns) do
    ~F"""
    <div
      :on-click={@click}
      id="left-menu-container"
      class={
        "hidden fixed h-screen lg:flex lg:flex-shrink-0 w-80 flex-col z-[10000] top-0",
        @theme_name
      }
    >
      <div class="fixed inset-0 bg-gray-600 bg-opacity-75 lg:hidden" />
      <Sidebar background_color="bg-goku" open_width="20rem">
        <:short_logo>
          <div class="flex items-center h-10">
            <a
              href={live_path(MoonWeb.Endpoint, MoonWeb.Pages.MainPage, theme_name: @theme_name, direction: @direction)}
              class="text-bulma hover:text-bulma active:text-bulma focus:text-bulma"
            >
              <LargeLogo class="h-6 w-[6.5rem]" />
            </a>
          </div>
        </:short_logo>
        <:menu>
          <nav class="flex flex-col grow gap-2">
            <div class="relative z-10 fixed top-0 h-screen w-80 flex flex-col flex-grow gap-10 pt-12 pb-6 px-5 lg:px-8 overflow-y-scroll">
              <div class="flex items-center flex-shrink-0 pl-3">
                <a
                  href={live_path(MoonWeb.Endpoint, MoonWeb.Pages.MainPage, theme_name: @theme_name, direction: @direction)}
                  class="text-bulma hover:text-bulma active:text-bulma focus:text-bulma"
                >
                  <LargeLogo class="h-6 w-[6.5rem]" />
                </a>
              </div>
              <div class="flex-grow flex flex-col gap-2">
                <SidebarLink route={Pages.VisionPage}>Vision</SidebarLink>
                <SidebarLink route={Pages.GettingStartedPage}>Getting Started</SidebarLink>
                <SidebarLink route={Pages.ContributePage}>How to contribute</SidebarLink>
                <SidebarLink route={Pages.ColoursPalettePage}>Colours</SidebarLink>
                <SidebarLink route={Pages.TokensPage}>Tokens</SidebarLink>
                <SidebarLink route={Pages.TypographyPage}>Typography</SidebarLink>
                <SidebarLink route={Pages.ComponentsPage}>Components</SidebarLink>
                <SidebarLink route={Pages.ManifestPage}>Manifest</SidebarLink>
                <div>
                  <Accordion
                    is_content_inside={false}
                    id="left-menu-design"
                    open_by_default={active_page_contains(@active_page, Pages.Design)}
                  >
                    <:title>Components v2</:title>
                    <:content>
                      <div class="flex-grow flex flex-col gap-2 pl-8">
                        <SidebarLink route={Pages.Design.AccordionPage}>Accordion</SidebarLink>
                        <SidebarLink route={Pages.Design.AlertPage}>Alert</SidebarLink>
                        <SidebarLink route={Pages.Design.AvatarPage}>Avatar</SidebarLink>
                        <SidebarLink route={Pages.Design.BottomSheetPage}>BottomSheet</SidebarLink>
                        <SidebarLink route={Pages.Design.BreadcrumbPage}>Breadcrumb</SidebarLink>
                        <Accordion
                          is_content_inside={false}
                          id="left-menu-components-button"
                          open_by_default={active_page_contains(@active_page, Pages.Design.Button)}
                        >
                          <:title>Button</:title>
                          <:content>
                            <div class="flex-grow flex flex-col gap-2 pl-8">
                              <SidebarLink route={Pages.Design.ButtonPage}>Button</SidebarLink>
                              <SidebarLink route={Pages.Design.Button.IconButtonPage}>IconButton</SidebarLink>
                            </div>
                          </:content>
                        </Accordion>
                        <SidebarLink route={Pages.Design.ChipPage}>Chip</SidebarLink>
                        <SidebarLink route={Pages.Design.DrawerPage}>Drawer</SidebarLink>
                        <SidebarLink route={Pages.Design.DropdownPage}>Dropdown</SidebarLink>
                        <Accordion
                          is_content_inside={false}
                          id="left-menu-components-form"
                          open_by_default={active_page_contains(@active_page, Pages.Design.Form)}
                        >
                          <:title>Form</:title>
                          <:content>
                            <div class="flex-grow flex flex-col gap-2 pl-8">
                              <SidebarLink route={Pages.Design.Form.CheckboxPage}>Checkbox</SidebarLink>
                              <SidebarLink route={Pages.Design.Form.InputPage}>Input</SidebarLink>
                              <SidebarLink route={Pages.Design.Form.SelectPage}>Select</SidebarLink>
                              <SidebarLink route={Pages.Design.Form.TextareaPage}>Textarea</SidebarLink>
                            </div>
                          </:content>
                        </Accordion>
                        <SidebarLink route={Pages.Design.LoaderPage}>Loader</SidebarLink>
                        <SidebarLink route={Pages.Design.MenuItemPage}>MenuItem</SidebarLink>
                        <SidebarLink route={Pages.Design.ModalPage}>Modal</SidebarLink>
                        <SidebarLink route={Pages.Design.PopoverPage}>Popover</SidebarLink>
                        <Accordion
                          is_content_inside={false}
                          id="left-menu-design-progress"
                          open_by_default={active_page_contains(@active_page, Pages.Design.Progress)}
                        >
                          <:title>Progress</:title>
                          <:content>
                            <div class="flex-grow flex flex-col gap-2 pl-8">
                              <SidebarLink route={Pages.Design.ProgressPage}>Linear</SidebarLink>
                              <SidebarLink route={Pages.Design.CircularProgressPage}>Circular</SidebarLink>
                            </div>
                          </:content>
                        </Accordion>
                        <SidebarLink route={Pages.Design.SnackbarPage}>Snackbar</SidebarLink>
                        <SidebarLink route={Pages.Design.SwitchPage}>Switch</SidebarLink>
                        <SidebarLink route={Pages.Design.TablePage}>Table</SidebarLink>
                        <SidebarLink route={Pages.Design.TabsPage}>Tabs</SidebarLink>
                        <SidebarLink route={Pages.Design.TagPage}>Tag</SidebarLink>
                        <SidebarLink route={Pages.Design.TooltipPage}>Tooltip</SidebarLink>
                      </div>
                    </:content>
                  </Accordion>
                </div>
                <Accordion
                  is_content_inside={false}
                  id="left-menu-components"
                  open_by_default={active_page_contains(@active_page, Pages.Components)}
                >
                  <:title>Components v1</:title>
                  <:content>
                    <div class="flex-grow flex flex-col gap-2 pl-8">
                      <SidebarLink route={Pages.Components.AccordionPage}>Accordion</SidebarLink>
                      <SidebarLink route={Pages.Components.AvatarPage}>Avatar</SidebarLink>
                      <SidebarLink route={Pages.Components.BannerPage}>Banner</SidebarLink>
                      <SidebarLink route={Pages.Components.BreadcrumbPage}>Breadcrumb</SidebarLink>
                      <SidebarLink route={Pages.Components.ButtonPage}>Button</SidebarLink>
                      <SidebarLink route={Pages.Components.CarouselPage}>Carousel</SidebarLink>
                      <Accordion
                        is_content_inside={false}
                        id="left-menu-components-charts"
                        open_by_default={active_page_contains(@active_page, Pages.Components.Charts)}
                      >
                        <:title>Charts</:title>
                        <:content>
                          <div class="flex-grow flex flex-col gap-2 pl-8">
                            <SidebarLink :if={!@hide_items} route={Pages.Components.Charts.GeoMapPage}>GeoMap</SidebarLink>
                            <SidebarLink route={Pages.Components.Charts.LineChartPage}>LineChart</SidebarLink>
                            <SidebarLink :if={!@hide_items} route={Pages.Components.Charts.PiePage}>Pie</SidebarLink>
                            <SidebarLink :if={!@hide_items} route={Pages.Components.Charts.TablePage}>Table</SidebarLink>
                            <SidebarLink :if={!@hide_items} route={Pages.Components.Charts.VerticalBarPage}>Vertical Bar</SidebarLink>
                          </div>
                        </:content>
                      </Accordion>
                      <SidebarLink route={Pages.Components.CheckboxPage}>Checkbox</SidebarLink>
                      <SidebarLink route={Pages.Components.ChipPage}>Chip</SidebarLink>
                      <SidebarLink route={Pages.Components.CountryFlagsPage}>CountryFlags</SidebarLink>
                      <Accordion
                        is_content_inside={false}
                        id="left-menu-components-date"
                        open_by_default={active_page_contains(@active_page, Pages.Components.Date)}
                      >
                        <:title>Datepicker</:title>
                        <:content>
                          <div class="flex-grow flex flex-col gap-2 pl-8">
                            <SidebarLink route={Pages.Components.Date.DatepickerPage}>Datepicker</SidebarLink>
                            <SidebarLink :if={!@hide_items} route={Pages.Components.Date.SingleDatePage}>Single Date</SidebarLink>
                            <SidebarLink :if={!@hide_items} route={Pages.Components.Date.RangeDatePage}>Range</SidebarLink>
                          </div>
                        </:content>
                      </Accordion>
                      <Accordion
                        is_content_inside={false}
                        id="left-menu-components-dialog"
                        open_by_default={active_page_contains(@active_page, Pages.Components.Dialog)}
                      >
                        <:title>Dialog</:title>
                        <:content>
                          <div class="flex-grow flex flex-col gap-2 pl-8">
                            <SidebarLink route={Pages.Components.Dialog.ModalPage}>Dialog</SidebarLink>
                            <SidebarLink :if={!@hide_items} route={Pages.Components.Dialog.ContentPage}>Dialog Content</SidebarLink>
                            <SidebarLink :if={!@hide_items} route={Pages.Components.Dialog.OverlayPage}>Dialog Overlay</SidebarLink>
                            <SidebarLink :if={!@hide_items} route={Pages.Components.Dialog.HeaderPage}>Dialog Header</SidebarLink>
                            <SidebarLink :if={!@hide_items} route={Pages.Components.Dialog.FooterPage}>Dialog Footer</SidebarLink>
                            <SidebarLink route={Pages.Components.Dialog.PopoverPage}>Popover</SidebarLink>
                          </div>
                        </:content>
                      </Accordion>
                      <SidebarLink route={Pages.Components.DrawerPage}>Drawer *</SidebarLink>
                      <SidebarLink route={Pages.Components.FileInputPage}>File Input *</SidebarLink>
                      <SidebarLink route={Pages.Components.IconsPage}>Icons</SidebarLink>
                      <SidebarLink route={Pages.Components.LabelPage}>Label</SidebarLink>
                      <SidebarLink route={Pages.Components.ListItemsPage}>List items</SidebarLink>
                      <SidebarLink route={Pages.Components.LoaderPage}>Loader</SidebarLink>
                      <SidebarLink :if={!@hide_items} route={Pages.Components.PaginationPage}>Pagination</SidebarLink>
                      <Accordion
                        is_content_inside={false}
                        id="left-menu-components-progress"
                        open_by_default={active_page_contains(@active_page, Pages.Components.Progress)}
                      >
                        <:title>Progress</:title>
                        <:content>
                          <div class="flex-grow flex flex-col gap-2 pl-8">
                            <SidebarLink :if={!@hide_items} route={Pages.Components.Progress.CircularPage}>Circular</SidebarLink>
                            <SidebarLink route={Pages.Components.Progress.LinearPage}>Linear</SidebarLink>
                          </div>
                        </:content>
                      </Accordion>
                      <SidebarLink route={Pages.Components.RadioButtonPage}>RadioButton</SidebarLink>
                      <SidebarLink :if={!@hide_items} route={Pages.Components.SearchPage}>Search</SidebarLink>
                      <Accordion
                        is_content_inside={false}
                        id="left-menu-components-select"
                        open_by_default={active_page_contains(@active_page, Pages.Components.Select)}
                      >
                        <:title>Select</:title>
                        <:content>
                          <div class="flex-grow flex flex-col gap-2 pl-8">
                            <SidebarLink route={Pages.Components.Select.DropdownPage}>Dropdown</SidebarLink>
                            <SidebarLink route={Pages.Components.Select.SelectPage}>Select</SidebarLink>
                            <SidebarLink route={Pages.Components.Select.SingleSelectPage}>Single select</SidebarLink>
                            <SidebarLink route={Pages.Components.Select.MultiSelectPage}>Multi select</SidebarLink>
                          </div>
                        </:content>
                      </Accordion>
                      <SidebarLink route={Pages.Components.SwitchPage}>Switch</SidebarLink>
                      <SidebarLink route={Pages.Components.TabsPage}>Tabs</SidebarLink>
                      <SidebarLink route={Pages.Components.TablePage}>Table</SidebarLink>
                      <SidebarLink route={Pages.Components.TextInputPage}>TextInput</SidebarLink>
                      <SidebarLink route={Pages.Components.InputGroupPage}>TextInputGroup</SidebarLink>
                      <SidebarLink route={Pages.Components.ToastPage}>Toast</SidebarLink>
                      <SidebarLink route={Pages.Components.TooltipPage}>Tooltip</SidebarLink>
                    </div>
                  </:content>
                </Accordion>
              </div>
              <Version />
            </div>
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
    </div>
    """
  end

  def active_page_contains(active_page, module_path) do
    String.contains?(to_string(active_page), to_string(module_path))
  end
end
