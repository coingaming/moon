defmodule MoonWeb.Examples.Form.CheckboxExample.Customizations do
  @moduledoc false

  use Moon.StatefulComponent

  use MoonWeb, :example

  alias Moon.Lego.Checkbox

  prop(is_selected0, :boolean, default: false)
  prop(is_selected1, :boolean, default: false)
  prop(is_selected2, :boolean, default: false)
  prop(is_selected3, :boolean, default: false)

  def handle_event("on_click" <> index, _params, socket) do
    {:noreply, assign(socket, "is_selected#{index}": !socket.assigns[:"is_selected#{index}"])}
  end

  def render(assigns) do
    ~F"""
    <div class="w-full flex flex-wrap items-center justify-around">
      <Checkbox selected_class="bg-krillin" is_selected={@is_selected0} on_click="on_click0" />
      <Checkbox class="rounded-none" is_selected={@is_selected1} on_click="on_click1" />
      <Checkbox unselected_class="shadow-krillin" is_selected={@is_selected2} on_click="on_click2" />
      <Checkbox class="text-krillin-60" is_selected={@is_selected3} on_click="on_click3" />
    </div>
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
