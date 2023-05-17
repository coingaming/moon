defmodule Moon.Design.Popover do
  @moduledoc false

  use Moon.StatefulComponent

  prop(on_click, :event)
  prop(is_open, :boolean, default: false)
  prop(class, :css_class)

  slot(default, required: true)
  slot(trigger)

  prop(testid, :string)

  def render(assigns) do
    ~F"""
    <div {=@id} data-testid={@testid} class={@class} :on-click-away="close_panel">
      <div class="relative">
        <div :if={slot_assigned?(:trigger)} role="button" :on-click={@on_click || "toggle_open"}>
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

  def open(id) do
    send_update(__MODULE__, id: id, is_open: true)
  end

  def close(id) do
    send_update(__MODULE__, id: id, is_open: false)
  end
end
