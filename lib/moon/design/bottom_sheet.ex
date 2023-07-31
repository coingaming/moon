defmodule Moon.Design.BottomSheet do
  @moduledoc false

  use Moon.StatefulComponent

  @doc "Whether the BottomSheet is open or not"
  prop(is_open, :boolean, default: false)

  @doc "Called when the BottomSheet is dismissed"
  prop(on_close, :event)

  data(is_closing_on_click_away, :boolean, default: false)

  @doc "Whether the BottomSheet has a shadow or not"
  prop(has_shadow, :boolean, default: false)

  @doc "The size of the BottomSheet, sm, md, lg or custom pixel/percentage/rem value"
  prop(size, :string,
    values!: [
      "sm",
      "md",
      "lg"
    ],
    default: "md"
  )

  @doc "Tailwind classes for customization"
  prop(class, :css_class)

  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)

  @doc """
  Experimental: makes BottomSheet behave as Modal on some screen widths,
  please reffer to https://tailwindcss.com/docs/screens
  """
  prop(as_modal_on, :string, values: ~w(sm md lg xl 2xl))

  @doc "Panel of BottomSheet, see BottomSheet.Panel"
  slot(panel, required: true)

  @doc "Backdrop of BottomSheet, see BottomSheet.Backdrop"
  slot(backdrop)

  # internal API
  @doc "Internal API, used for transition of the element"
  data(is_closing, :boolean, default: false)

  def render(assigns) do
    ~F"""
    <div
      {=@id}
      phx-hook="Bottomsheet"
      data-is_open={@is_open}
      data-is_closing={"#{@is_closing}"}
      data-is_closing_on_click_away={"#{@is_closing_on_click_away}"}
      class={merge([
        "fixed z-[99999] inset-0 hidden",
        modal_classes(@as_modal_on),
        @class
      ])}
      data-testid={@testid}
    >
      <#slot {@backdrop} />
      <#slot
        {@panel}
        context_put={
          on_close: @on_close || %{name: "start_closing_bottom_sheet_on_click_away", target: @myself},
          has_shadow: @has_shadow,
          as_modal_on: @as_modal_on,
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

  def handle_event("start_closing_bottom_sheet_on_click_away", _, socket) do
    {:noreply, assign(socket, is_closing_on_click_away: true)}
  end

  def handle_event("set_close", _, socket) do
    {:noreply, assign(socket, is_open: false, is_closing: false)}
  end

  defp modal_classes(nil), do: []

  defp modal_classes(size) do
    ~w(hidden flex items-center justify-center) |> Enum.map(&"#{size}:#{&1}")
  end
end
