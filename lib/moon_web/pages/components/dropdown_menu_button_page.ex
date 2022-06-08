defmodule MoonWeb.Pages.Components.DropdownMenuButtonPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Assets.Icons.IconMore
  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.DropdownMenuButton
  alias Moon.Components.DropdownMenuItem
  alias Moon.Components.DropdownMenuItems
  alias Moon.Components.Heading
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page

  data breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
      },
      %{
        to: "/components/dropdown_menu_button",
        name: "DropdownMenuButton"
      }
    ]

  def mount(params, _session, socket) do
    socket =
      assign(socket,
        theme_name: params["theme_name"] || "moon-design-light",
        active_page: __MODULE__,
        show_options: false
      )

    {:ok, socket}
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page theme_name={@theme_name} active_page={@active_page} breadcrumbs={@breadcrumbs}>
      <TopToDown>
        <Heading size={56} class="mb-4">DropdownMenuButton</Heading>

        <Context put={theme_class: @theme_name}>
          <ExampleAndCode id="dropdown_menu_button_1">
            <:example>
              <div class="flex justify-center">
                <DropdownMenuButton show={@show_options} placement="bottom-end" on_toggle="toggle_options">
                  <IconMore />

                  <:menu>
                    <DropdownMenuItems>
                      <DropdownMenuItem>Edit</DropdownMenuItem>
                      <DropdownMenuItem>Share</DropdownMenuItem>
                      <DropdownMenuItem>Delete</DropdownMenuItem>
                    </DropdownMenuItems>
                  </:menu>
                </DropdownMenuButton>
              </div>
            </:example>

            <:code>{dropdown_menu_button_1_code()}</:code>
          </ExampleAndCode>
        </Context>
      </TopToDown>
    </Page>
    """
  end

  def handle_event("toggle_options", _, socket) do
    {:noreply, assign(socket, show_options: !socket.assigns.show_options)}
  end

  defp dropdown_menu_button_1_code do
    """
      <DropdownMenuButton show={@show_options} placement="bottom-end" on_toggle="toggle_options">
        <IconMore />

        <:menu>
          <DropdownMenuItems>
            <DropdownMenuItem>Edit</DropdownMenuItem>
            <DropdownMenuItem>Share</DropdownMenuItem>
            <DropdownMenuItem>Delete</DropdownMenuItem>
          </DropdownMenuItems>
        </:menu>
      </DropdownMenuButton>
    """
  end
end
