defmodule Moon.Design.Dropdown do
  @moduledoc "Component for rendering dropdown info, mostly lists"

  # TODO: Add bottom sheet and backdrop animations

  use Moon.StatefulComponent

  @doc "Value(s) of the options to be marked as selected"
  prop(value, :any)
  @doc "Event fired when trigger is clicked"
  prop(on_trigger, :event)
  @doc "Event fired to close Dropdown.BottomOptions"
  prop(on_close, :event)
  @doc "Put true here if you want dropdown to be shown by default"
  prop(is_open, :boolean)
  @doc "Addictional classes to be added to a dropdown"
  prop(class, :css_class)
  @doc "Data-testid attribute for HTML tag"
  prop(testid, :string)
  @doc "Dropdown autoclose on click away"
  prop(autoclose, :boolean, default: true)
  @doc "Disabled state for the dropdown"
  prop(disabled, :boolean)

  @doc "Attribute phx-hook. Used for dependant components"
  prop(hook, :string)

  @doc """
  Experimental: makes BottomSheet behave as Modal on some screen widths,
  please reffer to https://tailwindcss.com/docs/screens
  """
  prop(as_dropdown_on, :string, values: ~w(sm md lg xl 2xl))
  @doc "Additional values to be passed"
  prop(side_values, :map, default: %{})
  @doc "Event fired when option is selected"
  prop(on_change, :event)

  @doc "Slot for triggering the open/closing state"
  slot(trigger, required: true)
  @doc "Content to be showable"
  slot(default)
  @doc "Backdrop of Dropdown as BottomSheet on small screens, see Dropdown.Backdrop"
  slot(backdrop)

  def handle_event("on_change_default", %{"value" => value}, socket) do
    {:noreply, assign(socket, value: value, is_open: false)}
  end

  def handle_event("on_trigger_default", _, socket) do
    {:noreply, assign(socket, is_open: !socket.assigns.is_open)}
  end

  def handle_event("close_me", _, socket) do
    {:noreply, assign(socket, is_open: false)}
  end

  def handle_event("open_me", _, socket) do
    {:noreply, assign(socket, is_open: true)}
  end

  def close(dropdown_id) do
    send_update_after(__MODULE__, [id: dropdown_id, is_open: false], 100)
  end

  def render(assigns) do
    ~F"""
    <div
      class={merge(["relative", get_config(:default_class), @class])}
      :on-click-away={(@autoclose && "close_me") || nil}
      {=@id}
      data-testid={@testid}
      phx-hook={@hook}
    >
      <#slot
        {
          @trigger,
          value: @value,
          is_open: @is_open,
          disabled: @disabled,
          on_trigger: @on_trigger || %{name: "on_trigger_default", target: @myself}
        }
        context_put={
          is_open: @is_open,
          on_trigger: @on_trigger || %{name: "on_trigger_default", target: @myself},
          open_me: %{name: "open_me", target: @myself},
          close_me: %{name: "close_me", target: @myself}
        }
      />
      <#slot
        {@backdrop}
        context_put={
          is_open: @is_open,
          as_dropdown_on: @as_dropdown_on
        }
      />
      <#slot context_put={
        values: @side_values,
        on_change: @on_change || %{name: "on_change_default", target: @myself},
        close_me: @on_close || %{name: "close_me", target: @myself},
        is_open: @is_open,
        value: @value,
        as_dropdown_on: @as_dropdown_on
      } />
    </div>
    """
  end
end
