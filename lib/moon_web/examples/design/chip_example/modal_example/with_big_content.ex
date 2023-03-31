defmodule MoonWeb.Examples.Design.ModalExample.ExampleWithBigContent do
  @moduledoc false

  use Moon.StatefulComponent

  use MoonWeb, :example

  alias Moon.Design.Modal
  alias Moon.Design.Button

  import MoonWeb.Helpers.Lorem

  def render(assigns) do
    ~F"""
    <div>
      <Button on_click="open_modal">Open dialog</Button>
      <Modal id="big_content_modal">
        <Modal.Backdrop />
        <Modal.Panel>
          <div class="p-4 border-b-2 border-beerus">
            <h3 class="text-moon-18 text-bulma font-medium">
              Payment successful
            </h3>
          </div>
          <div class="p-4">
            <p class="text-moon-16 text-trunks">
              {lorem_big_content()}
            </p>
          </div>
          <div class="p-4 border-t-2 border-beerus">
            <Button on_click="close_modal">Got it, thanks!</Button>
          </div>
        </Modal.Panel>
      </Modal>
    </div>
    """
  end

  def handle_event("open_modal", _, socket) do
    Modal.open("big_content_modal")
    {:noreply, socket}
  end

  def handle_event("close_modal", _, socket) do
    Modal.close("big_content_modal")
    {:noreply, socket}
  end

  def code() do
    """
    alias Moon.Design.Modal
    alias Moon.Design.Button

    import MoonWeb.Helpers.Lorem

    def render(assigns) do
    ~F\"""
    <div>
      <Button on_click="open_modal">Open dialog</Button>
      <Modal id="big_content_modal">
        <Modal.Backdrop />
        <Modal.Panel>
          <div class="p-4 border-b-2 border-beerus">
            <h3 class="text-moon-18 text-bulma font-medium">
              Payment successful
            </h3>
          </div>
          <div class="p-4">
            <p class="text-moon-16 text-trunks">
              {lorem_big_content()}
            </p>
          </div>
          <div class="p-4 border-t-2 border-beerus">
            <Button on_click="close_modal">Got it, thanks!</Button>
          </div>
        </Modal.Panel>
      </Modal>
    </div>
    \"""
    end

    def handle_event("open_modal", _, socket) do
    Modal.open("big_content_modal")
    {:noreply, socket}
    end

    def handle_event("close_modal", _, socket) do
    Modal.close("big_content_modal")
    {:noreply, socket}
    end
    """
  end
end
