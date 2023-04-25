defmodule Moon.Design.Dropdown do
  @moduledoc false

  use Moon.StatefulComponent

  prop(value, :any)
  prop(on_trigger, :event)
  prop(is_open, :boolean)

  prop(class, :css_class)

  prop(testid, :string)

  slot(trigger, required: true)
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
