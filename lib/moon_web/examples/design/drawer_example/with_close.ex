defmodule MoonWeb.Examples.Design.DrawerExample.WithClose do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Design.Button.IconButton
  alias Moon.Design.Drawer
  alias Moon.Design.Button

  def render(assigns) do
    ~F"""
    <div>
      <Button variant="secondary" on_click="set_open">
        Show Drawer with Close button
      </Button>
      <Drawer id="with_close_drawer">
        <Drawer.Panel>
          <div class="flex justify-between items-center p-3 border-b border-trunks">
            <p>Header</p>
            <IconButton icon_only="controls_close_small" variant="ghost" on_click="set_close" />
          </div>
          <div class="p-3">Drawer content</div>
        </Drawer.Panel>
      </Drawer>
    </div>
    """
  end

  def handle_event("set_open", _, socket) do
    Drawer.open("with_close_drawer")
    {:noreply, socket}
  end

  def handle_event("set_close", _, socket) do
    Drawer.close("with_close_drawer")
    {:noreply, socket}
  end

  def code() do
    """
    alias Moon.Design.Button.IconButton
    alias Moon.Design.Drawer
    alias Moon.Design.Button

    def render(assigns) do
      ~F\"""
      <div>
        <Button variant="secondary" on_click="set_open">
          Show Drawer with Close button
        </Button>
        <Drawer id="with_close_drawer">
          <Drawer.Panel>
            <div class="flex justify-between items-center p-3 border-b border-trunks">
              <p>Header</p>
              <IconButton icon_only="controls_close_small" variant="ghost" on_click="set_close" />
            </div>
            <div class="p-3">Drawer content</div>
          </Drawer.Panel>
        </Drawer>
      </div>
      \"""
    end

    def handle_event("set_open", _, socket) do
      Drawer.open("with_close_drawer")
      {:noreply, socket}
    end

    def handle_event("set_close", _, socket) do
      Drawer.close("with_close_drawer")
      {:noreply, socket}
    end
    """
  end
end
