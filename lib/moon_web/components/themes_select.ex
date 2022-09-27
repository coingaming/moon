defmodule MoonWeb.Components.ThemesSelect do
  @moduledoc false

  use MoonWeb, :stateful_component

  alias Moon.Assets.Logos.LogoAposta10Short
  alias Moon.Assets.Logos.LogoBitcasinoShort
  alias Moon.Assets.Logos.LogoLabFull
  alias Moon.Assets.Logos.LogoLivecasinoShort
  alias Moon.Assets.Logos.LogoSlotsShort
  alias Moon.Assets.Logos.LogoSportsbetShort
  alias Moon.Assets.Logos.LogoMoonDesignShort
  alias Moon.Components.Switch
  alias Moon.Icon

  prop class, :string, default: nil
  prop theme_name, :any, default: "lab-light"
  prop active_page, :any
  prop use_theme_switcher, :boolean, default: false

  data show_themes, :boolean, default: false
  data dark_mode, :boolean, default: false

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
    [key: "Moon design", value: "moon-design", modes: true],
    [key: "Slots", value: "slots", modes: true],
    [key: "Sportsbet", value: "sportsbet", modes: true]
  ]

  def available_themes do
    @available_themes
  end

  def update(assigns, socket) do
    socket =
      socket
      |> assign(assigns)
      |> assign(dark_mode: String.contains?(assigns.theme_name, "dark"))

    {:ok, socket}
  end

  def render(assigns) do
    ~F"""
    <div class="fixed fixed bottom-4 right-4 z-50">
      <button
        :on-click="toggle_themes"
        type="button"
        aria-pressed="false"
        class="bg-gohan-100 text-bulma-100 hover:bg-gohan-120 inline-flex shrink-0
               border-2 border-transparent rounded-full cursor-pointer transition-colors ease-in-out
               duration-200 shadow-md focus:outline-none"
      >
        <Icon name="media_tuner" color="krillin-100" font_size="2rem" />
      </button>

      <div class={"fixed bottom-16 right-4", hidden: !@show_themes or !@use_theme_switcher}>
        {#for theme <- available_themes()}
          <button
            :on-click="update_selected_theme"
            type="button"
            title={theme[:value]}
            value={theme[:value]}
            class="p-2 rounded-full ml-4 text-piccolo-100 bg-gohan-100 hover:bg-gohan-120 inline-flex items-center justify-center"
          >
            {#if theme[:value] == "aposta10"}
              <LogoAposta10Short />
            {#elseif theme[:value] == "bitcasino"}
              <LogoBitcasinoShort />
            {#elseif theme[:value] == "livecasino"}
              <LogoLivecasinoShort />
            {#elseif theme[:value] == "lab"}
              <LogoLabFull />
            {#elseif theme[:value] == "moon-design"}
              <LogoMoonDesignShort />
            {#elseif theme[:value] == "slots"}
              <LogoSlotsShort />
            {#elseif theme[:value] == "sportsbet"}
              <LogoSportsbetShort />
            {/if}
          </button>
        {/for}
      </div>
      <div class={
        "fixed right-4",
        hidden: !@show_themes,
        "bottom-28": @use_theme_switcher,
        "bottom-16": !@use_theme_switcher
      }>
        <Switch id="theme_switcher" icons checked={@dark_mode} /> <!-- TODO, fix theme switcher -->
      </div>
    </div>
    """
  end

  def handle_event("toggle_themes", _props, socket) do
    {:noreply, assign(socket, show_themes: !socket.assigns.show_themes)}
  end

  def handle_event("toggle_dark_mode", _props, socket) do
    %{active_page: active_page, dark_mode: dark_mode, theme_name: theme} = socket.assigns
    theme = String.replace(theme, ["-light", "-dark"], "")
    new_path = generate_path(socket, active_page, theme, !dark_mode)
    {:noreply, redirect(socket, to: new_path)}
  end

  def handle_event("update_selected_theme", %{"value" => theme}, socket) do
    %{active_page: active_page, dark_mode: dark_mode} = socket.assigns
    new_path = generate_path(socket, active_page, theme, dark_mode)
    {:noreply, redirect(socket, to: new_path)}
  end

  defp generate_path(socket, active_page, theme, dark_mode) do
    theme_name = "#{theme}-#{if dark_mode, do: "dark", else: "light"}"
    Routes.live_path(socket, active_page, theme_name, %{})
  end
end
