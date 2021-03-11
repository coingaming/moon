defmodule MoonWeb.Pages.Components.TabsPage do
  require Logger
  use MoonWeb, :live_view
  alias MoonWeb.Components.ExampleAndCode
  alias Moon.Components.Heading
  alias Moon.Components.CodePreview
  alias Moon.Components.Dropdown
  alias Moon.Components.Link
  alias Moon.Components.CheckboxMultiselect
  alias Moon.Components.SingeItemSelect


  def mount(params, _session, socket) do
    {:ok,
     assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def render(assigns) do
    ~H"""
    {{ asset_import @socket, "js/tailwind" }}

    <Heading size=32 class="mb-8">Tabs</Heading>

    <p>
    A menu of items for users to move between sections of the application.

    By default, tabs will provide an accessible skip link, and overflow with horizontal scrolling.

    TabLink component provides the tab interaction.
    </p>
    """
  end
end
