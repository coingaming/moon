defmodule MoonWeb.Pages.Components.SwitcherPage do
  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias MoonWeb.Components.ExampleAndCode
  alias Moon.Components.CodePreview
  alias Moon.Components.Heading
  alias Moon.Components.Link
  alias Moon.Components.Switcher
  alias MoonWeb.Components.Breadcrumbs
  alias MoonWeb.Components.Footer
  alias MoonWeb.Components.ThemesSelect

  data breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
      },
      %{
        to: "/components/switcher",
        name: "Switcher"
      }
    ]

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

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <TopToDown>
      <Breadcrumbs theme_name={@theme_name} breadcrumbs={@breadcrumbs} class="mb-2" />
      <Heading size={56} class="mb-4">Switcher</Heading>

      <p>
        <Link to="https://github.com/coingaming/moon/blob/master/lib/moon_web/pages/components/switcher_page.ex">Sourcecode of this page</Link>
      </p>

      <ExampleAndCode id="switcher">
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
      <Footer />
      <ThemesSelect id="themes_select" theme_name={@theme_name} active_page={@active_page} />
    </TopToDown>
    """
  end

  def handle_event("tab_click", %{"selected-item" => selected_item}, socket) do
    socket = assign(socket, selected_tab: selected_item)
    {:noreply, socket}
  end
end
