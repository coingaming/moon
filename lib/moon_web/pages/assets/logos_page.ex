
defmodule MoonWeb.Pages.Assets.LogosPage do
  use MoonWeb, :live_view

  alias Moon.Components.Inline
  alias Moon.Components.CodePreview

  alias Moon.Assets.Logos
  alias Logos.LogoAposta10Full
  alias Logos.LogoAposta10Short
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
  alias Logos.LogoMoonDesign
  alias Logos.LogoSlotsFull
  alias Logos.LogoSlotsShort
  alias Logos.LogoSportsbetFull
  alias Logos.LogoSportsbetShort
  alias Logos.LogoSportsbetSponsor
  alias Logos.LogoSportsbet
  alias Logos.MoonPay

  def mount(%{"theme_name" => theme_name}, _session, socket) do
    {:ok, assign(socket, theme_name: theme_name, active_page: __MODULE__)}
  end

  def render(assigns) do
    ~H"""
    <Inline font_size="10em">
      <LogoAposta10Full />
      <LogoAposta10Short />
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
      <LogoMoonDesign />
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
        <LogoAposta10Full />
        <LogoAposta10Short />
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
        <LogoMoonDesign />
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
    