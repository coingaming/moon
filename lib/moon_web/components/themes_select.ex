defmodule MoonWeb.Components.ThemesSelect do
  @moduledoc false

  use MoonWeb, :stateful_component

  alias Moon.Design.Popover
  alias Moon.Design.Button.IconButton
  alias Moon.Design.MenuItem
  alias Moon.Design.Switch

  alias Moon.Icons.{TextLeftAlign, TextRightAlign, OtherMoon, OtherSun}

  prop(theme_name, :string, from_context: :theme_name)
  prop(direction, :string, values: ["ltr", "rtl"], from_context: :direction)
  prop(active_page, :any, from_context: :active_page)

  data(is_rtl, :boolean)
  data(is_dark, :boolean)
  data(theme, :string)

  def update(assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign(
       is_rtl: assigns.direction == "rtl",
       is_dark: String.contains?(assigns.theme_name, "-dark"),
       theme: String.replace(assigns.theme_name, ["-light", "-dark"], "")
     )}
  end

  def render(assigns) do
    ~F"""
    <div>
      <Popover
        id="settings-popover"
        class="fixed bottom-4 lg:bottom-20 ltr:right-4 rtl:left-4 lg:z-50 z-[9999]"
      >
        <Popover.Trigger>
          <IconButton icon_only="media_tuner" class="shadow-moon-md rounded-full">
          </IconButton>
        </Popover.Trigger>
        <Popover.Panel position="top-end" class="flex flex-col gap-1 p-3 bg-gohan">
          <MenuItem as="a" class="cursor-default">
            {(@is_dark && "Dark mode") || "Light mode"}
            <Switch size="xs" checked={@is_dark} on_change="toggle_dark_mode">
              <:on_icon><OtherMoon /></:on_icon>
              <:off_icon><OtherSun /></:off_icon>
            </Switch>
          </MenuItem>
          <MenuItem as="a" class="cursor-default">
            {(@is_rtl && "RTL mode") || "LTR mode"}
            <Switch size="xs" checked={@is_rtl} on_change="toggle_direction">
              <:on_icon><TextRightAlign /></:on_icon>
              <:off_icon><TextLeftAlign /></:off_icon>
            </Switch>
          </MenuItem>
        </Popover.Panel>
      </Popover>
    </div>
    """
  end

  def handle_event("toggle_dark_mode", _params, socket) do
    socket = assign(socket, :is_dark, !socket.assigns.is_dark)
    {:noreply, redirect(socket, to: generate_path(socket.assigns))}
  end

  def handle_event("toggle_direction", _params, socket) do
    socket = assign(socket, :is_rtl, !socket.assigns.is_rtl)
    {:noreply, redirect(socket, to: generate_path(socket.assigns))}
  end

  def generate_path(%{
        active_page: active_page,
        theme: theme,
        is_rtl: is_rtl,
        is_dark: is_dark
      }) do
    theme_name = "#{theme}-#{if is_dark, do: "dark", else: "light"}"
    direction = if is_rtl, do: "rtl", else: "ltr"
    live_path(MoonWeb.Endpoint, active_page, %{theme_name: theme_name, direction: direction})
  end
end
