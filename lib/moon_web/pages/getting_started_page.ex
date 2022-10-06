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
       direction: params["direction"] || "ltr",
       active_page: __MODULE__,
       roles: ["I'm a designer", "I'm a developer"],
       selected_role: params["role"] || "I'm a designer",
       socket: socket
     )}
  end

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <h1 class="text-moon-32 font-semibold">Getting started</h1>
      <div class="flex flex-row gap-2">
        <Switcher
          items={@roles}
          selected_item={@selected_role}
          click="handle_role"
          class="p-0.5 rounded-lg flex bg-beerus-100"
        />
      </div>
      <ForDesigner :if={@selected_role == List.first(@roles)} socket={@socket} />
      <ForDeveloper :if={@selected_role != List.first(@roles)} />
    </Page>
    """
  end

  def handle_event("handle_role", %{"selected-item" => selected_role}, socket) do
    {:noreply, assign(socket, :selected_role, selected_role)}
  end
end
