defmodule MoonWeb.Pages.Components.DrawerPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.PullAside
  alias Moon.Autolayouts.LeftToRight
  alias Moon.Components.Button
  alias Moon.Components.Drawer
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components v1"
      },
      %{
        to: "/components/drawer",
        name: "Drawer"
      }
    ]
  )

  data(drawer_1_is_open, :boolean, default: false)
  data(drawer_2_is_open, :boolean, default: false)

  def render(assigns) do
    ~F"""
    <Page
      {=@theme_name}
      {=@active_page}
      {=@breadcrumbs}
      {=@direction}
      class={"mr-64": @drawer_2_is_open}
    >
      <ComponentPageDescription title="Drawer">
        <p>
          Drawer
        </p>
      </ComponentPageDescription>

      <ExampleAndCode title="Drawer on top right" id="drawer_1_example">
        <:example>
          <Button variant="primary" on_click="open_drawer_1">Open drawer</Button>
          <Drawer class="w-64" :if={@drawer_1_is_open}>
            <Drawer.Dialog close="close_drawer_1">
              <:title>Title text</:title>
              <:content>Content here</:content>
              <:footer>
                <PullAside>
                  <:left>
                    <Button>Label</Button>
                  </:left>
                  <:right>
                    <LeftToRight>
                      <Button variant="tertiary">Label</Button>
                      <Button variant="primary">Label</Button>
                    </LeftToRight>
                  </:right>
                </PullAside>
              </:footer>
            </Drawer.Dialog>
          </Drawer>
        </:example>
        <:code>{get_example_1_code()}</:code>
        <:state>{get_example_1_state(assigns)}</:state>
      </ExampleAndCode>

      <ExampleAndCode title="Drawer on right that moves content" id="drawer_2_example">
        <:example>
          <Button variant="primary" on_click="open_drawer_2">Open drawer</Button>
          <Drawer class="w-64" :if={@drawer_2_is_open}>
            <Drawer.Dialog close="close_drawer_2">
              <:title>Title text</:title>
              <:content>Content here</:content>
              <:footer>
                <PullAside>
                  <:left>
                    <Button>Label</Button>
                  </:left>
                  <:right>
                    <LeftToRight>
                      <Button variant="tertiary">Label</Button>
                      <Button variant="primary">Label</Button>
                    </LeftToRight>
                  </:right>
                </PullAside>
              </:footer>
            </Drawer.Dialog>
          </Drawer>
        </:example>
        <:code>{get_example_2_code()}</:code>
        <:state>{get_example_2_state(assigns)}</:state>
      </ExampleAndCode>
    </Page>
    """
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def handle_event("open_drawer_1", _params, socket) do
    socket = assign(socket, drawer_1_is_open: true)
    {:noreply, socket}
  end

  def handle_event("close_drawer_1", _params, socket) do
    socket = assign(socket, drawer_1_is_open: false)
    {:noreply, socket}
  end

  def handle_event("open_drawer_2", _params, socket) do
    socket = assign(socket, drawer_2_is_open: true)
    {:noreply, socket}
  end

  def handle_event("close_drawer_2", _params, socket) do
    socket = assign(socket, drawer_2_is_open: false)
    {:noreply, socket}
  end

  def get_example_1_code() do
    """
    <Drawer class="w-64" :if={@drawer_is_open}>
      <Drawer.Dialog close="close_drawer">
        <:title>Title text</:title>
        <:content>Content here</:content>
        <:footer>
          <PullAside>
            <:left>
              <Button>Label</Button>
            </:left>
            <:right>
              <LeftToRight>
                <Button variant="tertiary">Label</Button>
                <Button variant="primary">Label</Button>
              </LeftToRight>
            </:right>
          </PullAside>
        </:footer>
      </Drawer.Dialog>
    </Drawer>
    """
  end

  def get_example_1_state(assigns) do
    inspect(%{drawer_1_is_open: assigns.drawer_1_is_open})
  end

  def get_example_2_code() do
    """
    <Page class={"mr-64": @drawer_2_is_open}>
      <Drawer class="w-64" :if={@drawer_is_open}>
        <Drawer.Dialog close="close_drawer">
          <:title>Title text</:title>
          <:content>Content here</:content>
          <:footer>
            <PullAside>
              <:left>
                <Button>Label</Button>
              </:left>
              <:right>
                <LeftToRight>
                  <Button variant="tertiary">Label</Button>
                  <Button variant="primary">Label</Button>
                </LeftToRight>
              </:right>
            </PullAside>
          </:footer>
        </Drawer.Dialog>
      </Drawer>
    </Page>
    """
  end

  def get_example_2_state(assigns) do
    inspect(%{drawer_2_is_open: assigns.drawer_2_is_open})
  end
end
