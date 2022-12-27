defmodule MoonWeb.Pages.Components.TabsPage do
  @moduledoc false

  require Logger
  use MoonWeb, :live_view

  alias Moon.Components.Tabs
  alias Moon.Components.Tabs.TabLink
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.PropsTable
  alias MoonWeb.Components.Facing.DeprecationWarning

  data(tab_id, :string)

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components v1"
      },
      %{
        to: "/components/tabs",
        name: "Tabs"
      }
    ]
  )

  data(props_info_array_tab, :list,
    default: [
      %{
        :name => 'default',
        :type => 'slot ',
        :required => 'Yes',
        :default => '-',
        :description => 'Content inside the tab'
      },
      %{
        :name => 'size',
        :type => '-',
        :required => '-',
        :default => '-',
        :description => 'TODO - size variant'
      },
      %{
        :name => 'items',
        :type => '-',
        :required => '-',
        :default => '-',
        :description => 'TODO - array of TabLink items'
      }
    ]
  )

  data(props_info_array_tab_link, :list,
    default: [
      %{
        :name => 'on_click',
        :type => 'event ',
        :required => 'No',
        :default => '-',
        :description => 'Event to happen when tab is clicked'
      },
      %{
        :name => 'element_left',
        :type => '-',
        :required => '-',
        :default => '-',
        :description => 'TODO - Left element'
      },
      %{
        :name => 'element_right',
        :type => '-',
        :required => '-',
        :default => '-',
        :description => 'TODO - Right element'
      },
      %{
        :name => 'to',
        :type => 'any',
        :required => 'No',
        :default => '-',
        :description => 'Link\'s destination'
      }
    ]
  )

  def mount(params, _session, socket) do
    {:ok, assign(socket, tab_id: params["tab_id"] || "1")}
  end

  def handle_params(params, uri, socket) do
    {:noreply, assign(socket, uri: uri, tab_id: params["tab_id"] || "1")}
  end

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="Tabs">
        <DeprecationWarning
          name="Tabs"
          href={live_path(MoonWeb.Endpoint, MoonWeb.Pages.Design.TabsPage,
            theme_name: @theme_name,
            direction: @direction
          )}
        />
      </ComponentPageDescription>

      <ExampleAndCode title="Default" id="tabs" class="mt-4">
        <:example>
          <Tabs>
            <TabLink
              active={@tab_id == "1"}
              to={live_path(@socket, __MODULE__, tab_id: "1", theme_name: @theme_name, direction: @direction)}
            >Link 1</TabLink>
            <TabLink
              active={@tab_id == "2"}
              to={live_path(@socket, __MODULE__, tab_id: "2", theme_name: @theme_name, direction: @direction)}
            >Link 2</TabLink>
            <TabLink
              active={@tab_id == "3"}
              patch
              to={live_path(@socket, __MODULE__, tab_id: "3", theme_name: @theme_name, direction: @direction)}
            >Link 3 with url patch, no page reload</TabLink>
            <TabLink active={@tab_id == "4"} on_click="clicked_tab" item_id="4">Link 4</TabLink>
          </Tabs>
        </:example>

        <:code>{get_example_code()}</:code>

        <:state>
          @tab_id = {@tab_id}
        </:state>
      </ExampleAndCode>

      <PropsTable data={@props_info_array_tab} />

      <PropsTable data={@props_info_array_tab_link} />
    </Page>
    """
  end

  def handle_event(
        "clicked_tab",
        %{"item_id" => item_id},
        socket
      ) do
    {:noreply,
     redirect(socket,
       to:
         live_path(socket, __MODULE__,
           tab_id: item_id,
           theme_name: socket.assigns.theme_name,
           direction: socket.assigns.direction
         )
     )}
  end

  def get_example_code() do
    """
    alias Moon.Components.Tabs
    alias Moon.Components.Tabs.TabLink

    <Tabs>
      <TabLink
        active={@tab_id == "1"}
        to={live_path(@socket, __MODULE__, tab_id: "1", theme_name: @theme_name)}
     >Link 1</TabLink>
      <TabLink
        active={@tab_id == "2"}
        to={live_path(@socket, __MODULE__, tab_id: "2", theme_name: @theme_name)}
     >Link 2</TabLink>
      <TabLink active={@tab_id == "3"} on_click="clicked_tab" item_id="3">Link 3</TabLink>
      <TabLink active={@tab_id == "4"} on_click="clicked_tab" item_id="4">Link 4</TabLink>
    </Tabs>

    def handle_event(
          "clicked_tab",
          %{"item_id" => item_id},
          socket
        ) do
      {:noreply,
      redirect(socket,
        to: live_path(socket, __MODULE__, tab_id: item_id, theme_name: socket.assigns.theme_name)
      )}
    end
    """
  end
end
