defmodule MoonWeb.Examples.Design.DrawerExample.WithBackdrop do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Design.Drawer
  alias Moon.Design.Button

  def render(assigns) do
    ~F"""
    <div>
      <Button variant="secondary" on_click="set_open">
        Show Drawer with Backdrop
      </Button>
      <Drawer id="backdrop_drawer">
        <Drawer.Panel>
          <div class="flex justify-between items-center p-3 border-b border-trunks">
            <p>Drawer with Backdrop</p>
          </div>
          <div class="p-3">Drawer content</div>
        </Drawer.Panel>
        <Drawer.Backdrop />
      </Drawer>
    </div>
    """
  end

  def handle_event("set_open", _, socket) do
    Drawer.open("backdrop_drawer")
    {:noreply, socket}
  end

  def code() do
    """
    alias Moon.Design.Drawer
    alias Moon.Design.Button

    def render(assigns) do
      ~F\"""
      <div>
        <Button variant="secondary" on_click="set_open">
          Show Drawer with Backdrop
        </Button>
        <Drawer id="backdrop_drawer">
          <Drawer.Panel>
            <div class="flex justify-between items-center p-3 border-b border-trunks">
              <p>Drawer with Backdrop</p>
            </div>
            <div class="p-3">Drawer content</div>
          </Drawer.Panel>
          <Drawer.Backdrop />
        </Drawer>
      </div>
      \"""
    end

    def handle_event("set_open", _, socket) do
      Drawer.open("backdrop_drawer")
      {:noreply, socket}
    end
    """
  end
end
