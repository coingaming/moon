defmodule MoonWeb.Pages.GettingStartedPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.Page
  alias Moon.Components.Switcher
  alias MoonWeb.Components.Started.ForDeveloper
  alias MoonWeb.Components.Started.ForDesigner

  data breadcrumbs, :any,
    default: [
      %{
        to: "/getting-started",
        name: "Getting Started"
      }
    ]

  def mount(params, _session, socket) do
    {:ok,
     assign(socket,
       theme_name: params["theme_name"] || "moon-design-light",
       active_page: __MODULE__,
       selected_role: params["role"] || designer_role()
     )}
  end

  def render(assigns) do
    ~F"""
    <Page theme_name={@theme_name} active_page={@active_page} breadcrumbs={@breadcrumbs}>
      <h1 class="text-moon-32 font-semibold">Getting started</h1>
      <div class="flex flex-row gap-2">
        <Switcher
          items={[designer_role(), developer_role()]}
          selected_item={@selected_role}
          click="handle_role"
          class="p-0.5 rounded-lg flex bg-beerus-100"
        />
      </div>
      <ForDesigner :if={@selected_role == designer_role()} />
      <ForDeveloper :if={@selected_role == developer_role()} />
    </Page>
    """
  end

  def handle_event("handle_role", %{"selected-item" => selected_role}, socket) do
    {:noreply, assign(socket, :selected_role, selected_role)}
  end

  def designer_role(), do: "I'm a designer"
  def developer_role(), do: "I'm a developer"
end
