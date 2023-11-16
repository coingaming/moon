defmodule MoonWeb.Examples.Design.BottomSheetExample.Customization do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Design.Button
  alias Moon.Design.BottomSheet

  def render(assigns) do
    ~F"""
    <div>
      <Button variant="outline" on_click="set_open">
        Customized Bottom Sheet
      </Button>
      <BottomSheet id="customized_bottom_sheet">
        <BottomSheet.Panel class="bg-raditz pt-1 px-4 pb-4">
          <BottomSheet.Header class="bg-transparent min-h-[10px]">
            <BottomSheet.DragHandle class="bg-piccolo" />
          </BottomSheet.Header>
          <div class="flex grow items-center justify-center bg-jiren text-piccolo mt-1">
            Bottom Sheet content
          </div>
        </BottomSheet.Panel>
        <BottomSheet.Backdrop />
      </BottomSheet>
    </div>
    """
  end

  def handle_event("set_open", _, socket) do
    BottomSheet.open("customized_bottom_sheet")
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
          Customized Bottom Sheet
        </Button>
        <BottomSheet id="customized_bottom_sheet">
          <BottomSheet.Panel class="bg-raditz pt-1 px-4 pb-4">
            <BottomSheet.Header class="bg-transparent min-h-[10px]">
              <BottomSheet.DragHandle class="bg-piccolo" />
            </BottomSheet.Header>
            <div class="flex grow items-center justify-center bg-jiren text-piccolo mt-1">
              Bottom Sheet content
            </div>
          </BottomSheet.Panel>
          <BottomSheet.Backdrop />
        </BottomSheet>
      </div>
      \"""
    end

    def handle_event("set_open", _, socket) do
      BottomSheet.open("customized_bottom_sheet")
      {:noreply, socket}
    end
    """
  end
end
