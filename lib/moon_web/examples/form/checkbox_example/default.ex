defmodule MoonWeb.Examples.Form.CheckboxExample.Default do
  @moduledoc false

  use Moon.StatefulComponent

  use MoonWeb, :example

  alias Moon.Lego.Checkbox

  prop(is_selected, :boolean, default: false)

  def handle_event("on_click", _params, socket) do
    {:noreply, assign(socket, is_selected: !socket.assigns.is_selected)}
  end

  def render(assigns) do
    ~F"""
    <Checkbox {=@is_selected} on_click="on_click" />
    """
  end

  def code() do
    """
    prop(is_selected, :boolean, default: true)

    def handle_event("on_click", params, socket) do
      {:noreply, assign(socket, checked: !socket.assigns.is_selected)}
    end

    def render(assigns) do
      ~F\"""
      <Checkbox {=@is_selected} on_click="on_click" />
      \"""
    end
    """
  end
end
