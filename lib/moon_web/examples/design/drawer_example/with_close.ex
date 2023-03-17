defmodule MoonWeb.Examples.Design.DrawerExample.WithClose do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Design.Button.IconButton
  alias Moon.Design.Drawer
  alias Moon.Design.Button

  data(drawer_is_open, :boolean, default: false)

  def render(assigns) do
    ~F"""
    <div>
      <Button variant="secondary" on_click="open_drawer">
        Show Drawer with Close button
      </Button>
      <Drawer is_open={@drawer_is_open} on_close="close_drawer">
        <Drawer.Panel>
          <div class="flex justify-between items-center p-3 border-b border-trunks">
            <p>Header</p>
            <IconButton icon_only="controls_close_small" variant="ghost" on_click="close_drawer" />
          </div>
          <div class="p-3">Drawer content</div>
        </Drawer.Panel>
      </Drawer>
    </div>
    """
  end

  def handle_event("open_drawer", _params, socket) do
    socket = assign(socket, drawer_is_open: true)
    {:noreply, socket}
  end

  def handle_event("close_drawer", _params, socket) do
    socket = assign(socket, drawer_is_open: false)
    {:noreply, socket}
  end

  def code() do
    """
    alias Moon.Design.Button.IconButton
    alias Moon.Design.Drawer
    alias Moon.Design.Button

    data(drawer_is_open, :boolean, default: false)

    ...

    <div>
      <Button variant="secondary" on_click="open_drawer">
        Show Drawer with Close button
      </Button>
      <Drawer is_open={@drawer_is_open} on_close="close_drawer">
        <Drawer.Panel>
          <div class="flex justify-between items-center p-3 border-b border-trunks">
            <p>Header</p>
            <IconButton icon_only="controls_close_small" variant="ghost" on_click="close_drawer" />
          </div>
          <div class="p-3">Drawer content</div>
        </Drawer.Panel>
      </Drawer>
    </div>

    ...

    def handle_event("open_drawer", _params, socket) do
      socket = assign(socket, drawer_is_open: true)
      {:noreply, socket}
    end

    def handle_event("close_drawer", _params, socket) do
      socket = assign(socket, drawer_is_open: false)
      {:noreply, socket}
    end
    """
  end
end
