defmodule Moon.Design.Drawer do
  @moduledoc false

  use Moon.StatefulComponent

  data(is_open, :boolean, default: false)
  data(is_closing, :boolean, default: false)

  slot(panel, required: true)
  slot(backdrop)

  prop(testid, :string)

  def render(assigns) do
    ~F"""
    <div
      {=@id}
      phx-hook="Animation"
      data-is_open={@is_open}
      data-is_closing={"#{@is_closing}"}
      aria-expanded={(@is_open && "true") || "false"}
      class="fixed z-[99999] inset-0 hidden"
      data-testid={@testid}
    >
      <#slot {@backdrop} />
      <#slot
        {@panel}
        context_put={
          on_close: %{name: "start_closing_drawer", target: @myself}
        }
      />
    </div>
    """
  end

  def open(drawer_id) do
    send_update(__MODULE__, id: drawer_id, is_open: true)
  end

  def close(drawer_id) do
    send_update(__MODULE__, id: drawer_id, is_closing: true)
  end

  def handle_event("set_open", _, socket) do
    {:noreply, assign(socket, is_open: true)}
  end

  def handle_event("start_closing_drawer", _, socket) do
    {:noreply, assign(socket, is_closing: true)}
  end

  def handle_event("set_close", _, socket) do
    {:noreply, assign(socket, is_open: false, is_closing: false)}
  end
end
