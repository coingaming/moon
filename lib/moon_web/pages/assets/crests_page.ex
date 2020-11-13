defmodule MoonWeb.Pages.Assets.CrestsPage do
  use Moon.LiveView

  alias Moon.Components.Inline
  alias Moon.Components.CodePreview

  alias Moon.Assets.Crests
  alias Crests.CrestArsenal
  alias Crests.CrestFlamengo
  alias Crests.CrestSouthampton
  alias Crests.CrestWatford

  def render(assigns) do
    ~H"""
    <Inline>
      <CrestArsenal color="piccolo_100" height="1rem" width="1rem" />
        <CrestFlamengo color="piccolo_100" height="1rem" width="1rem" />
        <CrestSouthampton color="piccolo_100" height="1rem" width="1rem" />
        <CrestWatford color="piccolo_100" height="1rem" width="1rem" />
    </Inline>
    <#CodePreview>
      <Inline>
        <CrestArsenal color="piccolo_100" height="1rem" width="1rem" />
        <CrestFlamengo color="piccolo_100" height="1rem" width="1rem" />
        <CrestSouthampton color="piccolo_100" height="1rem" width="1rem" />
        <CrestWatford color="piccolo_100" height="1rem" width="1rem" />
      </Inline>
    </#CodePreview>
    """
  end
end
