defmodule Moon.Design.Drawer do
  @moduledoc false

  use Moon.StatefulComponent

  prop(is_open, :boolean, default: false)
  data(is_closing, :boolean, default: false)

  slot(panel, required: true)
  slot(backdrop)

  prop(on_close, :event)
  prop(lg_persists, :boolean)

  prop(testid, :string)
  prop(class, :css_class)

    @doc "Internal API, used for transition of the element"
    data(is_opening, :boolean, default: false)

  def render(assigns) do
    ~F"""
    <div
      {=@id}
      phx-hook="Animation"
      data-is_open={@is_open}
      data-is_closing={"#{@is_closing}"}
      data-is_opening={"#{@is_opening}"}
      data-lg_persists={@lg_persists}
      aria-expanded={(@is_open && "true") || "false"}
      class={merge(["fixed z-[99999] inset-0 hidden", @class])}
      data-testid={@testid}
    >
    {#if @is_opening == true}
      <#slot {@backdrop} />
      <#slot
        {@panel}
        context_put={
          on_close: @on_close || %{name: "start_closing_drawer", target: @myself}
        }
      />
      {/if}
    </div>

    """
  end

  def open(drawer_id) do
    send_update(__MODULE__, id: drawer_id, is_opening: true)
  end

  def close(drawer_id) do
    send_update(__MODULE__, id: drawer_id, is_closing: true, is_opening: false)
  end

  def handle_event("set_open", _, socket) do
    {:noreply, assign(socket, is_open: true)}
  end

  def handle_event("start_closing_drawer", _, socket) do
    {:noreply, assign(socket, is_closing: true)}
  end

  def handle_event("stop_closing", _, socket) do
    {:noreply, assign(socket, is_closing: false)}
  end

  def handle_event("set_close", _, socket) do
    {:noreply, assign(socket, is_open: false, is_closing: false, is_opening: false)}
  end
end
