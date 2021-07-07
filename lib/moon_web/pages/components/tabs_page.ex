defmodule MoonWeb.Pages.Components.TabsPage do
  require Logger
  use MoonWeb, :live_view
  alias MoonWeb.Components.ExampleAndCode
  alias Moon.Components.Heading
  alias Moon.Components.CodePreview
  alias Moon.Components.Link
  alias Moon.Components.Tabs
  alias Moon.Components.Tabs.TabLink

  data(tab_id, :string)

  def mount(params, _session, socket) do
    {:ok,
     assign(socket,
       tab_id: params["tab_id"] || "1",
       theme_name: params["theme_name"] || "sportsbet-dark",
       active_page: __MODULE__
     )}
  end

  def render(assigns) do
    ~F"""
    {asset_import @socket, "js/tailwind"}

    <Heading size={32} class="mb-8">Tabs</Heading>

    <p>
    A menu of items for users to move between sections of the application.

    By default, tabs will provide an accessible skip link, and overflow with horizontal scrolling.

    TabLink component provides the tab interaction.
    </p>

    <p class="mt-4">
      <Link to="https://www.figma.com/file/S3q1SkVngbwHuwpxHKCsgtJj/Components?node-id=60%3A16">Figma design</Link>
    </p>
    <p class="mt-4">
      <Link to="https://github.com/coingaming/moon/blob/master/lib/moon_web/pages/components/tabs_page.ex">Sourcecode of this page</Link>
    </p>
    <p class="mt-4">
      <Link to="https://moon.io/components/tabs">React implementation</Link>
    </p>

    <ExampleAndCode class="mt-4" show_state={true}>
      <#template slot="example">
        <Tabs>
          <TabLink active={@tab_id == "1"} to={live_path(@socket, __MODULE__, tab_id: "1", theme_name: @theme_name)}>Link 1</TabLink>
          <TabLink active={@tab_id == "2"} to={live_path(@socket, __MODULE__, tab_id: "2", theme_name: @theme_name)}>Link 2</TabLink>
          <TabLink active={@tab_id == "3"} on_click="clicked_tab" item_id="3">Link 3</TabLink>
          <TabLink active={@tab_id == "4"} on_click="clicked_tab" item_id="4">Link 4</TabLink>
        </Tabs>
      </#template>

      <#template slot="code">
      <#CodePreview>
      alias Moon.Components.Tabs
      alias Moon.Components.Tabs.TabLink

      <Tabs>
        <TabLink active={ @tab_id == "1" } to={ live_path(@socket, __MODULE__, tab_id: "1", theme_name: @theme_name) }>Link 1</TabLink>
        <TabLink active={ @tab_id == "2" } to={ live_path(@socket, __MODULE__, tab_id: "2", theme_name: @theme_name) }>Link 2</TabLink>
        <TabLink active={ @tab_id == "3" } on_click="clicked_tab" item_id="3">Link 3</TabLink>
        <TabLink active={ @tab_id == "4" } on_click="clicked_tab" item_id="4">Link 4</TabLink>
      </Tabs>

      def handle_event(
            "clicked_tab",
            %{"item_id" => item_id},
            socket
          ) do
        {:noreply, redirect(socket, to: live_path(socket, __MODULE__, tab_id: item_id, theme_name: socket.assigns.theme_name))}
      end
      </#CodePreview>
      </#template>

      <#template slot="state">
      @tab_id = {@tab_id}
      </#template>
    </ExampleAndCode>
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
end
