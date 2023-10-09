defmodule MoonWeb.Pages.Parts.WideSidebarPage do
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
        to: "/sidebar-examples/wide",
        name: "Wide"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction} hide_left_menu>
      <ComponentPageDescription title="Sidebar examples" />

      <ExamplesList examples={[
        SidebarExample.Wide
      ]} />
    </Page>
    """
  end

  def component_anatomy() do
    """
    <Sidebar.Wide>
      <Sidebar.SlimLogo />
      <:slim_top>
        <Sidebar.SlimMenuLink>...</Sidebar.SlimMenuLink>
      </:slim_top>
      <:slim_bottom>
        <Sidebar.SlimMenuLink>...</Sidebar.SlimMenuLink>
      </:slim_bottom>
      <:generic>
        <Sidebar.Section>
          <Sidebar.SectionTitle>...</Sidebar.SectionTitle>
          <Sidebar.Accordion accordion_header="...">
            <Sidebar.MenuLink>...</Sidebar.MenuLink>
          </Sidebar.Accordion>
        </Sidebar.Section>
      </:generic>
    </Sidebar.Wide>
    """
  end
end
