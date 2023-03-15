defmodule MoonWeb.Examples.Design.DrawerExample.Default do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Drawer
  alias Moon.Design.Button

  def render(assigns) do
    ~F"""
    <Drawer id="drawer_default">
      <Drawer.Trigger>
        <Button variant="secondary">
          Show default Drawer
        </Button>
      </Drawer.Trigger>
      <Drawer.Panel>Default Drawer</Drawer.Panel>
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
