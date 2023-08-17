defmodule MoonWeb.Pages.GettingStartedPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Design.Tabs
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.Started.ForDeveloper
  alias MoonWeb.Components.Started.ForDesigner

  data(breadcrumbs, :any,
    default: [
      %{
        to: "/getting-started",
        name: "Getting Started"
      }
    ]
  )

  data(tab_index, :integer)

  def mount(params, _session, socket) do
    {:ok, assign(socket, tab_index: (params["role"] == developer_role() && 1) || 0)}
  end

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <h1 class="text-moon-32 font-semibold">Getting started</h1>
      <Tabs
        id="getting started"
        class="justify-between gap-6"
        selected={@tab_index}
        on_change="handle_role"
      >
        <Tabs.List class="w-fit p-1 gap-1 bg-goku rounded-moon-s-md">
          <Tabs.Segment>{designer_role()}</Tabs.Segment>
          <Tabs.Segment>{developer_role()}</Tabs.Segment>
        </Tabs.List>
        <Tabs.Panels class="mt-6">
          <Tabs.Panel>
            <ForDesigner />
          </Tabs.Panel>
          <Tabs.Panel>
            <ForDeveloper />
          </Tabs.Panel>
        </Tabs.Panels>
      </Tabs>
    </Page>
    """
  end

  def handle_event("handle_role", %{"value" => tab_index}, socket) do
    {:noreply, assign(socket, tab_index: String.to_integer(tab_index))}
  end

  def designer_role(), do: "I'm a designer"
  def developer_role(), do: "I'm a developer"
end
