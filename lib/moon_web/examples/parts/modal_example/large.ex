defmodule MoonWeb.Examples.Parts.ModalExample.Large do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Parts.{Button, Modal}
  alias Moon.Parts.Button.ButtonsBlock

  import MoonWeb.Helpers.Lorem

  def render(assigns) do
    ~F"""
    <div>
      <Button on_click="set_open">Open large modal (lg)</Button>
      <Modal id="lg_modal" on_close="set_close" size="lg" title="Create new flow">
        <p class="text-moon-18 pe-16 pt-6">
          {lorem_payment()}
        </p>
        <p class="text-moon-18 pe-16 pt-6">
          {ipsum()}
        </p>
        <p class="text-moon-18 pe-16 py-6">
          {lorem()}
        </p>
        <ButtonsBlock has_divider>
          <Button.White on_click="set_close">Cancel</Button.White>
          <Button on_click="set_close">Sign In</Button>
        </ButtonsBlock>
      </Modal>
    </div>
    """
  end

  def handle_event("set_open", _, socket) do
    Modal.open("lg_modal")
    {:noreply, socket}
  end

  def handle_event("set_close", _, socket) do
    Modal.close("lg_modal")
    {:noreply, socket}
  end

  def code() do
    """

    """
  end
end
