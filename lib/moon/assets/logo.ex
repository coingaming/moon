defmodule Moon.Assets.Logo do
  use Moon.StatelessComponent
  alias Moon.Assets.Logos

  prop name, :string

  prop color, :string, values: Moon.colors()
  prop height, :string
  prop width, :string
  prop font_size, :string
  prop vertical_align, :string
  prop click, :event
  prop class, :string

  @assets_map %{
    logo_aposta10_full: Logos.LogoAposta10Full,
    logo_aposta10_short: Logos.LogoAposta10Short,
    logo_bitcasino_full: Logos.LogoBitcasinoFull,
    logo_bitcasino_short: Logos.LogoBitcasinoShort,
    logo_bombay_full: Logos.LogoBombayFull,
    logo_bombay_short: Logos.LogoBombayShort,
    logo_comms_full: Logos.LogoCommsFull,
    logo_comms_short: Logos.LogoCommsShort,
    logo_drop: Logos.LogoDrop,
    logo_hub88_full: Logos.LogoHub88Full,
    logo_hub88_short: Logos.LogoHub88Short,
    logo_lab_full: Logos.LogoLabFull,
    logo_livecasino_full: Logos.LogoLivecasinoFull,
    logo_luckyslots_full: Logos.LogoLuckyslotsFull,
    logo_luckyslots_short: Logos.LogoLuckyslotsShort,
    logo_missions: Logos.LogoMissions,
    logo_moneyball: Logos.LogoMoneyball,
    logo_moon_design_short: Logos.LogoMoonDesignShort,
    logo_moon_design: Logos.LogoMoonDesign,
    logo_powered_by_hub88: Logos.LogoPoweredByHub88,
    logo_slots_full: Logos.LogoSlotsFull,
    logo_slots_short: Logos.LogoSlotsShort,
    logo_sportsbet_full: Logos.LogoSportsbetFull,
    logo_sportsbet_short: Logos.LogoSportsbetShort,
    logo_sportsbet_sponsor: Logos.LogoSportsbetSponsor,
    logo_sportsbet: Logos.LogoSportsbet,
    logo_utorg: Logos.LogoUtorg,
    moon_pay: Logos.MoonPay
  }
  def icon_name_to_module(icon_name) do
    @assets_map[:"#{icon_name}"]
  end

  def render(assigns) do
    ~H"""
    {{ @name && icon_name_to_module(@name) && live_component(@socket, icon_name_to_module(@name), color: @color, height: @height, width: @width, font_size: @font_size, vertical_align: @vertical_align, click: @click, class: @class) }}
    """
  end
end
