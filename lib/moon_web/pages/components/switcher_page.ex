defmodule MoonWeb.Pages.Components.SwitcherPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Heading
  alias Moon.Components.Link
  alias Moon.Components.Switcher
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components v1"
      },
      %{
        to: "/components/switcher",
        name: "Switcher"
      }
    ]
  )

  def mount(_params, _session, socket) do
    socket =
      assign(socket,
        tabs: ~w(One Two Three),
        selected_tab: "One"
      )

    {:ok, socket}
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <TopToDown>
        <Heading size={56} class="mb-4">Switcher</Heading>

        <p>
          <Link to="https://github.com/coingaming/moon/blob/main/lib/moon_web/pages/components/switcher_page.ex">Sourcecode of this page</Link>
        </p>

        <ExampleAndCode title="Default" id="switcher">
          <:example>
            <Switcher items={@tabs} selected_item={@selected_tab} click="tab_click" />
          </:example>

          <:code>{switcher_1_code()}</:code>

          <:state>@tabs = {inspect(@tabs, pretty: true)}<br><br>@selected_tab = {@selected_tab}</:state>
        </ExampleAndCode>
      </TopToDown>
    </Page>
    """
  end

  def handle_event("tab_click", %{"selected-item" => selected_item}, socket) do
    socket = assign(socket, selected_tab: selected_item)
    {:noreply, socket}
  end

  def switcher_1_code do
    """
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
    """
  end
end
