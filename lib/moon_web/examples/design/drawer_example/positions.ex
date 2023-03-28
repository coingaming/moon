defmodule MoonWeb.Examples.Design.DrawerExample.Positions do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Design.Drawer
  alias Moon.Design.Button

  def render(assigns) do
    ~F"""
    <div class="flex flex-wrap items-center justify-around gap-2 w-full">
      <Button variant="secondary" on_click="open_start_drawer">
        Show Drawer at start of screen
      </Button>
      <Drawer id="start_drawer">
        <Drawer.Panel position="start">
          <div class="flex justify-between items-center p-3 border-b border-trunks">
            <p>Screen start aligned Drawer</p>
          </div>
          <div class="p-3">Drawer content</div>
        </Drawer.Panel>
      </Drawer>

      <Button variant="secondary" on_click="open_top_drawer">
        Show Drawer at top of screen
      </Button>
      <Drawer id="top_drawer">
        <Drawer.Panel position="top">
          <div class="flex justify-between items-center p-3 border-b border-trunks">
            <p>Screen top aligned Drawer</p>
          </div>
          <div class="p-3">Drawer content</div>
        </Drawer.Panel>
      </Drawer>

      <Button variant="secondary" on_click="open_bottom_drawer">
        Show Drawer at bottom of screen
      </Button>
      <Drawer id="bottom_drawer">
        <Drawer.Panel position="bottom">
          <div class="flex justify-between items-center p-3 border-b border-trunks">
            <p>Screen bottom aligned Drawer</p>
          </div>
          <div class="p-3">Drawer content</div>
        </Drawer.Panel>
      </Drawer>
    </div>
    """
  end

  def handle_event("open_start_drawer", _, socket) do
    Drawer.open("start_drawer")
    {:noreply, socket}
  end

  def handle_event("open_top_drawer", _, socket) do
    Drawer.open("top_drawer")
    {:noreply, socket}
  end

  def handle_event("open_bottom_drawer", _, socket) do
    Drawer.open("bottom_drawer")
    {:noreply, socket}
  end

  def code() do
    """
    alias Moon.Design.Drawer
    alias Moon.Design.Button

    data(start_drawer_is_open, :boolean, default: false)
    data(top_drawer_is_open, :boolean, default: false)
    data(bottom_drawer_is_open, :boolean, default: false)

    ...

    <div class="flex flex-wrap items-center justify-around gap-2 w-full">
      <Button variant="secondary" on_click="open_start_drawer">
        Show Drawer at start of screen
      </Button>
      <Drawer is_open={@start_drawer_is_open} on_close="close_start_drawer">
        <Drawer.Panel position="start">
          <div class="flex justify-between items-center p-3 border-b border-trunks">
            <p>Screen start aligned Drawer</p>
          </div>
          <div class="p-3">Drawer content</div>
        </Drawer.Panel>
      </Drawer>

      <Button variant="secondary" on_click="open_top_drawer">
        Show Drawer at top of screen
      </Button>
      <Drawer is_open={@top_drawer_is_open} on_close="close_top_drawer">
        <Drawer.Panel position="top">
          <div class="flex justify-between items-center p-3 border-b border-trunks">
            <p>Screen top aligned Drawer</p>
          </div>
          <div class="p-3">Drawer content</div>
        </Drawer.Panel>
      </Drawer>

      <Button variant="secondary" on_click="open_bottom_drawer">
        Show Drawer at bottom of screen
      </Button>
      <Drawer is_open={@bottom_drawer_is_open} on_close="close_bottom_drawer">
        <Drawer.Panel position="bottom">
          <div class="flex justify-between items-center p-3 border-b border-trunks">
            <p>Screen bottom aligned Drawer</p>
          </div>
          <div class="p-3">Drawer content</div>
        </Drawer.Panel>
      </Drawer>
    </div>

    ...

    def handle_event("open_start_drawer", _params, socket) do
      socket = assign(socket, start_drawer_is_open: true)
      {:noreply, socket}
    end

    def handle_event("close_start_drawer", _params, socket) do
      socket = assign(socket, start_drawer_is_open: false)
      {:noreply, socket}
    end

    def handle_event("open_top_drawer", _params, socket) do
      socket = assign(socket, top_drawer_is_open: true)
      {:noreply, socket}
    end

    def handle_event("close_top_drawer", _params, socket) do
      socket = assign(socket, top_drawer_is_open: false)
      {:noreply, socket}
    end

    def handle_event("open_bottom_drawer", _params, socket) do
      socket = assign(socket, bottom_drawer_is_open: true)
      {:noreply, socket}
    end

    def handle_event("close_bottom_drawer", _params, socket) do
      socket = assign(socket, bottom_drawer_is_open: false)
      {:noreply, socket}
    end
    """
  end
end
