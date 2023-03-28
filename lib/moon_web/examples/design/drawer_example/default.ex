defmodule MoonWeb.Examples.Design.DrawerExample.Default do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Design.Drawer
  alias Moon.Design.Button

  def render(assigns) do
    ~F"""
    <div>
      <Button variant="secondary" on_click="open_drawer">
        Show default Drawer
      </Button>
      <Drawer id="default_drawer">
        <Drawer.Panel>Default Drawer
        </Drawer.Panel>
      </Drawer>
    </div>
    """
  end

  def handle_event("open_drawer", _, socket) do
    Drawer.open("default_drawer")
    {:noreply, socket}
  end

  def code() do
    """
    alias Moon.Design.Drawer
    alias Moon.Design.Button

    data(drawer_is_open, :boolean, default: false)

    ...

    <div>
      <Button variant="secondary" on_click="open_drawer">
        Show default Drawer
      </Button>
      <Drawer is_open={@drawer_is_open} on_close="close_drawer">
        <Drawer.Panel>Drawer with Backdrop
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
