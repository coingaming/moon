defmodule MoonWeb.Components.ExampleAndCode do
  @moduledoc false

  use Moon.StatefulComponent

  alias Moon.Design.Tag
  alias Moon.Design.Tabs
  alias Moon.Icons.ControlsEye
  alias Moon.Icons.SoftwareCode

  prop(class, :string)
  prop(example_class, :css_class)
  prop(title, :string, default: "")
  prop(layout, :string, default: "grid")

  slot(example)
  slot(code)
  slot(state)
  slot(note)

  def render(assigns) do
    ~F"""
    <section class={"flex flex-col", @class}>
      <div class="flex flex-row items-center justify-between">
        <div class="flex flex-row gap-2 w-full">
          <Tabs id={"#{@id}-example-and-code"} class="justify-between gap-6">
            <h2 class="text-moon-24 font-semibold order-1">{@title}</h2>
            <p :if={slot_assigned?(:note)} class="text-moon-16 w-full order-3 empty:hidden"><#slot {@note} /></p>
            <Tabs.List class="w-fit p-1 gap-1 bg-goku rounded-moon-s-md order-2">
              <Tabs.Segment class="flex flex-row gap-2">
                <ControlsEye class="text-moon-24" />
                <span class="hidden md:block">Preview</span>
              </Tabs.Segment>
              <Tabs.Segment class="flex flex-row gap-2">
                <SoftwareCode class="text-moon-24" />
                <span class="hidden md:block">Code</span>
              </Tabs.Segment>
            </Tabs.List>
            <Tabs.Panels class="order-4">
              <Tabs.Panel>
                <div class={merge([
                  "p-4 flex bg-goku text-moon-14 rounded-moon-s-sm w-full",
                  @example_class
                ])}>
                  <!-- Do not remove this -->
                  <div class="flex flex-wrap items-center justify-around gap-2 w-full bg-transparent">
                    <#slot {@example}>Example not defined</#slot>
                  </div>
                </div>
              </Tabs.Panel>
              <Tabs.Panel>
                <div class="overflow-scroll">
                  <pre class="theme-moon-dark w-full bg-goku overflow-scroll p-4 text-moon-14 text-bulma rounded-moon-s-sm"><#slot {@code}>Example code not defined</#slot></pre>
                </div>
              </Tabs.Panel>
            </Tabs.Panels>
          </Tabs>
        </div>
      </div>

      <div
        class="theme-moon-dark grid gap-4 p-4 bg-goku text-moon-14 rounded-moon-s-sm"
        :if={slot_assigned?(:state)}
      >
        <div><Tag class="text-goten bg-piccolo w-fit">State</Tag></div>
        <pre class="break-all overflow-x-scroll text-bulma"><#slot {@state} /></pre>
      </div>
    </section>
    """
  end
end
