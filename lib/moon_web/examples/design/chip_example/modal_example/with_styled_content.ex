defmodule MoonWeb.Examples.Design.ModalExample.ExampleWithStyledContent do
  @moduledoc false

  use Moon.StatefulComponent

  use MoonWeb, :example

  alias Moon.Design.Modal
  alias Moon.Design.Button

  data(modal_is_open, :boolean, default: false)

  def render(assigns) do
    ~F"""
    <div>
      <Button on_click="open_modal">Open dialog</Button>
      <Modal is_open={@modal_is_open} on_close="close_modal">
        <Modal.Backdrop />
        <Modal.Panel class="lg:max-w-md bg-roshi text-goten">
          <Modal.Header has_close class="text-moon-24" />
          <div class="p-4">
            <div class="mt-2">
              <h3 class="text-moon-24 text-goten font-semibold text-center">
                Your payment has been successfully submitted.
              </h3>
            </div>
          </div>
          <div class="p-4 flex items-center justify-center">
            <Button variant="secondary" on_click="close_modal">Got it, thanks!</Button>
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
    alias Moon.Design.Modal
    alias Moon.Design.Button

    data(modal_is_open, :boolean, default: false)

    ...

    <div>
      <Button on_click="open_modal">Open dialog</Button>
      <Modal is_open={@modal_is_open} on_close="close_modal">
        <Modal.Backdrop />
        <Modal.Panel class="lg:max-w-md bg-roshi text-goten">
          <Modal.Header has_close class="text-moon-24" />
          <div class="p-4">
            <div class="mt-2">
              <h3 class="text-moon-24 text-goten font-semibold text-center">
                Your payment has been successfully submitted.
              </h3>
            </div>
          </div>
          <div class="p-4 flex items-center justify-center">
            <Button variant="secondary" on_click="close_modal">Got it, thanks!</Button>
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
