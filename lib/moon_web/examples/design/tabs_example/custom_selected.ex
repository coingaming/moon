defmodule MoonWeb.Examples.Design.TabsExample.CustomSelected do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Tabs

  def render(assigns) do
    ~F"""
    <Tabs id="tabs-ex-7">
      <Tabs.List>
        <Tabs.Tab class="hover:text-hit after:bg-hit" selected_class="text-hit after:scale-x-100">Green tab</Tabs.Tab>
        <Tabs.Tab disabled>Disabled tab</Tabs.Tab>
        <Tabs.Tab class="hover:text-hit after:bg-hit" selected_class="text-hit after:scale-x-100">Green tab</Tabs.Tab>
      </Tabs.List>
    </Tabs>
    <Tabs id="tabs-ex-8">
      <Tabs.List>
        <Tabs.Pill class="hover:bg-hit/30" selected_class="bg-hit/30">Green pill</Tabs.Pill>
        <Tabs.Pill disabled>Disabled pill</Tabs.Pill>
        <Tabs.Pill class="hover:bg-hit/30" selected_class="bg-hit/30">Green pill</Tabs.Pill>
      </Tabs.List>
    </Tabs>
    """
  end

  def code() do
    """
    <Tabs id="tabs-ex-7">
      <Tabs.List>
        <Tabs.Tab class="hover:text-hit after:bg-hit" selected_class="text-hit after:scale-x-100">Green tab</Tabs.Tab>
        <Tabs.Tab disabled>Disabled tab</Tabs.Tab>
        <Tabs.Tab class="hover:text-hit after:bg-hit" selected_class="text-hit after:scale-x-100">Green tab</Tabs.Tab>
      </Tabs.List>
    </Tabs>
    <Tabs id="tabs-ex-8">
      <Tabs.List>
        <Tabs.Pill class="hover:bg-hit/30" selected_class="bg-hit/30">Green pill</Tabs.Pill>
        <Tabs.Pill disabled>Disabled pill</Tabs.Pill>
        <Tabs.Pill class="hover:bg-hit/30" selected_class="bg-hit/30">Green pill</Tabs.Pill>
      </Tabs.List>
    </Tabs>
    """
  end
end
