defmodule MoonWeb.Examples.Design.DrawerExample.Default do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Design.Drawer
  alias Moon.Design.Button

  def render(assigns) do
    ~F"""
    <div>
      <Button variant="outline" on_click="set_open">
        Show default Drawer
      </Button>
      <Drawer id="default_drawer">
        <Drawer.Panel>Default Drawer
        </Drawer.Panel>
      </Drawer>
    </div>
    """
  end

  def handle_event("set_open", _, socket) do
    Drawer.open("default_drawer")
    {:noreply, socket}
  end

  def code() do
    """
    alias Moon.Design.Drawer
    alias Moon.Design.Button

    def render(assigns) do
      ~F\"""
      <div>
        <Button variant="outline" on_click="set_open">
          Show default Drawer
        </Button>
        <Drawer id="default_drawer">
          <Drawer.Panel>Default Drawer
          </Drawer.Panel>
        </Drawer>
      </div>
      \"""
    end

    def handle_event("set_open", _, socket) do
      Drawer.open("default_drawer")
      {:noreply, socket}
    end
    """
  end
end
