defmodule MoonWeb.Components.ExampleAndCode do
  use MoonWeb, :stateless_component
  alias Moon.Components.Badge

  prop class, :string
  prop show_state, :boolean
  prop layout, :string, default: "grid"
  slot example
  slot code
  slot state

  def render(assigns) do
    ~F"""
    <div class={"rounded-lg bg-gohan-100 p-0 #{@class}"}>
      <div class={"grid grid-cols-1", "sm:grid-cols-2": @layout == "grid"}>
        <div class="p-6">
          <#slot name="example">
            Example not defined
          </#slot>
        </div>
        <div class={
          "border-beerus-100 bg-piccolo-100 text-hit-80 justify-around",
          "sm:border-l": @layout == "grid",
          "border-t": @layout == "column"
        }>
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
end
