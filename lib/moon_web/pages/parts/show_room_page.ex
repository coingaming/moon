defmodule MoonWeb.Pages.Parts.ShowRoomPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.ShowRoomPage.EditableTable
  alias MoonWeb.Components.ShowRoomPage.Header
  alias MoonWeb.Components.ShowRoomPage.Sidebar
  alias MoonWeb.Components.ShowRoomPage.Wizard

  alias Moon.Parts.Wizard
  alias Moon.Parts.Modal
  alias Moon.Design.Tabs
  alias MoonWeb.Components.ShowRoomPage.Wizard.HeaderOptions
  alias MoonWeb.Components.ShowRoomPage.Wizard.SidebarOptions
  alias Moon.Parts.IconButton
  alias Moon.Design.Tooltip

  prop(theme_name, :any, default: "theme-moon-light")
  prop(direction, :string, values: ["ltr", "rtl"], default: "ltr")

  data(title, :string, default: "BackOffice templates")
  data(default_title, :string, default: "BackOffice templates")

  data(description, :string,
    default:
      "
    Boost efficiency with BackOffice templates powered by Moon. Access diverse options via the bottom-right wizard, and customize your sidebar using the editable table below."
  )

  data(has_breadcrumbs, :boolean, default: true)
  data(has_button_group, :boolean, default: true)
  data(has_left_button, :boolean, default: true)
  data(has_right_button, :boolean, default: true)

  data(has_other_button_group, :boolean, default: true)
  data(has_other_left_button, :boolean, default: true)
  data(has_other_right_button, :boolean, default: true)

  data(value, :string, values: ["slim", "generic", "wide"], default: "generic")

  data(light_sidebar, :boolean, default: false)
  data(light_header, :boolean, default: true)

  data(selected, :integer, default: 0)
  data(is_open, :boolean, default: false)

  data(steps, :list,
    default: [
      %{
        title: "Sidebar selection",
        text: "Tailor your app with Moon's dynamic sidebar options."
      },
      %{
        title: "Header customization",
        text:
          "Explore the header options and find the perfect fit for your BackOffice environment."
      }
    ]
  )

  data(tab_index, :integer)
  data(selected_header, :integer, default: 0)

  data(editable_menu_items, :list,
    default: [
      %{
        icon: "generic_loyalty",
        name: "Menu Item 1",
        link: "/show-room?page=1",
        active: false
      },
      %{
        icon: "other_rocket",
        name: "Menu Item 2",
        link: "/show-room?page=2",
        active: false
      },
      %{
        icon: "other_lifebuoy",
        name: "Menu Item 3",
        link: "/show-room?page=3",
        active: false
      }
    ]
  )

  data(active_page, :string)

  def mount(params, _session, socket) do
    {:ok, assign(socket, active_page: "page=#{params["page"] || 1}")}
  end

  def render(assigns) do
    ~F"""
    <div role="main" class={"bg-gohan text-bulma flex", @theme_name} dir={@direction}>
      <Sidebar.Slim
        id="show_room_slim_sidebar"
        :if={@value == "slim"}
        light_theme={@light_sidebar}
        editable_menu_items={@editable_menu_items}
        active_page={@active_page}
      />
      <Sidebar.Generic
        id="show_room_generic_sidebar"
        :if={@value == "generic"}
        light_theme={@light_sidebar}
        editable_menu_items={@editable_menu_items}
        active_page={@active_page}
      />
      <Sidebar.Wide
        id="show_room_wide_sidebar"
        :if={@value == "wide"}
        light_theme={@light_sidebar}
        editable_menu_items={@editable_menu_items}
        active_page={@active_page}
      />
      <div class={merge([
        "min-h-screen flex-1 w-0 flex flex-col ltr:lg:rounded-tl-3xl rtl:lg:rounded-tr-3xl",
        "lg:ms-[4.5rem]": @value == "slim",
        "lg:ms-[22.5rem]": @value == "generic",
        "lg:ms-[27rem]": @value == "wide"
      ])}>
        <div class="flex flex-col">
          <Header.WithTitleAndDescription
            :if={@selected_header == 0}
            id="title_only_header"
            default_title={@default_title}
            {=@description}
            {=@has_breadcrumbs}
            {=@has_button_group}
            {=@has_left_button}
            {=@has_right_button}
            light_theme={@light_header}
          />
          <Header.WithTitle
            :if={@selected_header == 1}
            id="default_header"
            title={@title}
            has_button_group={@has_other_button_group}
            has_left_button={@has_other_left_button}
            has_right_button={@has_other_right_button}
            light_theme={@light_header}
          />

          <div>
            <Tooltip class="fixed right-8 bottom-12 md:bottom-8 text-2xl z-20">
              <Tooltip.Trigger>
                <IconButton class="text-2xl" size="xl" on_click="set_open" icon="controls_plus" /></Tooltip.Trigger>
              <Tooltip.Content position="top-end">
                Explore Moon templates
                <Tooltip.Arrow />
              </Tooltip.Content>
            </Tooltip>

            <Modal id="show-room-modal" on_close="set_close" class="p-1 bg-bulma overflow-hidden" {=@is_open}>
              <Wizard id="tabs-wizzard" {=@steps} selected={@selected} class="min-h-[39.5rem] max-h-[43.5rem]">
                <:description>
                  <div class="py-8 flex flex-col gap-4 w-full">
                    <h3 class="text-moon-24 text-bulma font-grotesk md:inline hidden">Moon templates showcase</h3>
                    <p class="text-moon-14 text-bulma hidden md:inline">
                      Discover the versatility of Moon templates – explore their design and functionality across various screen sizes
                    </p>
                  </div>
                </:description>
                <Wizard.Panels class="max-h-[39.5rem]">
                  <Tabs.Panel><SidebarOptions
                      {=@value}
                      {=@light_sidebar}
                      on_change="changed"
                      toggle_sidebar_theme="toggle_sidebar_theme"
                    /></Tabs.Panel>
                  <Tabs.Panel><HeaderOptions
                      change_title="change_title"
                      change_default_title="change_default_title"
                      change_description="change_description"
                      header_change="handle_header_change"
                      title={@title}
                      default_title={@default_title}
                      {=@description}
                      {=@has_breadcrumbs}
                      {=@has_button_group}
                      {=@has_left_button}
                      {=@has_right_button}
                      {=@has_other_button_group}
                      {=@has_other_left_button}
                      {=@has_other_right_button}
                      tab_index={@selected_header}
                      {=@light_header}
                      toggle_header_theme="toggle_header_theme"
                    /></Tabs.Panel>
                </Wizard.Panels>
                <Wizard.Buttons on_save="set_close" on_cancel="set_close" />
              </Wizard>
            </Modal>
          </div>
          <EditableTable
            id="show-room"
            editable_menu_items={@editable_menu_items}
            change_name="change_menu_item"
            add_row="add_row"
          />
        </div>
      </div>
    </div>
    """
  end

  # def handle_event("handle_active_page", %{"selected-item" => selected_role}, socket) do
  #   {:noreply, assign(socket, :selected_role, selected_role)}
  # end

  def get_url(link) do
    link
    |> String.split("?")
    |> List.last()
  end

  def handle_event("set_open", _, socket) do
    Modal.open("show-room-modal")
    {:noreply, assign(socket, is_open: true)}
  end

  def handle_event("set_close", _, socket) do
    Modal.close("show-room-modal")
    {:noreply, assign(socket, is_open: false)}
  end

  def handle_event("changed", %{"value" => value}, socket) do
    {:noreply, assign(socket, value: value)}
  end

  def handle_event("change_sidebar_theme", %{"value" => sidebar_theme}, socket) do
    {:noreply, assign(socket, sidebar_theme: sidebar_theme, selected: 2)}
  end

  def handle_event("change_header_theme", %{"value" => header_theme}, socket) do
    {:noreply, assign(socket, header_theme: header_theme, selected: 2)}
  end

  def handle_event("toggle_breadcrumbs", _, socket) do
    socket = assign(socket, has_breadcrumbs: !socket.assigns.has_breadcrumbs, selected: 1)
    {:noreply, socket}
  end

  def handle_event("toggle_title", _, socket) do
    socket = assign(socket, has_title: !socket.assigns.has_title, selected: 1)
    {:noreply, socket}
  end

  def handle_event("toggle_description", _, socket) do
    socket = assign(socket, has_description: !socket.assigns.has_description, selected: 1)
    {:noreply, socket}
  end

  def handle_event("toggle_button_group", _, socket) do
    socket = assign(socket, has_button_group: !socket.assigns.has_button_group, selected: 1)
    {:noreply, socket}
  end

  def handle_event("toggle_left_button", _, socket) do
    socket = assign(socket, has_left_button: !socket.assigns.has_left_button, selected: 1)
    {:noreply, socket}
  end

  def handle_event("toggle_right_button", _, socket) do
    socket = assign(socket, has_right_button: !socket.assigns.has_right_button, selected: 1)
    {:noreply, socket}
  end

  def handle_event("toggle_other_button_group", _, socket) do
    socket =
      assign(socket, has_other_button_group: !socket.assigns.has_other_button_group, selected: 1)

    {:noreply, socket}
  end

  def handle_event("toggle_other_left_button", _, socket) do
    socket =
      assign(socket, has_other_left_button: !socket.assigns.has_other_left_button, selected: 1)

    {:noreply, socket}
  end

  def handle_event("toggle_other_right_button", _, socket) do
    socket =
      assign(socket, has_other_right_button: !socket.assigns.has_other_right_button, selected: 1)

    {:noreply, socket}
  end

  def handle_event("change_title", %{"value" => title}, socket) do
    socket = assign(socket, title: title, selected: 1)
    {:noreply, socket}
  end

  def handle_event("change_default_title", %{"value" => default_title}, socket) do
    socket = assign(socket, default_title: default_title, selected: 1)
    {:noreply, socket}
  end

  def handle_event(
        "change_menu_item",
        %{"value" => value, "num" => num, "field" => field},
        socket
      ) do
    {:noreply,
     assign(socket,
       editable_menu_items:
         socket.assigns.editable_menu_items
         |> Enum.with_index()
         |> Enum.map(fn {item, index} ->
           ("#{index}" == num && Map.put(item, :"#{field}", value)) || item
         end)
     )}
  end

  def handle_event("add_row", _, socket) do
    new_menu_item = %{
      icon: "other_smile",
      name: "Menu Item #{length(socket.assigns.editable_menu_items) + 1}",
      link: "/show-room?page#{length(socket.assigns.editable_menu_items) + 1}",
      active: true
    }

    {:noreply,
     assign(socket,
       editable_menu_items: socket.assigns.editable_menu_items ++ [new_menu_item]
     )}
  end

  def handle_event("toggle_sidebar_theme", _, socket) do
    {:noreply, assign(socket, light_sidebar: !socket.assigns.light_sidebar)}
  end

  def handle_event("toggle_header_theme", _, socket) do
    {:noreply, assign(socket, light_header: !socket.assigns.light_header, selected: 1)}
  end

  def handle_event("change_description", %{"value" => description}, socket) do
    socket = assign(socket, description: description, selected: 1)
    {:noreply, socket}
  end

  def handle_event("handle_header_change", %{"value" => selected_header}, socket) do
    {:noreply, assign(socket, selected_header: String.to_integer(selected_header), selected: 1)}
  end
end
