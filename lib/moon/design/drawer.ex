defmodule Moon.Design.Drawer do
  @moduledoc false

  use Moon.StatefulComponent

  alias Phoenix.LiveView.JS

  data(is_open, :boolean, default: false)

  slot(panel, required: true)
  slot(backdrop)

  prop(test_id, :string)

  prop(position, :string,
    values!: [
      "top",
      "bottom",
      "start",
      "end"
    ],
    default: "end"
  )

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
          on_close: close_content(@position),
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

  def close_content(position) do
    case position do
      "top" ->
        JS.add_class(
          "hidden",
          transition:
            {"ease-in duration-200 transition-transform", "-translate-y-full", "translate-y-0"},
          time: 200
        )
      "bottom" ->
        JS.add_class(
          "hidden",
          transition:
            {"ease-in duration-200 transition-transform", "translate-y-full", "translate-y-0"},
          time: 200
        )
      "start" ->
        JS.add_class(
          "hidden",
          transition:
            {"ease-in duration-200 transition-transform",
             "ltr:-translate-x-full rtl:translate-x-full", "translate-x-0"},
          time: 200
        )
      "end" ->
        JS.add_class(
          "hidden",
          transition:
            {"ease-in duration-200 transition-transform",
             "ltr:translate-x-full rtl:-translate-x-full", "translate-x-0"},
          time: 200
        )
    end

  end

  def close_backdrop() do
    JS.add_class(
      "hidden",
      transition: {"ease-in duration-200", "opacity-100", "opacity-0"},
      time: 200
    )
  end
end
