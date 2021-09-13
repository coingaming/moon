defmodule MoonWeb.Components.ThemesSelect do
  use MoonWeb, :stateful_component
  alias Moon.Components.Switch
  alias Moon.Assets.Icons.Mediatuner
  alias Moon.Assets.Logos.LogoAposta10Short
  alias Moon.Assets.Logos.LogoBitcasinoShort
  alias Moon.Assets.Logos.LogoSportsbetShort
  alias Moon.Assets.Logos.LogoLivecasinoShort
  alias Moon.Assets.Logos.LogoSlotsShort
  alias Moon.Assets.Logos.LogoMoonDesignShort

  prop class, :string, default: nil
  prop theme_name, :any, default: "lab-light"
  prop active_page, :any

  data show_themes, :boolean, default: false
  data dark_mode, :boolean, default: false
  data switch_value, :boolean, default: false

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
    # [key: "Moon design", value: "moon-design", modes: true],
    [key: "Slots", value: "slots", modes: true],
    [key: "Sportsbet", value: "sportsbet", modes: true]
  ]

  def available_themes do
    @available_themes
  end

  def render(assigns) do
    ~F"""
    <div>
      <button
        :on-click="toggle_themes"
        type="button"
        aria-pressed="false"
        class="bg-gohan-100 text-piccolo-100 hover:bg-gohan-120  fixed bottom-4 right-4 inline-flex flex-shrink-0
               border-2 border-transparent rounded-full cursor-pointer transition-colors ease-in-out
               duration-200 focus:outline-none z-40"
      >
        <Mediatuner color="krillin-100" font_size="2rem" />
      </button>

      <div class={"fixed bottom-16 right-4", hidden: !@show_themes}>
        {#for theme <- available_themes()}
          <button
            :on-click="update_selected_theme"
            type="button"
            value={if !theme[:modes],
              do: theme[:value],
              else: if(@dark_mode, do: "#{theme[:value]}-dark", else: "#{theme[:value]}-light")}
            class="p-2 rounded-full ml-4 text-piccolo-100 bg-gohan-100 hover:bg-gohan-120 inline-flex items-center justify-center"
          >
            {#if theme[:value] == "aposta10"}
              <LogoAposta10Short />
            {#elseif theme[:value] == "bitcasino"}
              <LogoBitcasinoShort />
            {#elseif theme[:value] == "livecasino"}
              <LogoLivecasinoShort />
            {#elseif theme[:value] == "lab"}
              <LogoMoonDesignShort />
            {#elseif theme[:value] == "slots"}
              <LogoSlotsShort />
            {#elseif theme[:value] == "sportsbet"}
              <LogoSportsbetShort />
            {#else}
              <LogoMoonDesignShort />
            {/if}
          </button>
        {/for}
      </div>
      <div class={"fixed bottom-28 right-4", hidden: !@show_themes}>
        <Switch icons checked={@switch_value} on_change="toggle_theme_mode" />
      </div>
    </div>
    """
  end

  def handle_event("toggle_themes", _props, socket) do
    {:noreply, assign(socket, show_themes: !socket.assigns.show_themes)}
  end

  def handle_event("toggle_theme_mode", _props, socket) do
    {:noreply,
     assign(socket,
       switch_value: !socket.assigns.switch_value,
       dark_mode: !socket.assigns.dark_mode
     )}
  end

  def handle_event(
        "update_selected_theme",
        %{"value" => theme_name},
        socket
      ) do
    new_path = Routes.live_path(socket, socket.assigns.active_page, theme_name: theme_name)
    {:noreply, redirect(socket, to: new_path)}
  end
end
