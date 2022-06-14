defmodule MoonWeb.Components.ExampleAndCode do
  @moduledoc false

  use Moon.StatefulComponent

  alias Moon.Components.Label
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
    <div class={"rounded p-0 mb-8", @class}>
      <PreviewCodeButton title={@title} selected_button={@selected_button} click="toggle" />
      <div class="my-2 text-moon-14" :if={slot_assigned?(:note)}>
        <p><#slot name="note" /></p>
      </div>
      <Context get={theme_class: theme_class}>
        <div class="theme-moon-light p-4 bg-goku text-moon-14 rounded-moon-s-sm">
          <div class={"p-6", hidden: @selected_button == "code"}>
            <div class={"inline", theme_class}>
              <#slot name="example">Example not defined</#slot>
            </div>
          </div>
          <div class={
            "border-beerus-100 rounded-md shadow justify-around",
            "sm:border-l": @layout == "grid",
            "border-t": @layout == "column",
            hidden: @selected_button == "preview"
          }>
            <pre class="p-4"><#slot name="code">Example code not defined</#slot></pre>
          </div>
        </div>
      </Context>
      <div
        class="p-6 border-t border-beerus-100 bg-hit-100 rounded-md shadow grid gap-4"
        :if={slot_assigned?(:state)}
      >
        <div><Label size="medium" class="bg-piccolo-100 mb-3">State</Label></div>
        <pre class="text-moon-12 break-all overflow-x-scroll text-trunks-100"><#slot name="state" /></pre>
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
