defmodule MoonWeb.Examples.Design.TabsExample.Wizzard do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Design.Tabs
  alias Moon.Design.Button

  import MoonWeb.Helpers.Lorem

  data(completed, :integer, default: 0)
  data(selected, :integer, default: 0)

  def render(assigns) do
    ~F"""
    <div class="relative">
      <Tabs id="tabs-wizzard" class="flex-row mb-10">
        <Tabs.List class="flex-col w-auto" tab_module={Tabs.Step} >
          <Tabs.Step is_completed={@completed > 0}>
            <h3>General</h3>
            <p>In order to make you available and match you with the right opportunities we need some additional information.</p>
          </Tabs.Step>
          <Tabs.Step is_completed={@completed > 1}>Second step</Tabs.Step>
          <Tabs.Step>Third step</Tabs.Step>
        </Tabs.List>
        <Tabs.Panels>
          <Tabs.Panel>{lorem()}</Tabs.Panel>
          <Tabs.Panel>{ipsum()}</Tabs.Panel>
          <Tabs.Panel>{dolor()}</Tabs.Panel>
        </Tabs.Panels>
      </Tabs>
      <div class="absolute w-full flex justify-end bottom-0 gap-2">
        <Button on_click="prev_page" variant="ghost">Previous</Button>
        <Button on_click="next_page">Next</Button>
      </div>
    </div>
    """
  end

  def code() do
    """
    """
  end
end
