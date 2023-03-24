defmodule Moon.Design.Drawer do
  @moduledoc false

  use Moon.StatefulComponent

  data(is_open, :boolean, default: false)

  slot(panel, required: true)
  slot(backdrop)

  prop(position, :string,
    values!: [
      "top",
      "bottom",
      "start",
      "end"
    ],
    default: "end"
  )

  prop(test_id, :string)

  defp animate_class(position) do
    case position do
      "top" -> "animate-drawerleavetop"
      "bottom" -> "animate-drawerleavebottom"
      "start" -> "animate-drawerleavestart"
      "end" -> "animate-drawerleaveend"
    end
  end

  def render(assigns) do
    ~F"""
    <div
      phx-hook="Drawer"
      data-is_open={@is_open}
      data-animate_class={animate_class(@position)}
      aria-expanded={(@is_open && "true") || "false"}
      class={"fixed z-[99999] inset-0", "moon-drawer", hidden: @is_open == false}
      data-testid={@test_id}
    >
      <#slot {@backdrop} />
      <#slot
        {@panel}
        context_put={
          on_close: %{name: "close_drawer", target: @myself},
          position: @position
        }
      />
    </div>
    """
  end

  def is_open(drawer_id) do
    send_update(__MODULE__, id: drawer_id, is_open: true)
  end

  def is_closed(drawer_id) do
    send_update(__MODULE__, id: drawer_id, is_open: false)
  end

  def handle_event("open_drawer", _, socket) do
    {:noreply, assign(socket, is_open: true)}
  end

  def handle_event("close_drawer", _, socket) do
    {:noreply, assign(socket, is_open: false)}
  end
end
