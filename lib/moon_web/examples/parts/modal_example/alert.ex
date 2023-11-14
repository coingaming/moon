defmodule MoonWeb.Examples.Parts.ModalExample.Alert do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Parts.{Button, Modal}
  alias Moon.Parts.Button.ButtonsBlock

  def render(assigns) do
    ~F"""
    <div>
      <Button on_click="set_open">Open alert modal (xs)</Button>
      <Modal id="alert_modal" on_close="set_close" size="xs">
        <p class="text-moon-18 pe-16">Are you sure you want to add the “Speech to Text” service to the node=test app?</p>
        <ButtonsBlock>
          <Button.White on_click="set_close">Cancel</Button.White>
          <Button on_click="set_close">Sign In</Button>
        </ButtonsBlock>
      </Modal>
    </div>
    """
  end

  def handle_event("set_open", _, socket) do
    Modal.open("alert_modal")
    {:noreply, socket}
  end

  def handle_event("set_close", _, socket) do
    Modal.close("alert_modal")
    {:noreply, socket}
  end

  def code() do
    """

    """
  end
end
