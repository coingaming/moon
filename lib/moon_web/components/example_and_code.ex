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
    <div class={"flex flex-col gap-6", @class}>
      <PreviewCodeButton title={@title} selected_button={@selected_button} click="toggle" />
      <div class="my-2 text-moon-14" :if={slot_assigned?(:note)}>
        <p><#slot name="note" /></p>
      </div>
      <Context get={theme_class: theme_class}>
        <div class={
          "p-4 flex bg-goku-100 text-moon-14 rounded-moon-s-sm",
          "moon-design-dark hidden": @selected_button == "code"
        }>
          <div class={"w-full bg-transparent", theme_class}>
            <#slot name="example">Example not defined</#slot>
          </div>
        </div>
        <div class={
          "overflow-scroll",
          hidden: @selected_button == "preview"
        }>
          <pre><#slot name="code">Example code not defined</#slot></pre>
        </div>
      </Context>
      <div
        class="p-4 flex flex-col bg-goku-100 text-moon-14 rounded-moon-s-sm"
        :if={slot_assigned?(:state)}
      >
        <div><Label size="medium" class="bg-piccolo-100 mb-3">State</Label></div>
        <pre class="break-all overflow-x-scroll text-trunks-100"><#slot name="state" /></pre>
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
