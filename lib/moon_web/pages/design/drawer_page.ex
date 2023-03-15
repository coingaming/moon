defmodule MoonWeb.Pages.Design.DrawerPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.ExamplesList
  alias MoonWeb.Components.PropsTable

  alias MoonWeb.Examples.Design.DrawerExample

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components v2"
      },
      %{
        to: "/components/v2/drawer",
        name: "Drawer"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription is_in_progress is_aria_support is_rtl_support title="Drawer">
        <p>
          The Drawer component is a panel that slides out from the edge of the screen. It can be useful when you need users to complete a task or view some details without leaving the current page.
        </p>
      </ComponentPageDescription>

      <ExamplesList examples={[
        DrawerExample.Default,
        DrawerExample.Positions,
        DrawerExample.WithBackdrop,
        DrawerExample.WithClose
      ]} />

      <PropsTable
        title="Drawer props"
        data={[
          %{
            :name => 'default',
            :type => 'slot',
            :required => 'No',
            :default => '-',
            :description => ''
          }
        ]}
      />

      <PropsTable
        title="Panel props"
        data={[
          %{
            :name => 'default',
            :type => 'slot',
            :required => 'No',
            :default => '-',
            :description => ''
          }
        ]}
      />
    </Page>
    """
  end
end
