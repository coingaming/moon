defmodule MoonWeb.Examples.Parts.ModalExample.Default do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Parts.Modal
  alias Moon.Design.Button

  prop(menu_items, :list, default: MoonWeb.Schema.Link.menu())

  @spec render(any()) :: Phoenix.LiveView.Rendered.t()
  def render(assigns) do
    ~F"""
    <div>
      <Button on_click="set_open">Open modal</Button>
      <Modal id="default_wizard" on_close="set_close" title="First modal">
        ololololo
      </Modal>
    </div>
    """
  end

  def handle_event("set_open", _, socket) do
    Modal.open("default_wizard")
    {:noreply, socket}
  end

  def handle_event("set_close", _, socket) do
    Modal.close("default_wizard")
    {:noreply, socket}
  end

  def code() do
    """
    """
  end
end
