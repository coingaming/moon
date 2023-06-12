defmodule Moon.Design.Dropdown do
  @moduledoc "Component for rendering dropdown info, mostly lists"

  use Moon.StatefulComponent

  @doc "Value(s) of the options to be marked as selected"
  prop(value, :any)
  @doc "Event that fired when trigger is clicked "
  prop(on_trigger, :event)
  @doc "Put true here if you want dropdown to be shown by default"
  prop(is_open, :boolean)
  @doc "Addictional classes to be added to a dropdown"
  prop(class, :css_class)
  @doc "Data-testid attribute for HTML tag"
  prop(testid, :string)

  @doc "Attribute phx-hook. Used for dependant components"
  prop(hook, :string)

  @doc "Slot for triggering the open/closing state"
  slot(trigger, required: true)
  @doc "Content to be showable"
  slot(default)

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

  def render(assigns) do
    ~F"""
    <div
      class={merge(["relative", @class])}
      :on-click-away="close_me"
      {=@id}
      data-testid={@testid}
      phx-hook={@hook}
    >
      <#slot
        {@trigger, value: @value, is_open: @is_open}
        context_put={
          is_open: @is_open,
          on_trigger: @on_trigger || %{name: "on_trigger_default", target: @myself},
          open_me: %{name: "open_me", target: @myself},
          close_me: %{name: "close_me", target: @myself}
        }
      />
      <#slot context_put={
        on_change: %{name: "on_change_default", target: @myself},
        is_open: @is_open,
        value: @value
      } />
    </div>
    """
  end
end
