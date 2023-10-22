defmodule MoonWeb.Examples.Parts.ModalExample.ModalWizard do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Parts.ModalWizard
  alias Moon.Design.Button
  alias Moon.Design.Modal

  prop(menu_items, :list, default: MoonWeb.Schema.Link.menu())

  def render(assigns) do
    ~F"""
    <div>
      <Button on_click="set_open">Open dialog</Button>
      <ModalWizard id="modal_wizard" />
    </div>
    """
  end

  def handle_event("set_open", _, socket) do
    Modal.open("modal_wizard")
    {:noreply, socket}
  end

  def code() do
    """
    """
  end
end
