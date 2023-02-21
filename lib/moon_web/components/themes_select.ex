defmodule MoonWeb.Components.ThemesSelect do
  @moduledoc false

  use MoonWeb, :stateful_component

  alias MoonWeb.Components.ThemesSelect.SelectedTheme
  alias MoonWeb.Components.ThemesSelect.SelectedDirection
  alias MoonWeb.Components.ThemesSelect.ThemeSwitcher
  alias MoonWeb.Components.ThemesSelect.RtlSwitcher

  alias Moon.Design.Popover
  alias Moon.Design.Button.IconButton
  alias Moon.Design.MenuItem

  prop(class, :string, default: nil)
  prop(theme_name, :any, default: "lab-light")
  prop(direction, :string, values: ["ltr", "rtl"], default: "ltr")
  prop(active_page, :any)
  prop(use_theme_switcher, :boolean, default: false)

  data(show_themes, :boolean, default: false)
  data(dark_mode, :boolean, default: false)
  data(is_rtl, :boolean, default: false)
  data(selected_theme_changeset, :any, default: SelectedTheme.changeset(%SelectedTheme{}, %{}))

  data(selected_direction_changeset, :any,
    default: SelectedDirection.changeset(%SelectedDirection{}, %{})
  )

  @available_themes [
    [key: "Aposta10", value: "aposta10", modes: true],
    [key: "Bitcasino", value: "bitcasino", modes: true],
    # [key: "Bombay club", value: "bombay-club", modes: false],
    # [key: "Btcxe", value: "btcxe", modes: false],
    # [key: "Hub88", value: "hub88", modes: false],
    [key: "Lab", value: "lab", modes: true],
    [key: "Livecasino", value: "livecasino", modes: true],
    # [key: "Hub88", value: "luckyslots", modes: false],
    # [key: "MissionsTool", value: "missions-tool", modes: true],
    # [key: "Moneyball", value: "moneyball", modes: true],
    [key: "Moon design", value: "theme-moon", modes: true],
    [key: "Slots", value: "slots", modes: true],
    [key: "Sportsbet", value: "sportsbet", modes: true]
  ]

  def available_themes do
    @available_themes
  end

  def render(assigns) do
    ~F"""
    <div>
      <Popover id="settings-popover" class="fixed bottom-4 ltr:right-4 rtl:left-4 z-50">
        <Popover.Trigger>
          <IconButton icon_only="media_tuner" class="shadow-moon-md rounded-full">
          </IconButton>
        </Popover.Trigger>
        <Popover.Panel position="top-end" class="flex flex-col gap-1 p-3 bg-gohan">
          <MenuItem as="a" class="cursor-default">
            {(@dark_mode && "Dark mode") || "Light mode"}
            <ThemeSwitcher
              {=@show_themes}
              {=@use_theme_switcher}
              {=@selected_theme_changeset}
              {=@dark_mode}
              on_theme_switch="toggle_dark_mode"
            />
          </MenuItem>
          <MenuItem as="a" class="cursor-default">
            {(@is_rtl && "RTL mode") || "LTR mode"}
            <RtlSwitcher
              {=@show_themes}
              {=@use_theme_switcher}
              {=@selected_direction_changeset}
              {=@is_rtl}
              on_direction_switch="toggle_direction"
            />
          </MenuItem>
        </Popover.Panel>
      </Popover>
    </div>
    """
  end

  def mount(socket) do
    selected_theme = %SelectedTheme{}
    selected_direction = %SelectedDirection{}
    selected_theme_changeset = SelectedTheme.changeset(selected_theme, %{})
    selected_direction_changeset = SelectedDirection.changeset(selected_direction, %{})

    socket =
      assign(socket,
        selected_theme_changeset: selected_theme_changeset,
        selected_direction_changeset: selected_direction_changeset
      )

    {:ok, socket}
  end

  def update(assigns, socket) do
    is_dark = String.contains?(assigns.theme_name, "dark")
    is_rtl = assigns.direction == "rtl"
    selected_theme = %SelectedTheme{is_dark: is_dark}
    selected_direction = %SelectedDirection{is_rtl: is_rtl}

    socket =
      socket
      |> assign(assigns)
      |> assign(dark_mode: is_dark)
      |> assign(selected_theme: selected_theme)
      |> assign(is_rtl: is_rtl)
      |> assign(selected_direction: selected_direction)

    {:ok, socket}
  end

  def handle_event("toggle_themes", _props, socket) do
    {:noreply, assign(socket, show_themes: !socket.assigns.show_themes)}
  end

  def handle_event("toggle_dark_mode", params, socket) do
    %{
      active_page: active_page,
      theme_name: theme,
      is_rtl: is_rtl,
      selected_direction_changeset: selected_direction_changeset
    } = socket.assigns

    theme = String.replace(theme, ["-light", "-dark"], "")

    new_path =
      generate_path(
        socket,
        active_page,
        theme,
        params["selected_theme"]["is_dark"] == "true",
        is_rtl
      )

    selected_theme_changeset = SelectedTheme.changeset(socket.assigns.selected_theme, params)

    socket =
      socket
      |> assign(selected_theme_changeset: selected_theme_changeset)
      |> assign(selected_direction_changeset: selected_direction_changeset)

    {:noreply, push_redirect(socket, to: new_path)}
  end

  def handle_event("toggle_direction", params, socket) do
    %{
      active_page: active_page,
      theme_name: theme,
      dark_mode: dark_mode,
      selected_theme_changeset: selected_theme_changeset
    } = socket.assigns

    theme = String.replace(theme, ["-light", "-dark"], "")

    new_path =
      generate_path(
        socket,
        active_page,
        theme,
        dark_mode,
        params["selected_direction"]["is_rtl"] == "true"
      )

    selected_direction_changeset =
      SelectedDirection.changeset(socket.assigns.selected_direction, params)

    socket =
      socket
      |> assign(selected_theme_changeset: selected_theme_changeset)
      |> assign(selected_direction_changeset: selected_direction_changeset)

    {:noreply, push_redirect(socket, to: new_path)}
  end

  def handle_event("update_selected_theme", %{"value" => theme}, socket) do
    %{active_page: active_page, dark_mode: dark_mode, is_rtl: is_rtl} = socket.assigns
    new_path = generate_path(socket, active_page, theme, dark_mode, is_rtl)
    {:noreply, push_redirect(socket, to: new_path)}
  end

  defp generate_path(socket, active_page, theme, dark_mode, is_rtl) do
    theme_name = "#{theme}-#{if dark_mode, do: "dark", else: "light"}"
    direction = if is_rtl, do: "rtl", else: "ltr"
    Routes.live_path(socket, active_page, theme_name, direction, %{})
  end
end
