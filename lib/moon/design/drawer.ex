defmodule Moon.Design.Drawer do
  @moduledoc false

  use Moon.StatefulComponent

  data(is_open, :boolean, default: false)

  prop(is_closing, :boolean, default: false)

  slot(panel, required: true)
  slot(backdrop)

  prop(testid, :string)

  def render(assigns) do
    ~F"""
    <div
      {=@id}
      phx-hook="Drawer"
      data-is_open={@is_open}
      aria-expanded={(@is_open && "true") || "false"}
      class="fixed z-[99999] inset-0 hidden"
      data-testid={@testid}
    >
      <#slot {@backdrop} />
      <#slot {@panel} />
    </div>
    """
  end

  def open(drawer_id) do
    send_update(__MODULE__, id: drawer_id, is_open: true)
  end

  def closed(drawer_id) do
    send_update(__MODULE__, id: drawer_id, is_open: false)
  end

  def handle_event("open_drawer", _, socket) do
    {:noreply, assign(socket, is_open: true)}
  end

  def handle_event("start_closing_drawer", _, socket) do
    {:noreply, assign(socket, is_closing: true)}
  end

  def handle_event("close_drawer", _, socket) do
    {:noreply, assign(socket, is_open: false)}
  end
end
