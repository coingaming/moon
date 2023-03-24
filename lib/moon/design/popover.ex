defmodule Moon.Design.Popover do
  @moduledoc false

  use Moon.StatefulComponent

  prop(on_click, :event)
  prop(is_open, :boolean, default: false)
  prop(class, :css_class)

  slot(default, required: true)
  slot(trigger, required: true)

  prop(testid, :string)

  def render(assigns) do
    ~F"""
    <div {=@id} class={@class} :on-click-away="close_panel">
      <div class="relative">
        <div role="button" :on-click={@on_click || "toggle_open"}>
          <#slot {@trigger} />
        </div>
        <div
          aria-expanded={(@is_open && "true") || "false"}
          class={"transition-opacity transition-200", hidden: @is_open == false}
          data-testid={"#{@testid}-popover-panel"}
        >
          <#slot />
        </div>
      </div>
    </div>
    """
  end

  def handle_event("toggle_open", _, socket) do
    {:noreply, assign(socket, is_open: !socket.assigns.is_open)}
  end

  def handle_event("close_panel", _, socket) do
    {:noreply, assign(socket, is_open: false)}
  end
end
