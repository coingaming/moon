defmodule MoonWeb.Components.ExampleAndCode do
  use Surface.LiveComponent

  alias Moon.Components.Badge
  alias MoonWeb.Components.PreviewCodeButton

  prop class, :string
  prop layout, :string, default: "grid"
  data buttons, :list, default: ["preview", "code"]
  data selected_button, :string, default: "preview"
  prop title, :string, default: ""
  slot example
  slot code
  slot state
  slot note

  def render(assigns) do
    ~F"""
    <div class={"rounded-lg p-0  mb-8 #{@class}"}>
      <PreviewCodeButton
        class="justify-end"
        title={@title}
        selected_button={@selected_button}
        click="toggle"
      />
      <div class="my-2 text-sm" :if={slot_assigned?(:note)}>
        <p><#slot name="note" /></p>
      </div>
      <div class="grid grid-cols-1 bg-gohan-100 rounded-md shadow">
        <div class={"p-6", hidden: @selected_button == "code"}>
          <#slot name="example">
            Example not defined
          </#slot>
        </div>
        <div class={
          "border-beerus-100 bg-piccolo-100 text-hit-80 rounded-md shadow justify-around",
          "sm:border-l": @layout == "grid",
          "border-t": @layout == "column",
          hidden: @selected_button == "preview"
        }>
          <#slot name="code">
            Example code not defined
          </#slot>
        </div>
      </div>
      <div
        class="p-6 border-t border-beerus-100 bg-hit-100 rounded-md shadow"
        :if={slot_assigned?(:state)}
      >
        <Badge size="small" class="bg-piccolo-100 mb-3">State</Badge>
        <pre class="text-xs break-all overflow-x-scroll text-trunks-100">
          <#slot name="state" />
        </pre>
      </div>
    </div>
    """
  end

  def handle_event("toggle", %{"selected-item" => selected_button}, socket) do
    {:noreply,
     socket
     |> assign(selected_button: selected_button)}
  end
end
