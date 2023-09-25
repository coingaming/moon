defmodule MoonWeb.Examples.Design.BottomSheetExample.Responsive do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Design.Button
  alias Moon.Design.BottomSheet

  def render(assigns) do
    ~F"""
    <div>
      <Button variant="outline" on_click="set_open">
        Modal on large screens
      </Button>
      <BottomSheet id="modal_bottom_sheet" as_modal_on="lg">
        <BottomSheet.Backdrop />
        <BottomSheet.Panel class="px-0">
          <BottomSheet.Header class="border-b-2 border-beerus">
            <BottomSheet.DragHandle />
            <h3 class="text-moon-18 text-bulma font-medium text-center pt-2">Do you think I'm Modal?</h3>
          </BottomSheet.Header>
          <p class="p-4 text-trunks">
            Well, I'm a BottomSheet that looks like Modal on large screens ( > 1024px).
            Try resizing your window to see how I adapt.
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
        <Button variant="outline" on_click="set_open">
          Modal on large screens
        </Button>
        <BottomSheet id="modal_bottom_sheet" as_modal_on="lg">
          <BottomSheet.Backdrop />
          <BottomSheet.Panel class="px-0">
            <BottomSheet.Header class="border-b-2 border-beerus">
              <BottomSheet.DragHandle />
              <h3 class="text-moon-18 text-bulma font-medium text-center pt-2">Do you think I'm Modal?</h3>
            </BottomSheet.Header>
            <p class="p-4 text-trunks">
              Well, I'm a BottomSheet that looks like Modal on large screens ( > 1024px).
              Try resizing your window to see how I adapt.
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
