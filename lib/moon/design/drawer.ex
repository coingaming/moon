defmodule Moon.Design.Drawer do
  @moduledoc false

  use Moon.StatefulComponent

  alias Phoenix.LiveView.JS

  data(is_open, :boolean, default: false)

  slot(panel, required: true)
  slot(backdrop)

  prop(test_id, :string)

  def render(assigns) do
    ~F"""
    <div
      aria-expanded={(@is_open && "true") || "false"}
      class={"fixed z-[99999] inset-0", hidden: @is_open == false}
      data-testid={@test_id}
    >
      <#slot {@backdrop} />
      <#slot
        {@panel}
        context_put={
          on_close: %{name: {close_content(@id)}, target: @myself}
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

  def close_content(id) do
    JS.add_class(
      "hidden",
      to: "#" <> id,
      transition: {"ease-out duration-500", "opacity-0", "hidden"},
      time: 500
    )

  end


end
