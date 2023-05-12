defmodule MoonWeb.Examples.Design.BottomSheetExample.Responsive do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Design.Button
  alias Moon.Design.BottomSheet

  def render(assigns) do
    ~F"""
    <div>
      <Button on_click="set_open">
        Modal
      </Button>
      <BottomSheet id="modal_bottom_sheet" class="lg:hidden lg:flex lg:items-center lg:justify-center">
        <BottomSheet.Backdrop />
        <BottomSheet.Panel class="lg:max-w-sm lg:inline-block lg:rounded-xl lg:align-middle lg:shadow-moon-lg lg:bottom-auto">
          <BottomSheet.Header class="border-b-2 border-beerus">
            <BottomSheet.DragHandle class="lg:hidden" />
            <h3 class="text-moon-18 text-bulma font-medium">Do you think I'm Modal?</h3>
          </BottomSheet.Header>
          <p class="p-4 text-trunks">
            Well, i'm a BottomSheet that looks like Modal on large screens ( > 1024px).
            So, just size down your window and see how i look like.
          </p>
          <div class="p-4">
            <Button size="lg" full_width on_click="set_close">
              Got it!
            </Button>
          </div>
        </BottomSheet.Panel>
      </BottomSheet>
    </div>
    """
  end

  def handle_event("set_open", _, socket) do
    BottomSheet.open("modal_bottom_sheet")
    {:noreply, socket}
  end

  def handle_event("set_close", _, socket) do
    BottomSheet.close("modal_bottom_sheet")
    {:noreply, socket}
  end

  def code() do
    """
    alias Moon.Design.Button
    alias Moon.Design.BottomSheet

    def render(assigns) do
      ~F\"""
      <div>
        <Button on_click="set_open">
          Modal
        </Button>
        <BottomSheet id="modal_bottom_sheet" class="lg:hidden lg:flex lg:items-center lg:justify-center">
          <BottomSheet.Backdrop />
          <BottomSheet.Panel class="lg:max-w-sm lg:inline-block lg:rounded-xl lg:align-middle lg:shadow-moon-lg lg:bottom-auto">
            <BottomSheet.Header class="border-b-2 border-beerus">
              <BottomSheet.DragHandle class="lg:hidden"/>
              <h3 class="text-moon-18 text-bulma font-medium">Do you think I'm Modal?</h3>
            </BottomSheet.Header>
            <p class="p-4 text-trunks">
              Well, i'm a BottomSheet that looks like Modal on large screens ( > 1024px).
              So, just size down your window and see how i look like.
            </p>
            <div class="p-4">
              <Button size="lg" full_width on_click="set_close">
                Got it!
              </Button>
            </div>
          </BottomSheet.Panel>
        </BottomSheet>
      </div>
      \"""
    end

    def handle_event("set_open", _, socket) do
      BottomSheet.open("modal_bottom_sheet")
      {:noreply, socket}
    end

    def handle_event("set_close", _, socket) do
      BottomSheet.close("modal_bottom_sheet")
      {:noreply, socket}
    end
    """
  end
end
