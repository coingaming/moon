defmodule Moon.Assets.Logo do
  use Moon.StatelessComponent
  alias Moon.Assets.Logo

  prop(name, :string)

  prop(color, :string, values: Moon.colors())
  prop(height, :string)
  prop(width, :string)
  prop(font_size, :string)
  prop(vertical_align, :string)

  @assets_map %{
    logo_aposta10_full: Logo.LogoAposta10Full,
    logo_aposta10_short: Logo.LogoAposta10Short,
    logo_bitcasino_full: Logo.LogoBitcasinoFull,
    logo_bitcasino_short: Logo.LogoBitcasinoShort,
    logo_bombay_full: Logo.LogoBombayFull,
    logo_bombay_short: Logo.LogoBombayShort,
    logo_hub88_full: Logo.LogoHub88Full,
    logo_hub88_short: Logo.LogoHub88Short,
    logo_livecasino_full: Logo.LogoLivecasinoFull,
    logo_luckyslots_full: Logo.LogoLuckyslotsFull,
    logo_luckyslots_short: Logo.LogoLuckyslotsShort,
    logo_missions: Logo.LogoMissions,
    logo_moneyball: Logo.LogoMoneyball,
    logo_moon_design: Logo.LogoMoonDesign,
    logo_slots_full: Logo.LogoSlotsFull,
    logo_slots_short: Logo.LogoSlotsShort,
    logo_sportsbet_full: Logo.LogoSportsbetFull,
    logo_sportsbet_short: Logo.LogoSportsbetShort,
    logo_sportsbet_sponsor: Logo.LogoSportsbetSponsor,
    logo_sportsbet: Logo.LogoSportsbet,
    moon_pay: Logo.MoonPay
  }
  def icon_name_to_module(icon_name) do
    @assets_map[:"#{icon_name}"]
  end

  def render(assigns) do
    ~H"""
    {{ @name && icon_name_to_module(@name) && live_component(@socket, icon_name_to_module(@name), color: @color, height: @height, width: @width, font_size: @font_size, vertical_align: @vertical_align) }}
    """
  end
end
