defmodule MoonWeb.Examples.Design.DrawerExample.WithClose do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Button.IconButton
  alias Moon.Design.Drawer
  alias Moon.Design.Button

  def render(assigns) do
    ~F"""
    <Drawer id="drawer_close">
      <Drawer.Trigger>
        <Button variant="secondary">
          Show Drawer with Close button
        </Button>
      </Drawer.Trigger>
      <Drawer.Panel>
          <div class="flex justify-between items-center p-3 border-b border-trunks">
            <p>Header</p>
            <IconButton icon_only="controls_close_small" variant="ghost" on_click="close_panel"/>
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
