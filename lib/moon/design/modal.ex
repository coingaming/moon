defmodule Moon.Design.Modal do
  @moduledoc false
  use Moon.StatefulComponent

  prop(is_open, :boolean, default: false)
  data(is_closing, :boolean, default: false)

  slot(backdrop, required: true)
  slot(panel, required: true)

  prop(on_close, :event)

  prop(testid, :string)

  def render(assigns) do
    ~F"""
    <div
      {=@id}
      phx-hook="Animation"
      data-is_open={@is_open}
      data-is_closing={"#{@is_closing}"}
      aria-modal={(@is_open && "true") || "false"}
      class="fixed inset-0 z-[99999] overflow-y-auto hidden"
      data-testid={@testid}
    >
      <div class="flex min-h-full items-center justify-center p-4">
        <#slot {@backdrop} />
        <#slot
          {@panel}
          context_put={
            on_close: @on_close || %{name: "start_closing_modal", target: @myself}
          }
        />
      </div>
    </div>
    """
  end

  def open(modal_id) do
    send_update(__MODULE__, id: modal_id, is_open: true)
  end

  def close(modal_id) do
    send_update(__MODULE__, id: modal_id, is_closing: true)
  end

  def handle_event("set_open", _, socket) do
    {:noreply, assign(socket, is_open: true)}
  end

  def handle_event("start_closing_modal", _, socket) do
    {:noreply, assign(socket, is_closing: true)}
  end

  def handle_event("stop_closing", _, socket) do
    {:noreply, assign(socket, is_closing: false)}
  end

  def handle_event("set_close", _, socket) do
    {:noreply, assign(socket, is_open: false, is_closing: false)}
  end
end
