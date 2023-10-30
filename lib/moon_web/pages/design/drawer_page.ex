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
        to: "/components",
        name: "Components"
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
            :name => ~c"is_open",
            :type => ~c"boolean",
            :required => ~c"No",
            :default => ~c"false",
            :description => ~c"Whether or not the Drawer is opened"
          },
          %{
            :name => ~c"on_close",
            :type => ~c"event",
            :required => ~c"No",
            :default => ~c"-",
            :description => ~c"Handler for open/close of the element"
          },
          %{
            :name => ~c"panel",
            :type => ~c"slot",
            :required => ~c"Yes",
            :default => ~c"-",
            :description => ~c"Content of Drawer element, see Drawer.Panel"
          },
          %{
            :name => ~c"backdrop",
            :type => ~c"slot",
            :required => ~c"No",
            :default => ~c"-",
            :description => ~c"Backdrop of Drawer element, see Drawer.Backdrop"
          }
        ]}
      />

      <PropsTable
        title="Drawer.Panel"
        data={[
          %{
            :name => ~c"position",
            :type => ~c"top | bottom | start | end",
            :required => ~c"No",
            :default => ~c"end",
            :description => ~c"Drawer position on screen"
          },
          %{
            :name => ~c"class",
            :type => ~c"css_class",
            :required => ~c"No",
            :default => ~c"-",
            :description => ~c"Tailwind classes for custom styles"
          }
        ]}
      />

      <PropsTable
        title="Drawer.Backdrop"
        data={[
          %{
            :name => ~c"class",
            :type => ~c"css_class",
            :required => ~c"No",
            :default => ~c"-",
            :description => ~c"Tailwind classes for custom styles"
          }
        ]}
      />
    </Page>
    """
  end
end
