defmodule MoonWeb.Examples.Design.DrawerExample.WithBackdrop do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Drawer
  alias Moon.Design.Button

  def render(assigns) do
    ~F"""
    <Drawer id="drawer_backdrop">
      <Drawer.Trigger>
        <Button variant="secondary">
          Show Drawer with Backdrop
        </Button>
      </Drawer.Trigger>
      <Drawer.Panel>
        <div class="flex justify-between items-center p-3 border-b border-trunks">
          <p>Drawer with Backdrop</p>
        </div>
        <div class="p-3">Drawer content</div>
      </Drawer.Panel>
      <Drawer.Backdrop />
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
