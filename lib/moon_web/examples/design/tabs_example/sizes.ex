defmodule MoonWeb.Examples.Design.TabsExample.Sizes do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Tabs

  def render(assigns) do
    ~F"""
    <div class="flex flex-col gap-4 w-full">
      <div class="flex justify-between w-full gap-4 w-full">
        <Tabs id="tabs-786">
          <Tabs.List size="sm" tab_titles={~w(Tab-sm Tab-sm Tab-sm)} />
        </Tabs>
        <Tabs id="tabs-623">
          <Tabs.List size="md" tab_titles={~w(Tab-md Tab-md Tab-md)} />
        </Tabs>
      </div>
      <div class="flex justify-between w-full gap-4 w-full">
        <Tabs id="tabs-7896">
          <Tabs.List size="sm" tab_titles={~w(Pill-sm Pill-sm Pill-sm)} tab_module={Tabs.Pill} />
        </Tabs>
        <Tabs id="tabs-923">
          <Tabs.List size="md" tab_titles={~w(Pill-md Pill-md Pill-md)} tab_module={Tabs.Pill} />
        </Tabs>
      </div>
      <div class="flex justify-between w-full gap-4 w-full">
        <Tabs id="tabs-1896">
          <Tabs.List
            size="sm"
            tab_titles={~w(Segment-sm Segment-sm Segment-sm)}
            tab_module={Tabs.Segment}
          />
        </Tabs>
        <Tabs id="tabs-9123">
          <Tabs.List
            size="md"
            tab_titles={~w(Segment-md Segment-md Segment-md)}
            tab_module={Tabs.Segment}
          />
        </Tabs>
      </div>
    </div>
    """
  end

  def code() do
    """
    alias Moon.Design.Tabs

    ...

    <div class="flex flex-col gap-4 w-full">
      <div class="flex justify-between w-full gap-4 w-full">
        <Tabs id="tabs-786">
          <Tabs.List size="sm" tab_titles={~w(Tab-sm Tab-sm Tab-sm)} />
        </Tabs>
        <Tabs id="tabs-623">
          <Tabs.List size="md" tab_titles={~w(Tab-md Tab-md Tab-md)} />
        </Tabs>
      </div>
      <div class="flex justify-between w-full gap-4 w-full">
        <Tabs id="tabs-7896">
          <Tabs.List size="sm" tab_titles={~w(Pill-sm Pill-sm Pill-sm)} tab_module={Tabs.Pill} />
        </Tabs>
        <Tabs id="tabs-923">
          <Tabs.List size="md" tab_titles={~w(Pill-md Pill-md Pill-md)} tab_module={Tabs.Pill} />
        </Tabs>
      </div>
      <div class="flex justify-between w-full gap-4 w-full">
        <Tabs id="tabs-1896">
          <Tabs.List size="sm" tab_titles={~w(Segment-sm Segment-sm Segment-sm)} tab_module={Tabs.Segment} />
        </Tabs>
        <Tabs id="tabs-9123">
          <Tabs.List size="md" tab_titles={~w(Segment-md Segment-md Segment-md)} tab_module={Tabs.Segment} />
        </Tabs>
      </div>
    </div>
    """
  end
end
