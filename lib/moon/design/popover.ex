defmodule Moon.Design.Popover do
  @moduledoc false

  use Moon.StatefulComponent

  prop(on_click, :event)
  prop(close, :event)
  prop(is_open, :boolean, default: false)
  prop(testid, :string)

  slot(default, required: true)
  slot(trigger, required: true)

  def render(assigns) do
    ~F"""
    <div
      class="relative"
      ,
      :on-click={@on_click || "toggle_open"}
      :on-click-away={@close || "close_panel"}
    >
      <div role="button">
        <#slot {@trigger} />
      </div>
      <div
        aria-expanded={[if(@is_open == false, do: "false", else: "true")]}
        class={"transition-opacity transition-200", hidden: @is_open == false}
        data-testid={"#{@testid}-popover-panel"}
      >
        <#slot />
      </div>
    </div>
    """
  end

  def handle_event("toggle_open", _, socket) do
    {:noreply, assign(socket, is_open: !socket.assigns.is_open)}
  end

  def handle_event("close_panel", _, socket) do
    socket = assign(socket, is_open: false)
    {:noreply, socket}
  end
end
