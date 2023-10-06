defmodule MoonWeb.Pages.Parts.SlimSidebarPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ExamplesList
  alias MoonWeb.Examples.Parts.SidebarExample

  data(breadcrumbs, :any,
    default: [
      %{
        to: "/#",
        name: "Templates"
      },
      %{
        to: "/#",
        name: "Sidebar examples"
      },
      %{
        to: "/sidebar-examples/Slim",
        name: "Slim"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction} hide_left_menu>
      <ComponentPageDescription title="Sidebar examples" />

      <ExamplesList examples={[
        SidebarExample.Slim
      ]} />
    </Page>
    """
  end
end
