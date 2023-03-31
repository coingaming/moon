defmodule MoonWeb.Examples.Design.SwitchExample.WithIcons do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Icons.GenericCheckRounded
  alias Moon.Icons.GenericClose
  alias Moon.Design.Switch

  data(checked, :boolean, default: false)

  def handle_event("toggle_switch", _params, socket) do
    {:noreply, assign(socket, checked: !socket.assigns.checked)}
  end

  def render(assigns) do
    ~F"""
    <div class="w-full flex items-center justify-around">
      <Switch size="2xs" {=@checked} on_change="toggle_switch">
        <:on_icon><GenericCheckRounded /></:on_icon>
        <:off_icon><GenericClose /></:off_icon>
      </Switch>
      <Switch size="xs" {=@checked} on_change="toggle_switch">
        <:on_icon><GenericCheckRounded /></:on_icon>
        <:off_icon><GenericClose /></:off_icon>
      </Switch>
      <Switch {=@checked} on_change="toggle_switch">
        <:on_icon><GenericCheckRounded /></:on_icon>
        <:off_icon><GenericClose /></:off_icon>
      </Switch>
    </div>
    """
  end

  def code() do
    """
    alias Moon.Icons.GenericCheckRounded
    alias Moon.Icons.GenericClose
    alias Moon.Design.Switch

    data(checked, :boolean, default: false)

    def handle_event("toggle_switch", _params, socket) do
      {:noreply, assign(socket, checked: !socket.assigns.checked)}
    end

    def render(assigns) do
      ~F\"""
      <div class="w-full flex items-center justify-around">
        <Switch size="2xs" {=@checked} on_change="toggle_switch">
          <:on_icon><GenericCheckRounded /></:on_icon>
          <:off_icon><GenericClose /></:off_icon>
        </Switch>
        <Switch size="xs" {=@checked} on_change="toggle_switch">
          <:on_icon><GenericCheckRounded /></:on_icon>
          <:off_icon><GenericClose /></:off_icon>
        </Switch>
        <Switch {=@checked} on_change="toggle_switch">
          <:on_icon><GenericCheckRounded /></:on_icon>
          <:off_icon><GenericClose /></:off_icon>
        </Switch>
      </div>
      \"""
    end

    """
  end
end
