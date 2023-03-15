defmodule MoonWeb.Examples.Design.DrawerExample.Positions do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Drawer
  alias Moon.Design.Button

  def render(assigns) do
    ~F"""
    <Drawer id="drawer_start">
      <Drawer.Trigger>
        <Button variant="secondary">
          Show Drawer at start of screen
        </Button>
      </Drawer.Trigger>
      <Drawer.Panel position="start">
        <div class="flex justify-between items-center p-3 border-b border-trunks">
          <p>Screen start aligned Drawer</p>
        </div>
        <div class="p-3">Drawer content</div>
      </Drawer.Panel>
    </Drawer>

    <Drawer id="drawer_top">
      <Drawer.Trigger>
        <Button variant="secondary">
          Show Drawer at top of screen
        </Button>
      </Drawer.Trigger>
      <Drawer.Panel position="top">
        <div class="flex justify-between items-center p-3 border-b border-trunks">
          <p>Screen top aligned Drawer</p>
        </div>
        <div class="p-3">Drawer content</div>
      </Drawer.Panel>
    </Drawer>

    <Drawer id="drawer_bottom">
      <Drawer.Trigger>
        <Button variant="secondary">
          Show Drawer at bottom of screen
        </Button>
      </Drawer.Trigger>
      <Drawer.Panel position="bottom">
        <div class="flex justify-between items-center p-3 border-b border-trunks">
          <p>Screen bottom aligned Drawer</p>
        </div>
        <div class="p-3">Drawer content</div>
      </Drawer.Panel>
    </Drawer>
    """
  end

  def code() do
    """
    alias Moon.Design.Drawer

    ...


    """
  end
end
