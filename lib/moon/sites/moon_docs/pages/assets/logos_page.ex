defmodule Moon.Sites.MoonDocs.Pages.Assets.LogosPage do
  use Moon.LiveView
  use Moon.Components.Context

  alias Moon.Sites.MoonDocs.Layouts.DefaultLayout
  alias Moon.Themed
  alias Moon.Components.Inline
  alias Moon.Components.CodePreview

  alias Moon.Assets.Logos
  alias Logos.LogoSportsbetSponsor
  alias Logos.LogoSportsbet

  def render(assigns) do
    ~H"""
    <Themed theme={{ Moon.Themes.SportsbetLight.get_config }}>
      <DefaultLayout id="moondocs" user_token={{ "user_token" }}>
        <Inline>
          
          <LogoSportsbetSponsor color="piccolo_100" height="1rem" width="1rem" />
          <LogoSportsbet color="piccolo_100" height="1rem" width="1rem" />
        </Inline>
        <#CodePreview>
          <Inline>
            
            <LogoSportsbetSponsor color="piccolo_100" height="1rem" width="1rem" />
            <LogoSportsbet color="piccolo_100" height="1rem" width="1rem" />
          </Inline>
        </#CodePreview>
      </DefaultLayout>
    </Themed>
    """
  end
end
