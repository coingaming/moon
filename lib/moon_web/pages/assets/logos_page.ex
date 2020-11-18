defmodule MoonWeb.Pages.Assets.LogosPage do
  use Moon.LiveView

  alias Moon.Components.Inline
  alias Moon.Components.CodePreview

  alias Moon.Assets.Logos
  alias Logos.LogoMissions
  alias Logos.LogoSportsbetSponsor
  alias Logos.LogoSportsbet
  alias Logos.MoonPay

  def render(assigns) do
    ~H"""
    <Inline font_size="10em">
      <LogoMissions />
      <LogoSportsbetSponsor />
      <LogoSportsbet />
      <MoonPay />
    </Inline>
    <#CodePreview>
      <Inline font_size="10em">
        <LogoMissions />
        <LogoSportsbetSponsor />
        <LogoSportsbet />
        <MoonPay />
      </Inline>
    </#CodePreview>
    """
  end
end
