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

  @doc "data-testid attribute for HTML tag"
  prop(testid, :string)

  @doc "slot for triggering the open/closing state"
  slot(trigger, required: true)
  @doc "content to be showable"
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

  def render(assigns) do
    ~F"""
    <div class={merge(["relative", @class])} :on-click-away="close_me" {=@id} data-testid={@testid}>
      <div
        :on-click={@on_trigger || %{name: "on_trigger_default", target: @myself}}
        aria-haspopup="true"
        aria-expanded={@is_open}
      >
        <#slot {@trigger, value: @value, is_open: @is_open} />
      </div>
      <#slot context_put={
        on_change: %{name: "on_change_default", target: @myself},
        is_open: @is_open,
        value: @value
      } />
    </div>
    """
  end
end
