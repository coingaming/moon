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
      <BottomSheet id="modal_bottom_sheet" class="lg:items-center lg:justify-center">
        <BottomSheet.Backdrop />
        <BottomSheet.Panel class="lg:max-w-sm lg:inline-block lg:rounded-xl lg:align-middle lg:shadow-moon-lg lg:bottom-auto lg:left-1/2 lg:top-1/2 lg:transform lg:-translate-x-1/2 lg:-translate-y-1/2">
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
          My mind is ready
        </Button>
        <BottomSheet id="default_bottom_sheet">
          <BottomSheet.Panel>
            <BottomSheet.Header class="border-b-2 border-beerus">
              <h3 class="text-moon-18 text-bulma font-medium">Do you wear skinny jeans?</h3>
            </BottomSheet.Header>
            <p class="p-4 text-trunks">
              I'm baby vaporware flexitarian scenester lyft activated charcoal
              tacos. Hashtag etsy literally irony yr 3 wolf moon PBR&B cred banjo
              lyft air plant edison bulb. Salvia next level pitchfork
              single-origin coffee adaptogen. Neutra tilde sartorial Brooklyn
              shaman schlitz. Roof party irony tattooed bicycle rights. Ethical
              you probably haven't heard of them literally bespoke PBR&B. Tattooed
              artisan twee, kinfolk kale chips taxidermy austin kitsch
              williamsburg tousled ugh.
            </p>
            <div class="p-4">
              <Button size="lg" full_width on_click="set_close">
                I'm honestly done
              </Button>
            </div>
          </BottomSheet.Panel>
        </BottomSheet>
      </div>
      \"""
    end

    def handle_event("set_open", _, socket) do
      BottomSheet.open("default_bottom_sheet")
      {:noreply, socket}
    end

    def handle_event("set_close", _, socket) do
      BottomSheet.close("default_bottom_sheet")
      {:noreply, socket}
    end
    """
  end
end
