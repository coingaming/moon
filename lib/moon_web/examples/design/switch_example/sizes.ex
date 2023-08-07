defmodule MoonWeb.Examples.Design.SwitchExample.Sizes do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Design.Switch

  data(checked, :boolean, default: false)
  data(checked1, :boolean, default: true)

  def handle_event("toggle_switch", _params, socket) do
    {:noreply, assign(socket, checked: !socket.assigns.checked)}
  end

  def handle_event("toggle_switch1", _params, socket) do
    {:noreply, assign(socket, checked1: !socket.assigns.checked1)}
  end

  def render(assigns) do
    ~F"""
    <div class="w-full flex items-center justify-around">
      <Switch size="2xs" {=@checked} on_change="toggle_switch" testid="2xs" />
      <Switch size="xs" checked={@checked1} on_change="toggle_switch1" testid="xs" />
      <Switch {=@checked} on_change="toggle_switch" testid="default" />
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
      <div class="w-full flex items-center justify-around">
        <Switch size="2xs" {=@checked} on_change="toggle_switch"  />
        <Switch size="xs" checked={@checked1} on_change="toggle_switch1"  />
        <Switch {=@checked} on_change="toggle_switch"  />
      </div>
      \"""
    end
    """
  end
end
