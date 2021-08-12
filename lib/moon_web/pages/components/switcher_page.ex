defmodule MoonWeb.Pages.Components.SwitcherPage do
  use MoonWeb, :live_view

  alias MoonWeb.Components.ExampleAndCode
  alias Moon.Components.CodePreview
  alias Moon.Components.Heading
  alias Moon.Components.Stack
  alias Moon.Components.Switcher

  def mount(params, _session, socket) do
    socket =
      assign(socket,
        theme_name: params["theme_name"] || "sportsbet-dark",
        active_page: __MODULE__,
        tabs: ~w(One Two Three),
        selected_tab: "One"
      )

    {:ok, socket}
  end

  def render(assigns) do
    ~F"""
    <Stack>
      <Heading size={32}>Switcher</Heading>

      <ExampleAndCode show_state>
        <:example>
          <Switcher items={@tabs} selected_item={@selected_tab} click="tab_click" />
        </:example>

        <:code>
          <#CodePreview>
        alias Moon.Components.Switcher

        <Switcher
          items={@tabs}
          selected_item={@selected_tab}
          click="tab_click"
        />

        def handle_event("tab_click", %{"selected-item" => selected_item}, socket) do
          socket = assign(socket, selected_tab: selected_item)
          {:noreply, socket}
        end
          </#CodePreview>
        </:code>

        <:state>@tabs = {inspect(@tabs, pretty: true)}<br><br>@selected_tab = {@selected_tab}</:state>
      </ExampleAndCode>
    </Stack>
    """
  end

  def handle_event("tab_click", %{"selected-item" => selected_item}, socket) do
    socket = assign(socket, selected_tab: selected_item)
    {:noreply, socket}
  end
end
