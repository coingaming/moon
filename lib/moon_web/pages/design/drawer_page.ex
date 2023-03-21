defmodule MoonWeb.Pages.Design.DrawerPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.ExamplesList
  alias MoonWeb.Components.PropsTable

  alias MoonWeb.Examples.Design.DrawerExample

  alias Phoenix.LiveView.JS

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

      <button id="test-button" class="border bg-blue-500" :on-click={open_content()}>button</button>
      <div
        id="test-div"
        class={"border bg-red-500 hidden"}
        :on-click-away={close_content()}
      >div for testing</div>

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
            :name => 'is_open',
            :type => 'boolean',
            :required => 'No',
            :default => 'false',
            :description => 'Whether or not the Drawer is opened'
          },
          %{
            :name => 'on_close',
            :type => 'event',
            :required => 'No',
            :default => '-',
            :description => 'Handler for open/close of the element'
          },
          %{
            :name => 'panel',
            :type => 'slot',
            :required => 'Yes',
            :default => '-',
            :description => 'Content of Drawer element, see Drawer.Panel'
          },
          %{
            :name => 'backdrop',
            :type => 'slot',
            :required => 'No',
            :default => '-',
            :description => 'Backdrop of Drawer element, see Drawer.Backdrop'
          }
        ]}
      />

      <PropsTable
        title="Drawer.Panel"
        data={[
          %{
            :name => 'position',
            :type => 'top | bottom | start | end',
            :required => 'No',
            :default => 'end',
            :description => 'Drawer position on screen'
          },
          %{
            :name => 'class',
            :type => 'css_class',
            :required => 'No',
            :default => '-',
            :description => 'Tailwind classes for custom styles'
          }
        ]}
      />

      <PropsTable
        title="Drawer.Backdrop"
        data={[
          %{
            :name => 'class',
            :type => 'css_class',
            :required => 'No',
            :default => '-',
            :description => 'Tailwind classes for custom styles'
          }
        ]}
      />
    </Page>
    """
  end

  def open_content(js \\ %JS{}) do
    js

    |> JS.remove_class(
      "hidden",
      to: "#test-div")


  end

  def close_content(js \\ %JS{}) do
    js

    |> JS.add_class(
      "hidden",
      to: "#test-div",
      transition: {"ease-out duration-500", "opacity-0", "hidden"},
      time: 500
    )

  end

  # def hide_content(js, is_open) do
  #   js
  #   |> JS.add_class("bg-green-500", to: "#test-div")
  #   |> JS.add_class("hidden", to: "#test-div")

  # end
  end
