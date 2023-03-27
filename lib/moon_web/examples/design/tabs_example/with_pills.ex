defmodule MoonWeb.Examples.Design.TabsExample.WithPills do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Tabs

  import MoonWeb.Helpers.Lorem

  def render(assigns) do
    ~F"""
    <Tabs id="tabs-with-pills">
      <Tabs.List tab_titles={["First pill", "Second pill", "Third pill"]} tab_module={Tabs.Pill} />
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
    alias Moon.Design.Tabs
    import MoonWeb.Helpers.Lorem

    ...

    <Tabs id="tabs-with-pills">
      <Tabs.List tab_titles={["First pill", "Second pill", "Third pill"]} tab_module={Tabs.Pill}/>
      <Tabs.Panels>
        <Tabs.Panel>{lorem()}</Tabs.Panel>
        <Tabs.Panel>{ipsum()}</Tabs.Panel>
        <Tabs.Panel>{dolor()}</Tabs.Panel>
      </Tabs.Panels>
    </Tabs>
    """
  end
end
