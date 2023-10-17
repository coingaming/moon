defmodule MoonWeb.Examples.Design.BottomSheetExample.Default do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Design.Button
  alias Moon.Design.BottomSheet

  def render(assigns) do
    ~F"""
    <div>
      <Button variant="outline" on_click="set_open">
        Default Bottom Sheet
      </Button>
      <BottomSheet id="default_bottom_sheet">
        <BottomSheet.Panel>
          <div class="flex grow items-center justify-center bg-jiren text-piccolo">
            Bottom Sheet content
          </div>
        </BottomSheet.Panel>
        <BottomSheet.Backdrop />
      </BottomSheet>
    </div>
    """
  end

  def handle_event("set_open", _, socket) do
    BottomSheet.open("default_bottom_sheet")
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
          Default Bottom Sheet
        </Button>
        <BottomSheet id="default_bottom_sheet">
          <BottomSheet.Panel>
            <div class="flex grow items-center justify-center bg-jiren text-piccolo">
              Bottom Sheet content
            </div>
          </BottomSheet.Panel>
          <BottomSheet.Backdrop />
        </BottomSheet>
      </div>
      \"""
    end

    def handle_event("set_open", _, socket) do
      BottomSheet.open("default_bottom_sheet")
      {:noreply, socket}
    end
    """
  end
end
