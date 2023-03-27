defmodule MoonWeb.Examples.Design.TabsExample.Default do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Tabs

  import MoonWeb.Helpers.Lorem

  def render(assigns) do
    ~F"""
    <Tabs id="tabs-ex-1">
      <Tabs.List>
        <Tabs.Tab>First tab</Tabs.Tab>
        <Tabs.Tab>Second tab</Tabs.Tab>
        <Tabs.Tab>Third tab</Tabs.Tab>
      </Tabs.List>
      <Tabs.Panels>
        <Tabs.Panel>{lorem()}</Tabs.Panel>
        <Tabs.Panel>{ipsum()}</Tabs.Panel>
        <Tabs.Panel>{dolor()}</Tabs.Panel>
      </Tabs.Panels>
    </Tabs>
    """
  end

  def code() do
    """
    <Tabs id="tabs-ex-1">
      <Tabs.List>
        <Tabs.Tab>First tab</Tabs.Tab>
        <Tabs.Tab>Second tab</Tabs.Tab>
        <Tabs.Tab>Third tab</Tabs.Tab>
      </Tabs.List>
      <Tabs.Panels>
        <Tabs.Panel>{lorem()}</Tabs.Panel>
        <Tabs.Panel>{ipsum()}</Tabs.Panel>
        <Tabs.Panel>{dolor()}</Tabs.Panel>
      </Tabs.Panels>
    </Tabs>
    """
  end
end
