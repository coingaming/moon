defmodule MoonWeb.Components.LeftMenu do
  @moduledoc false

  use MoonWeb, :stateless_component

  alias MoonWeb.Components.LargeLogo
  alias MoonWeb.Pages
  alias MoonWeb.Components.SidebarLink
  alias MoonWeb.Components.SearchButton

  alias Moon.Design.Accordion
  alias Moon.Design.Drawer

  alias Moon.Icon

  prop(active_page, :module)
  prop(hide_items, :boolean)
  prop(menu_items, :list, default: MoonWeb.Schema.Link.menu())
  prop(is_hidden, :boolean, default: false)

  def render(assigns) do
    ~F"""
    <Drawer
      lg_persists
      id="left-menu"
      class={"lg:flex lg:start-0 lg:inset-y-0 lg:w-80 lg:z-50 inset-auto", invisible: @is_hidden}
    >
      <Drawer.Backdrop class="lg:hidden" />
      <Drawer.Panel position="start" class="w-80 bg-gohan shadow-moon-none">
        <nav
          aria-label="Sidebar"
          class="z-10 fixed top-0 h-screen w-80 flex flex-col flex-grow gap-6 pt-12 pb-20 px-5 lg:px-8 overflow-y-scroll"
        >
          <div class="flex items-center flex-shrink-0 ps-3 text-bulma">
            <a
              href={live_path(MoonWeb.Endpoint, MoonWeb.Pages.MainPage)}
              class="text-bulma hover:text-bulma active:text-bulma focus:text-bulma"
              aria-label="Surface.moon.io main page"
            >
              <LargeLogo class="h-6 w-[6.5rem]" />
            </a>
          </div>
          <div>
            <SearchButton id="moonweb-search" />
          </div>
          <div class="flex flex-col gap-1">
            {#for menu_item <- @menu_items, menu_item[:icon] != nil}
              <SidebarLink route={menu_item[:page]}><Icon class="w-6 h-6" name={menu_item[:icon]} />{menu_item[:key]}</SidebarLink>
            {/for}
          </div>
          <div class="flex flex-col gap-2">
            <p class="ps-2 text-moon-10-caption font-medium uppercase text-trunks">
              Components
            </p>
            <div class="flex flex-col gap-1">
              {#for menu_item <- @menu_items, menu_item[:icon] == nil}
                {#if menu_item[:children]}
                  <Accordion
                    id={"left-menu-design-#{menu_item[:key]}"}
                    value={(active_page_contains(@active_page, menu_item[:key]) && "0") || []}
                  >
                    <Accordion.Item has_content_outside>
                      <Accordion.Header icon_class="text-moon-24">{menu_item[:key]}</Accordion.Header>
                      <Accordion.Content>
                        <div class="flex-grow flex flex-col gap-2 pl-8">
                          {#for child_menu_item <- menu_item[:children]}
                            <SidebarLink route={child_menu_item[:page]}>{child_menu_item[:key]}</SidebarLink>
                          {/for}
                        </div>
                      </Accordion.Content>
                    </Accordion.Item>
                  </Accordion>
                {#else}
                  <SidebarLink route={menu_item[:page]}>{menu_item[:key]}</SidebarLink>
                {/if}
              {/for}

              <Accordion
                id="left-menu-components"
                value={(active_page_contains(@active_page, Pages.Components) && "0") || []}
              >
                <Accordion.Item has_content_outside>
                  <Accordion.Header icon_class="text-moon-24">Old components</Accordion.Header>
                  <Accordion.Content>
                    <div class="flex-grow flex flex-col gap-2 pl-8">
                      <SidebarLink route={Pages.Components.AccordionPage}>Accordion</SidebarLink>
                      <SidebarLink route={Pages.Components.AvatarPage}>Avatar</SidebarLink>
                      <SidebarLink route={Pages.Components.BannerPage}>Banner</SidebarLink>
                      <SidebarLink route={Pages.Components.BreadcrumbPage}>Breadcrumb</SidebarLink>
                      <SidebarLink route={Pages.Components.ButtonPage}>Button</SidebarLink>
                      <SidebarLink route={Pages.Components.CarouselPage}>Carousel</SidebarLink>

                      <Accordion
                        id="left-menu-components-charts"
                        value={(active_page_contains(@active_page, Pages.Components.Charts) && "0") || []}
                      >
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

                      <Accordion
                        id="left-menu-components-date"
                        value={(active_page_contains(@active_page, Pages.Components.Date) && "0") || []}
                      >
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

                      <Accordion
                        id="left-menu-components-dialog"
                        value={(active_page_contains(@active_page, Pages.Components.Dialog) && "0") || []}
                      >
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
                      <SidebarLink route={Pages.Components.LabelPage}>Label</SidebarLink>
                      <SidebarLink route={Pages.Components.ListItemsPage}>List items</SidebarLink>
                      <SidebarLink route={Pages.Components.LoaderPage}>Loader</SidebarLink>
                      <SidebarLink :if={!@hide_items} route={Pages.Components.PaginationPage}>Pagination</SidebarLink>

                      <Accordion
                        id="left-menu-components-progress"
                        value={(active_page_contains(@active_page, Pages.Components.Progress) && "0") || []}
                      >
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

                      <Accordion
                        id="left-menu-components-select"
                        value={(active_page_contains(@active_page, Pages.Components.Select) && "0") || []}
                      >
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
          </div>
        </nav>
      </Drawer.Panel>
    </Drawer>
    """
  end

  def active_page_contains(active_page, module_path) do
    String.contains?(to_string(active_page), to_string(module_path))
  end
end
