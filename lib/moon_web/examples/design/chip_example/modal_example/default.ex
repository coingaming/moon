defmodule MoonWeb.Examples.Design.ModalExample.Default do
  @moduledoc false

  use Moon.StatefulComponent

  use MoonWeb, :example

  alias Moon.Autolayouts.PullAside
  alias Moon.Design.Modal
  alias Moon.Design.Button

  import MoonWeb.Helpers.Lorem

  data(modal_is_open, :boolean, default: false)

  def render(assigns) do
    ~F"""
    <div>
      <Button on_click="open_modal">Open dialog</Button>
      <Modal is_open={@modal_is_open} on_close="close_modal">
        <Modal.Backdrop />
        <Modal.Panel>
          <Modal.Header has_divider>Payment successful</Modal.Header>
          <div class="p-4">
            <p class="text-moon-16 text-trunks">
              {lorem_payment()}
            </p>
          </div>
          <div class="p-4 border-t-2 border-beerus">
            <PullAside>
              <:left>
                <Button on_click="close_modal">Got it, thanks!</Button>
              </:left>
            </PullAside>
          </div>
        </Modal.Panel>
      </Modal>
    </div>
    """
  end

  def handle_event("open_modal", _params, socket) do
    socket = assign(socket, modal_is_open: true)
    {:noreply, socket}
  end

  def handle_event("close_modal", _params, socket) do
    socket = assign(socket, modal_is_open: false)
    {:noreply, socket}
  end

  def code() do
    """
    alias Moon.Autolayouts.PullAside
    alias Moon.Design.Modal
    alias Moon.Design.Button

    import MoonWeb.Helpers.Lorem

    data(modal_is_open, :boolean, default: false)

    ...

    <div>
    <Button on_click="open_modal">Open dialog</Button>
    <Modal is_open={@modal_is_open} on_close="close_modal">
      <Modal.Backdrop />
      <Modal.Panel>
        <Modal.Header has_divider>Payment successful</Modal.Header>
        <div class="p-4">
          <p class="text-moon-16 text-trunks">
            {lorem_payment()}
          </p>
        </div>
        <div class="p-4 border-t-2 border-beerus">
          <PullAside>
            <:left>
              <Button on_click="close_modal">Got it, thanks!</Button>
            </:left>
          </PullAside>
        </div>
      </Modal.Panel>
    </Modal>
    </div>

    ...

    def handle_event("open_modal", _params, socket) do
    socket = assign(socket, modal_is_open: true)
    {:noreply, socket}
    end

    def handle_event("close_modal", _params, socket) do
    socket = assign(socket, modal_is_open: false)
    {:noreply, socket}
    end
    """
  end
end
