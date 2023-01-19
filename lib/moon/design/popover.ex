defmodule Moon.Design.Popover do
  @moduledoc false

  use Moon.StatefulComponent

  prop(on_click, :event)
  prop(close, :event)
  prop(is_open, :boolean, default: false)

  slot(default, required: true)
  slot(trigger, required: true)

  def render(assigns) do
    ~F"""
    <div
      class="relative inline-block"
      ,
      :on-click={@on_click || "toggle_open"}
      :on-click-away={@close || "close_panel"}
    >
      <div class={"transition-opacity transition-200", hidden: @is_open == false}>
        <#slot />
      </div>
      <div class="inline-block">
        <#slot {@trigger} />
      </div>
    </div>
    """
  end

  def handle_event("toggle_open", _, socket) do
    if socket.assigns[:is_open] == false do
      {:noreply, assign(socket, is_open: true)}
    else
      {:noreply, assign(socket, is_open: false)}
    end
  end

  def handle_event("close_panel", _, socket) do
    socket = assign(socket, is_open: false)
    {:noreply, socket}
  end
end
