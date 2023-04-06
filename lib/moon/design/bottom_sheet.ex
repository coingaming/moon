defmodule Moon.Design.BottomSheet do
  @moduledoc false

  use Moon.StatefulComponent

  prop(is_open, :boolean, default: false)
  prop(on_close, :event)
  prop(has_shadow, :boolean, default: false)

  prop(size, :string,
    values!: [
      "sm",
      "md",
      "lg"
    ],
    default: "md"
  )

  prop(class, :css_class)

  slot(panel, required: true)
  slot(backdrop)

  prop(testid, :string)

  # internal API
  data(is_closing, :boolean, default: false)

  def render(assigns) do
    ~F"""
    <div
      {=@id}
      phx-hook="Animation"
      data-is_open={@is_open}
      data-is_closing={"#{@is_closing}"}
      class={merge(["fixed z-[99999] inset-0 hidden", @class])}
      data-testid={@testid}
    >
      <#slot {@backdrop} />
      <#slot
        {@panel}
        context_put={
          on_close: @on_close || %{name: "start_closing_bottom_sheet", target: @myself},
          has_shadow: @has_shadow,
          size: @size
        }
      />
    </div>
    """
  end

  def open(bottom_sheet_id) do
    send_update(__MODULE__, id: bottom_sheet_id, is_open: true)
  end

  def close(bottom_sheet_id) do
    send_update(__MODULE__, id: bottom_sheet_id, is_closing: true)
  end

  def handle_event("set_open", _, socket) do
    {:noreply, assign(socket, is_open: true)}
  end

  def handle_event("start_closing_bottom_sheet", _, socket) do
    {:noreply, assign(socket, is_closing: true)}
  end

  def handle_event("set_close", _, socket) do
    {:noreply, assign(socket, is_open: false, is_closing: false)}
  end
end
