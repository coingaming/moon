defmodule MoonWeb.Examples.Design.SwitchExample.Default do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Design.Switch

  data(checked, :boolean, default: true)

  def handle_event("toggle_switch", _params, socket) do
    {:noreply, assign(socket, checked: !socket.assigns.checked)}
  end

  def render(assigns) do
    ~F"""
    <div>
      <Switch {=@checked} on_change="toggle_switch" />
    </div>
    """
  end

  def code() do
    """
    alias Moon.Design.Switch

    data(checked, :boolean, default: false)

    def handle_event("toggle_switch", _params, socket) do
      {:noreply, assign(socket, checked: !socket.assigns.checked)}
    end

    def render(assigns) do
      ~F\"""
      <Switch checked {=@checked} on_change="toggle_switch" />
      \"""
    end
    """
  end
end
