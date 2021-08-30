defmodule MoonWeb.Pages.Components.DropdownMenuButtonPage do
  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias MoonWeb.Components.ExampleAndCode
  alias Moon.Assets.Icons.IconMore
  alias Moon.Components.CodePreview
  alias Moon.Components.DropdownMenuButton
  alias Moon.Components.DropdownMenuItem
  alias Moon.Components.DropdownMenuItems
  alias Moon.Components.Heading
  alias MoonWeb.Components.Breadcrumbs

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
        theme_name: params["theme_name"] || "sportsbet-dark",
        active_page: __MODULE__,
        show_options: false
      )

    {:ok, socket}
  end

  def render(assigns) do
    ~F"""
    <TopToDown>
      <Breadcrumbs breadcrumbs={@breadcrumbs} class="mb-2" />
      <Heading size={32}>DropdownMenuButton</Heading>

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

        <:code>
          <#CodePreview>
        alias Moon.Components.DropdownMenuButton
        alias Moon.Components.DropdownMenuItem
        alias Moon.Components.DropdownMenuItems

        <DropdownMenuButton
          show={@show_options}
          placement="bottom-end"
          on_toggle="toggle_options"
        >
          <IconMore />

          <:menu>
            <DropdownMenuItems>
              <DropdownMenuItem>Edit</DropdownMenuItem>
              <DropdownMenuItem>Share</DropdownMenuItem>
              <DropdownMenuItem>Delete</DropdownMenuItem>
            </DropdownMenuItems>
          </:menu>
        </DropdownMenuButton>

        def handle_event("toggle_options", _, socket) do
          {:noreply, assign(socket, show_options: !socket.assigns.show_options)}
        end
          </#CodePreview>
        </:code>
      </ExampleAndCode>
    </TopToDown>
    """
  end

  def handle_event("toggle_options", _, socket) do
    {:noreply, assign(socket, show_options: !socket.assigns.show_options)}
  end
end
