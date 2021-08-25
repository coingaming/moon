defmodule MoonWeb.Components.ExampleAndCodeV2 do
  use Surface.LiveComponent

  alias Moon.Components.Badge
  alias Moon.Components.Switcher

  prop class, :string
  prop show_state, :boolean
  prop layout, :string, default: "grid"
  data tabs, :list, default: ["Preview", "Code"]
  data selected_tab, :string, default: "Preview"
  slot example
  slot code
  slot state

  def render(assigns) do
    ~F"""
    <div class={"rounded-lg bg-gohan-100 p-0 #{@class}"}>
      <Switcher class="justify-end" items={@tabs} selected_item={@selected_tab} click="toggle" />
      <div class="grid grid-cols-1">
        <div class={"p-6", hidden: @selected_tab == "Code"}>
          <#slot name="example">
            Example not defined
          </#slot>
        </div>
        <div
          :on-click="toggle"
          class={
            "border-beerus-100 bg-piccolo-100 text-hit-80 justify-around",
            "sm:border-l": @layout == "grid",
            "border-t": @layout == "column",
            hidden: @selected_tab == "Preview"
          }
        >
          <#slot name="code">
            Example code not defined
          </#slot>
        </div>
      </div>
      <div class="p-6 border-t border-beerus-100" :if={@show_state}>
        <Badge size="small" class="bg-piccolo-100 mb-3">State</Badge>
        <pre class="text-xs break-all overflow-x-scroll text-trunks-100"><#slot name="state" /></pre>
      </div>
    </div>
    """
  end

  def handle_event("toggle", %{"selected-item" => selected_item}, socket) do
    {:noreply,
     socket
     |> assign(selected_tab: selected_item)}
  end
end
