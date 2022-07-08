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
    <section class={"flex flex-col gap-6", @class}>
      <PreviewCodeButton title={@title} selected_button={@selected_button} click="toggle" />
      <div class="my-2 text-moon-14" :if={slot_assigned?(:note)}>
        <p><#slot name="note" /></p>
      </div>
      <Context>
        <div class={
          "p-4 flex bg-goku-100 text-moon-14 rounded-moon-s-sm moon-design-light",
          hidden: @selected_button == "code"
        }>
          <div class="flex flex-wrap items-center justify-around gap-2 w-full">
            <#slot name="example">Example not defined</#slot>
          </div>
        </div>
        <div class={
          "overflow-scroll",
          hidden: @selected_button == "preview"
        }>
          <pre class="moon-design-dark w-full bg-goku-100 overflow-scroll p-4 text-moon-14 text-bulma-100 rounded-moon-s-sm"><#slot name="code">Example code not defined</#slot></pre>
        </div>
      </Context>
      <div
        class="p-4 flex flex-col bg-goku-100 text-moon-14 rounded-moon-s-sm"
        :if={slot_assigned?(:state)}
      >
        <div><Label size="medium" class="bg-piccolo-100 mb-3">State</Label></div>
        <pre class="break-all overflow-x-scroll text-trunks-100"><#slot name="state" /></pre>
      </div>
    </section>
    """
  end

  def handle_event("toggle", %{"selected-item" => selected_button}, socket) do
    {:noreply,
     socket
     |> assign(selected_button: selected_button)}
  end
end
