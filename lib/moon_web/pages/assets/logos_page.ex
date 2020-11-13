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
    <Inline>
      <LogoMissions color="piccolo_100" height="1rem" width="1rem" />
        <LogoSportsbetSponsor color="piccolo_100" height="1rem" width="1rem" />
        <LogoSportsbet color="piccolo_100" height="1rem" width="1rem" />
        <MoonPay color="piccolo_100" height="1rem" width="1rem" />
    </Inline>
    <#CodePreview>
      <Inline>

        <LogoMissions color="piccolo_100" height="1rem" width="1rem" />
        <LogoSportsbetSponsor color="piccolo_100" height="1rem" width="1rem" />
        <LogoSportsbet color="piccolo_100" height="1rem" width="1rem" />
        <MoonPay color="piccolo_100" height="1rem" width="1rem" />
      </Inline>
    </#CodePreview>
    """
  end
end
