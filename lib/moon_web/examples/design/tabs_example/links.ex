defmodule MoonWeb.Examples.Design.TabsExample.Links do
  @moduledoc """
  Forget about this example until we'll have a solution for getting current url
  without setting global params. is_active should be set from outside for each tab
  """

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Design.Tabs

  def mount(socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~F"""
    <div class="w-full">
      <Tabs id="tabs-ex-links">
        <Tabs.List>
          <Tabs.Link href="hello">First tab</Tabs.Link>
          <Tabs.Link href="second">Second tab</Tabs.Link>
          <Tabs.Link href="third">Third tab</Tabs.Link>
        </Tabs.List>
      </Tabs>
    </div>
    """
  end

  def code() do
    """
    """
  end
end
