defmodule MoonWeb.Pages.Parts.GenericSidebarPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.Anatomy
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.PropsTable
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
        to: "/sidebar-examples/generic",
        name: "Generic"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="Sidebar examples" />

      <Anatomy>{component_anatomy()}</Anatomy>

      <ExamplesList examples={[
        SidebarExample.Generic
      ]} />

      <PropsTable module={Moon.Parts.Sidebar} />
      <PropsTable module={Moon.Parts.Sidebar.Logo} />
      <PropsTable module={Moon.Parts.Sidebar.Menu} />
      <PropsTable module={Moon.Parts.Sidebar.MenuLink} />
      <PropsTable module={Moon.Parts.Sidebar.SectionTitle} />
    </Page>
    """
  end

  def component_anatomy() do
    """
    <Sidebar>
      <Sidebar.Logo />
      <Sidebar.Menu>
        <Sidebar.SectionTitle>...</Sidebar.SectionTitle>
            <Sidebar.MenuLink>...</Sidebar.MenuLink>
      </Sidebar.Menu>
    </Sidebar>
    """
  end
end
