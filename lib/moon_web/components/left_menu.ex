defmodule MoonWeb.Components.LeftMenu do
  @moduledoc false

  use MoonWeb, :stateful_component

  alias Moon.Icons.{
    GenericTrophy,
    SoftwarePlate,
    TextSize,
    SoftwarePuzzle,
    SoftwareSettings,
    OtherLifebuoy,
    OtherRocket,
    GenericLoyalty
  }

  alias MoonWeb.Components.LargeLogo
  alias Moon.Design.Accordion
  alias MoonWeb.Components.Version
  alias MoonWeb.Pages
  alias MoonWeb.Components.SidebarLink

  alias Moon.Design.Drawer.Backdrop

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
      phx-hook="Animation"
      data-is_open={@is_open}
      data-is_closing={"#{@is_closing}"}
      class={
        "hidden fixed lg:flex lg:flex-shrink-0 z-[10000] top-0",
        @theme_name
      }
    >
      <Backdrop class="lg:hidden" />

      <div
        data-animate_enter_class="ltr:animate-drawer_enter_left rtl:animate-drawer_enter_right"
        data-animate_leave_class="ltr:animate-drawer_leave_left rtl:animate-drawer_leave_right"
        class="fixed bg-goku w-80 inset-y-0 ltr:left-0 rtl:right-0 moon-panel"
        :on-click-away="start_closing_drawer"
      >
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
            <div class="flex-grow flex flex-col gap-2 lg:mb-12">
              <SidebarLink route={Pages.VisionPage}><GenericLoyalty class="text-moon-24" />Vision</SidebarLink>
              <SidebarLink route={Pages.GettingStartedPage}><OtherRocket class="text-moon-24" />Getting Started</SidebarLink>
              <SidebarLink route={Pages.ContributePage}><OtherLifebuoy class="text-moon-24" />How to contribute</SidebarLink>
              <SidebarLink route={Pages.ColoursPalettePage}><SoftwareSettings class="text-moon-24" />Colours</SidebarLink>
              <SidebarLink route={Pages.TokensPage}><SoftwarePuzzle class="text-moon-24" />Tokens</SidebarLink>
              <SidebarLink route={Pages.TypographyPage}><TextSize class="text-moon-24" />Typography</SidebarLink>
              <SidebarLink route={Pages.ComponentsPage}><SoftwarePlate class="text-moon-24" />Components</SidebarLink>
              <SidebarLink route={Pages.ManifestPage}><GenericTrophy class="text-moon-24" />Manifest</SidebarLink>

              <Accordion id="left-menu-design" value="0">
                <Accordion.Item has_content_outside>
                  <Accordion.Header icon_class="text-moon-24">Components v2</Accordion.Header>
                  <Accordion.Content>
                    <div class="flex-grow flex flex-col gap-2 pl-8">
                      <SidebarLink route={Pages.Design.AlertPage}>Alert</SidebarLink>
                      <SidebarLink route={Pages.Design.AccordionPage}>Accordion</SidebarLink>
                      <SidebarLink route={Pages.Design.AvatarPage}>Avatar</SidebarLink>
                      <SidebarLink route={Pages.Design.BreadcrumbPage}>Breadcrumb</SidebarLink>

                      <Accordion id="left-menu-components-button">
                        <Accordion.Item has_content_outside>
                          <Accordion.Header icon_class="text-moon-24">
                            Button
                          </Accordion.Header>
                          <Accordion.Content>
                            <div class="flex-grow flex flex-col gap-2 pl-8">
                              <SidebarLink route={Pages.Design.ButtonPage}>Button</SidebarLink>
                              <SidebarLink route={Pages.Design.Button.IconButtonPage}>IconButton</SidebarLink>
                            </div>
                          </Accordion.Content>
                        </Accordion.Item>
                      </Accordion>

                      <SidebarLink route={Pages.Design.ChipPage}>Chip</SidebarLink>
                      <SidebarLink route={Pages.Design.DrawerPage}>Drawer</SidebarLink>
                      <SidebarLink route={Pages.Design.DropdownPage}>Dropdown</SidebarLink>

                      <Accordion id="left-menu-components-form">
                        <Accordion.Item has_content_outside>
                          <Accordion.Header icon_class="text-moon-24">Form</Accordion.Header>
                          <Accordion.Content>
                            <div class="flex-grow flex flex-col gap-2 pl-8">
                              <SidebarLink route={Pages.Design.Form.CheckboxPage}>Checkbox</SidebarLink>
                              <SidebarLink route={Pages.Design.Form.GroupPage}>Group</SidebarLink>
                              <SidebarLink route={Pages.Design.Form.InputPage}>Input</SidebarLink>
                              <SidebarLink route={Pages.Design.Form.RadioPage}>Radio</SidebarLink>
                              <SidebarLink route={Pages.Design.Form.SelectPage}>Select</SidebarLink>
                              <SidebarLink route={Pages.Design.Form.TextAreaPage}>TextArea</SidebarLink>
                            </div>
                          </Accordion.Content>
                        </Accordion.Item>
                      </Accordion>

                      <SidebarLink route={Pages.Design.LoaderPage}>Loader</SidebarLink>
                      <SidebarLink route={Pages.Design.MenuItemPage}>MenuItem</SidebarLink>
                      <SidebarLink route={Pages.Design.ModalPage}>Modal</SidebarLink>
                      <SidebarLink route={Pages.Design.PopoverPage}>Popover</SidebarLink>

                      <Accordion id="left-menu-design-progress">
                        <Accordion.Item has_content_outside>
                          <Accordion.Header icon_class="text-moon-24">Progress</Accordion.Header>
                          <Accordion.Content>
                            <div class="flex-grow flex flex-col gap-2 pl-8">
                              <SidebarLink route={Pages.Design.ProgressPage}>Linear</SidebarLink>
                              <SidebarLink route={Pages.Design.CircularProgressPage}>Circular</SidebarLink>
                            </div>
                          </Accordion.Content>
                        </Accordion.Item>
                      </Accordion>

                      <SidebarLink route={Pages.Design.SnackbarPage}>Snackbar</SidebarLink>
                      <SidebarLink route={Pages.Design.SwitchPage}>Switch</SidebarLink>
                      <SidebarLink route={Pages.Design.TablePage}>Table</SidebarLink>
                      <SidebarLink route={Pages.Design.TabsPage}>Tabs</SidebarLink>
                      <SidebarLink route={Pages.Design.TagPage}>Tag</SidebarLink>
                      <SidebarLink route={Pages.Design.TooltipPage}>Tooltip</SidebarLink>
                    </div>
                  </Accordion.Content>
                </Accordion.Item>
              </Accordion>

              <Accordion id="left-menu-components">
                <Accordion.Item has_content_outside>
                  <Accordion.Header icon_class="text-moon-24">Components v1</Accordion.Header>
                  <Accordion.Content>
                    <div class="flex-grow flex flex-col gap-2 pl-8">
                      <SidebarLink route={Pages.Components.AccordionPage}>Accordion</SidebarLink>
                      <SidebarLink route={Pages.Components.AvatarPage}>Avatar</SidebarLink>
                      <SidebarLink route={Pages.Components.BannerPage}>Banner</SidebarLink>
                      <SidebarLink route={Pages.Components.BreadcrumbPage}>Breadcrumb</SidebarLink>
                      <SidebarLink route={Pages.Components.ButtonPage}>Button</SidebarLink>
                      <SidebarLink route={Pages.Components.CarouselPage}>Carousel</SidebarLink>

                      <Accordion id="left-menu-components-charts">
                        <Accordion.Item has_content_outside>
                          <Accordion.Header icon_class="text-moon-24">
                            Charts
                          </Accordion.Header>
                          <Accordion.Content>
                            <div class="flex-grow flex flex-col gap-2 pl-8">
                              <SidebarLink :if={!@hide_items} route={Pages.Components.Charts.GeoMapPage}>GeoMap</SidebarLink>
                              <SidebarLink route={Pages.Components.Charts.LineChartPage}>LineChart</SidebarLink>
                              <SidebarLink :if={!@hide_items} route={Pages.Components.Charts.PiePage}>Pie</SidebarLink>
                              <SidebarLink :if={!@hide_items} route={Pages.Components.Charts.TablePage}>Table</SidebarLink>
                              <SidebarLink :if={!@hide_items} route={Pages.Components.Charts.VerticalBarPage}>Vertical Bar</SidebarLink>
                            </div>
                          </Accordion.Content>
                        </Accordion.Item>
                      </Accordion>

                      <SidebarLink route={Pages.Components.CheckboxPage}>Checkbox</SidebarLink>
                      <SidebarLink route={Pages.Components.ChipPage}>Chip</SidebarLink>
                      <SidebarLink route={Pages.Components.CountryFlagsPage}>CountryFlags</SidebarLink>

                      <Accordion id="left-menu-components-date">
                        <Accordion.Item has_content_outside>
                          <Accordion.Header icon_class="text-moon-24">Date</Accordion.Header>
                          <Accordion.Content>
                            <div class="flex-grow flex flex-col gap-2 pl-8">
                              <SidebarLink route={Pages.Components.Date.DatepickerPage}>Datepicker</SidebarLink>
                              <SidebarLink :if={!@hide_items} route={Pages.Components.Date.SingleDatePage}>Single Date</SidebarLink>
                              <SidebarLink :if={!@hide_items} route={Pages.Components.Date.RangeDatePage}>Range</SidebarLink>
                            </div>
                          </Accordion.Content>
                        </Accordion.Item>
                      </Accordion>

                      <Accordion id="left-menu-components-dialog">
                        <Accordion.Item has_content_outside>
                          <Accordion.Header icon_class="text-moon-24">Dialog</Accordion.Header>
                          <Accordion.Content>
                            <div class="flex-grow flex flex-col gap-2 pl-8">
                              <SidebarLink route={Pages.Components.Dialog.ModalPage}>Dialog</SidebarLink>
                              <SidebarLink :if={!@hide_items} route={Pages.Components.Dialog.ContentPage}>Dialog Content</SidebarLink>
                              <SidebarLink :if={!@hide_items} route={Pages.Components.Dialog.OverlayPage}>Dialog Overlay</SidebarLink>
                              <SidebarLink :if={!@hide_items} route={Pages.Components.Dialog.HeaderPage}>Dialog Header</SidebarLink>
                              <SidebarLink :if={!@hide_items} route={Pages.Components.Dialog.FooterPage}>Dialog Footer</SidebarLink>
                              <SidebarLink route={Pages.Components.Dialog.PopoverPage}>Popover</SidebarLink>
                            </div>
                          </Accordion.Content>
                        </Accordion.Item>
                      </Accordion>

                      <SidebarLink route={Pages.Components.DrawerPage}>Drawer *</SidebarLink>
                      <SidebarLink route={Pages.Components.FileInputPage}>File Input *</SidebarLink>
                      <SidebarLink route={Pages.Components.IconsPage}>Icons</SidebarLink>
                      <SidebarLink route={Pages.Components.LabelPage}>Label</SidebarLink>
                      <SidebarLink route={Pages.Components.ListItemsPage}>List items</SidebarLink>
                      <SidebarLink route={Pages.Components.LoaderPage}>Loader</SidebarLink>
                      <SidebarLink :if={!@hide_items} route={Pages.Components.PaginationPage}>Pagination</SidebarLink>

                      <Accordion id="left-menu-components-progress">
                        <Accordion.Item has_content_outside>
                          <Accordion.Header icon_class="text-moon-24">Progress</Accordion.Header>
                          <Accordion.Content>
                            <div class="flex-grow flex flex-col gap-2 pl-8">
                              <SidebarLink :if={!@hide_items} route={Pages.Components.Progress.CircularPage}>Circular</SidebarLink>
                              <SidebarLink route={Pages.Components.Progress.LinearPage}>Linear</SidebarLink>
                            </div>
                          </Accordion.Content>
                        </Accordion.Item>
                      </Accordion>

                      <SidebarLink route={Pages.Components.RadioButtonPage}>RadioButton</SidebarLink>
                      <SidebarLink :if={!@hide_items} route={Pages.Components.SearchPage}>Search</SidebarLink>

                      <Accordion id="left-menu-components-select">
                        <Accordion.Item has_content_outside>
                          <Accordion.Header icon_class="text-moon-24">Select</Accordion.Header>
                          <Accordion.Content>
                            <div class="flex-grow flex flex-col gap-2 pl-8">
                              <SidebarLink route={Pages.Components.Select.DropdownPage}>Dropdown</SidebarLink>
                              <SidebarLink route={Pages.Components.Select.SelectPage}>Select</SidebarLink>
                              <SidebarLink route={Pages.Components.Select.SingleSelectPage}>Single select</SidebarLink>
                              <SidebarLink route={Pages.Components.Select.MultiSelectPage}>Multi select</SidebarLink>
                            </div>
                          </Accordion.Content>
                        </Accordion.Item>
                      </Accordion>

                      <SidebarLink route={Pages.Components.SwitchPage}>Switch</SidebarLink>
                      <SidebarLink route={Pages.Components.TabsPage}>Tabs</SidebarLink>
                      <SidebarLink route={Pages.Components.TablePage}>Table</SidebarLink>
                      <SidebarLink route={Pages.Components.TextInputPage}>TextInput</SidebarLink>
                      <SidebarLink route={Pages.Components.InputGroupPage}>TextInputGroup</SidebarLink>
                      <SidebarLink route={Pages.Components.ToastPage}>Toast</SidebarLink>
                      <SidebarLink route={Pages.Components.TooltipPage}>Tooltip</SidebarLink>
                    </div>
                  </Accordion.Content>
                </Accordion.Item>
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
      </div>
    </div>
    """
  end

  def open("left-menu") do
    send_update(__MODULE__, id: "left-menu", is_open: true)
  end

  def handle_event("set_open", _, socket) do
    {:noreply, assign(socket, is_open: true)}
  end

  def handle_event("start_closing_drawer", _, socket) do
    {:noreply, assign(socket, is_closing: true)}
  end

  def handle_event("set_close", _, socket) do
    {:noreply, assign(socket, is_open: false, is_closing: false)}
  end

  def active_page_contains(active_page, module_path) do
    String.contains?(to_string(active_page), to_string(module_path))
  end
end
