defmodule MoonWeb.Components.ExampleAndCodeV2 do
  use Surface.LiveComponent

  alias Moon.Components.Badge
  alias Moon.Components.Switch

  prop class, :string
  prop show_state, :boolean
  prop show_code, :boolean, default: false
  prop layout, :string, default: "grid"
  slot example
  slot code
  slot state

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~F"""
    <div class="text-right">
      Code <Switch checked={@show_code} on_change="toggle" />
    </div>
    <div class={"rounded-lg bg-gohan-100 p-0 #{@class}"}>
      <div class="grid grid-cols-1">
        <div class={"p-6", hidden: @show_code}>
          <#slot name="example">
            Example not defined
          </#slot>
        </div>
        <div
          :on-click="toggle"
          class={
            "border-beerus-100 bg-piccolo-100 text-hit-80 justify-around bg-cell-60 ",
            "sm:border-l": @layout == "grid",
            "border-t": @layout == "column",
            hidden: !@show_code
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

  def handle_event("toggle", _value, socket) do
    IO.inspect("Socket assigns": socket.assigns)
    show_code = socket.assigns.show_code

    {:noreply,
     socket
     |> assign(show_code: !show_code)}
  end
end
