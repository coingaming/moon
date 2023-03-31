defmodule MoonWeb.Examples.Design.SwitchExample.CustomBackground do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Design.Switch

  data(checked, :boolean, default: false)

  def handle_event("toggle_switch", _params, socket) do
    {:noreply, assign(socket, checked: !socket.assigns.checked)}
  end

  def render(assigns) do
    ~F"""
    <div class="w-full flex items-center justify-around">
      <Switch on_bg_color="bg-chichi" off_bg_color="bg-krillin" {=@checked} on_change="toggle_switch" />
      <Switch on_bg_color="bg-roshi" off_bg_color="bg-nappa" {=@checked} on_change="toggle_switch" />
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
        <Switch on_bg_color="bg-chichi" off_bg_color="bg-krillin" {=@checked} on_change="toggle_switch" />
        <Switch on_bg_color="bg-roshi" off_bg_color="bg-nappa" {=@checked} on_change="toggle_switch"/>
      </div>
      \"""
    end
    """
  end
end
