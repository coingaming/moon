
defmodule MoonWeb.Pages.Assets.LogosPage do
  use Moon.LiveView

  alias Moon.Components.Inline
  alias Moon.Components.CodePreview

  alias Moon.Assets.Logos
  alias Logos.LogoBitcasinoFull
  alias Logos.LogoBitcasinoShort
  alias Logos.LogoBombayFull
  alias Logos.LogoBombayShort
  alias Logos.LogoHub88Full
  alias Logos.LogoHub88Short
  alias Logos.LogoLivecasinoFull
  alias Logos.LogoLuckyslotsFull
  alias Logos.LogoLuckyslotsShort
  alias Logos.LogoMissions
  alias Logos.LogoMoneyball
  alias Logos.LogoSlotsFull
  alias Logos.LogoSlotsShort
  alias Logos.LogoSportsbetFull
  alias Logos.LogoSportsbetShort
  alias Logos.LogoSportsbetSponsor
  alias Logos.LogoSportsbet
  alias Logos.MoonPay

  def render(assigns) do
    ~H"""
    <Inline font_size="10em">
      <LogoBitcasinoFull />
      <LogoBitcasinoShort />
      <LogoBombayFull />
      <LogoBombayShort />
      <LogoHub88Full />
      <LogoHub88Short />
      <LogoLivecasinoFull />
      <LogoLuckyslotsFull />
      <LogoLuckyslotsShort />
      <LogoMissions />
      <LogoMoneyball />
      <LogoSlotsFull />
      <LogoSlotsShort />
      <LogoSportsbetFull />
      <LogoSportsbetShort />
      <LogoSportsbetSponsor />
      <LogoSportsbet />
      <MoonPay />
    </Inline>
    <#CodePreview>
      <Inline font_size="10em">
        <LogoBitcasinoFull />
        <LogoBitcasinoShort />
        <LogoBombayFull />
        <LogoBombayShort />
        <LogoHub88Full />
        <LogoHub88Short />
        <LogoLivecasinoFull />
        <LogoLuckyslotsFull />
        <LogoLuckyslotsShort />
        <LogoMissions />
        <LogoMoneyball />
        <LogoSlotsFull />
        <LogoSlotsShort />
        <LogoSportsbetFull />
        <LogoSportsbetShort />
        <LogoSportsbetSponsor />
        <LogoSportsbet />
        <MoonPay />
      </Inline>
    </#CodePreview>
    """
  end
end
    