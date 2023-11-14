defmodule MoonWeb.Examples.Parts.ModalExample.MediumWithLargeText do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Parts.{Button, Modal}
  alias Moon.Parts.Button.ButtonsBlock

  import MoonWeb.Helpers.Lorem

  def render(assigns) do
    ~F"""
    <div>
      <Button on_click="set_open">Open medium modal (md)</Button>
      <Modal id="large_modal" on_close="set_close" size="md" title="Accept cookie on the sites">
        <p class="text-moon-18 pe-16 pt-6">
          {lorem_big_content()}
        </p>
        <ButtonsBlock>
          <Button.White on_click="set_close">Cancel</Button.White>
          <Button on_click="set_close">Sign In</Button>
        </ButtonsBlock>
      </Modal>
    </div>
    """
  end

  def handle_event("set_open", _, socket) do
    Modal.open("large_modal")
    {:noreply, socket}
  end

  def handle_event("set_close", _, socket) do
    Modal.close("large_modal")
    {:noreply, socket}
  end

  def code() do
    """

    """
  end
end
