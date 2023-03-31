defmodule MoonWeb.Examples.Design.ModalExample.ExampleWithStyledContent do
  @moduledoc false

  use Moon.StatefulComponent

  use MoonWeb, :example

  alias Moon.Icons.ControlsClose
  alias Moon.Design.Modal
  alias Moon.Design.Button

  def render(assigns) do
    ~F"""
    <div>
      <Button on_click="open_modal">Open dialog</Button>
      <Modal id="styled_modal">
        <Modal.Backdrop />
        <Modal.Panel class="lg:max-w-md bg-roshi text-goten rounded-none">
          <span class="absolute top-5 right-5 cursor-pointer">
            <ControlsClose class="text-moon-24" click="close_modal" />
          </span>
          <div class="p-4 pt-11">
            <div class="mt-2">
              <h3 class="text-moon-24 text-goten font-medium text-center">
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

  def handle_event("open_modal", _, socket) do
    Modal.open("styled_modal")
    {:noreply, socket}
  end

  def handle_event("close_modal", _, socket) do
    Modal.close("styled_modal")
    {:noreply, socket}
  end

  def code() do
    """
    alias Moon.Icons.ControlsClose
    alias Moon.Design.Modal
    alias Moon.Design.Button

    def render(assigns) do
      ~F\"""
      <div>
        <Button on_click="open_modal">Open dialog</Button>
        <Modal id="styled_modal">
          <Modal.Backdrop />
          <Modal.Panel class="lg:max-w-md bg-roshi text-goten rounded-none">
            <span class="absolute top-5 right-5 cursor-pointer">
              <ControlsClose class="text-moon-24" click="close_modal" />
            </span>
            <div class="p-4 pt-11">
              <div class="mt-2">
                <h3 class="text-moon-24 text-goten font-medium text-center">
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
      \"""
    end

    def handle_event("open_modal", _, socket) do
      Modal.open("styled_modal")
      {:noreply, socket}
    end

    def handle_event("close_modal", _, socket) do
      Modal.close("styled_modal")
      {:noreply, socket}
    end
    """
  end
end
