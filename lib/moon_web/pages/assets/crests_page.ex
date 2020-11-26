
defmodule MoonWeb.Pages.Assets.CrestsPage do
  use MoonWeb, :live_view

  alias Moon.Components.Inline
  alias Moon.Components.CodePreview

  alias Moon.Assets.Crests
  alias Crests.CrestArsenal
  alias Crests.CrestFlamengo
  alias Crests.CrestSouthampton
  alias Crests.CrestWatford

  def mount(%{"theme_name" => theme_name}, _session, socket) do
    {:ok, assign(socket, theme_name: theme_name, active_page: __MODULE__)}
  end

  def render(assigns) do
    ~H"""
    <Inline>
      <CrestArsenal font_size="10rem" />
      <CrestFlamengo font_size="10rem" />
      <CrestSouthampton font_size="10rem" />
      <CrestWatford font_size="10rem" />
    </Inline>
    <#CodePreview>
      <Inline>
        <CrestArsenal font_size="10rem" />
        <CrestFlamengo font_size="10rem" />
        <CrestSouthampton font_size="10rem" />
        <CrestWatford font_size="10rem" />
      </Inline>
    </#CodePreview>
    """
  end
end
    