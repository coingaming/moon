defmodule MoonWeb.Pages.Components.TabsPage do
  @moduledoc false

  require Logger
  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Heading
  alias Moon.Components.Link
  alias Moon.Components.Tabs
  alias Moon.Components.Tabs.TabLink
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.Table.Table
  alias MoonWeb.Components.Table.Column

  data(tab_id, :string)

  data breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
      },
      %{
        to: "/components/tabs",
        name: "Tabs"
      }
    ]

  data props_info_array_tab, :list,
    default: [
      %{
        :name => 'default',
        :type => 'slot ',
        :required => 'true',
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

  data props_info_array_tab_link, :list,
    default: [
      %{
        :name => 'on_click',
        :type => 'event ',
        :required => 'false',
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
        :required => 'false',
        :default => '-',
        :description => 'Link\'s destination'
      }
    ]

  def mount(params, _session, socket) do
    {:ok,
     assign(socket,
       tab_id: params["tab_id"] || "1",
       theme_name: params["theme_name"] || "sportsbet-dark",
       active_page: __MODULE__
     )}
  end

  def handle_params(params, uri, socket) do
    {:noreply, assign(socket, uri: uri, tab_id: params["tab_id"] || "1")}
  end

  def render(assigns) do
    ~F"""
    <Page theme_name={@theme_name} active_page={@active_page} breadcrumbs={@breadcrumbs}>
      <TopToDown>
        <Heading size={56} class="mb-4">Tabs</Heading>
        <p>
          A menu of items for users to move between sections of the application.

          By default, tabs will provide an accessible skip link, and overflow with horizontal scrolling.

          TabLink component provides the tab interaction.
        </p>

        <p class="mt-4">
          <Link to="https://www.figma.com/file/S3q1SkVngbwHuwpxHKCsgtJj/Components?node-id=60%3A16">Figma design</Link>
          <Link to="https://github.com/coingaming/moon/blob/main/lib/moon_web/pages/components/tabs_page.ex">Sourcecode of this page</Link>
          <Link to="https://moon.io/components/tabs">React implementation</Link>
        </p>

        <ExampleAndCode id="tabs" class="mt-4">
          <:example>
            <Tabs>
              <TabLink
                active={@tab_id == "1"}
                to={live_path(@socket, __MODULE__, tab_id: "1", theme_name: @theme_name)}
              >Link 1</TabLink>
              <TabLink
                active={@tab_id == "2"}
                to={live_path(@socket, __MODULE__, tab_id: "2", theme_name: @theme_name)}
              >Link 2</TabLink>
              <TabLink
                active={@tab_id == "3"}
                patch
                to={live_path(@socket, __MODULE__, tab_id: "3", theme_name: @theme_name)}
              >Link 3 with url patch, no page reload</TabLink>
              <TabLink active={@tab_id == "4"} on_click="clicked_tab" item_id="4">Link 4</TabLink>
            </Tabs>
          </:example>

          <:code>{get_example_code()}</:code>

          <:state>
            @tab_id = {@tab_id}
          </:state>
        </ExampleAndCode>

        <div>
          <div class="text-bulma-100 items-center text-xl leading-7 font-normal my-4">Tab Props</div>
          <Table items={@props_info_array_tab}>
            <Column name="name" label="Name" :let={item: item} is_row_header>
              {item.name}
            </Column>
            <Column name="type" label="Type" :let={item: item}>
              {item.type}
            </Column>
            <Column name="required" label="Required" :let={item: item}>
              {item.required}
            </Column>
            <Column name="default" label="Default" :let={item: item}>
              {item.default}
            </Column>
            <Column name="description" label="Description" :let={item: item}>
              {item.description}
            </Column>
          </Table>
        </div>

        <div>
          <div class="text-bulma-100 items-center text-xl leading-7 font-normal my-4">TabLink Props</div>
          <Table items={@props_info_array_tab_link}>
            <Column name="name" label="Name" :let={item: item} is_row_header>
              {item.name}
            </Column>
            <Column name="type" label="Type" :let={item: item}>
              {item.type}
            </Column>
            <Column name="required" label="Required" :let={item: item}>
              {item.required}
            </Column>
            <Column name="default" label="Default" :let={item: item}>
              {item.default}
            </Column>
            <Column name="description" label="Description" :let={item: item}>
              {item.description}
            </Column>
          </Table>
        </div>
      </TopToDown>
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
       to: live_path(socket, __MODULE__, tab_id: item_id, theme_name: socket.assigns.theme_name)
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
