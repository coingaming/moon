defmodule MoonWeb.Examples.Design.BottomSheetExample.WithTitle do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Design.Button
  alias Moon.Design.BottomSheet

  def render(assigns) do
    ~F"""
    <div class="flex flex-wrap items-center justify-around gap-2 w-full">
      <div>
        <Button variant="outline" on_click="set_open_title" testid="open_title">
          Bottom Sheet with Title
        </Button>
        <BottomSheet id="title_bottom_sheet">
          <BottomSheet.Panel>
            <BottomSheet.Header>
              <h3 class="text-moon-16 text-bulma font-medium text-center">
                Bottom Sheet title</h3>
            </BottomSheet.Header>
            <div class="flex grow items-center justify-center bg-jiren text-piccolo">
              Bottom Sheet content
            </div>
          </BottomSheet.Panel>
          <BottomSheet.Backdrop />
        </BottomSheet>
      </div>
      <div>
        <Button variant="outline" on_click="set_open" testid="open_title_draghandle">
          Bottom Sheet with Title and Draghandle
        </Button>
        <BottomSheet id="title_draghandle_bottom_sheet">
          <BottomSheet.Panel>
            <BottomSheet.Header>
              <BottomSheet.DragHandle />
              <h3 class="text-moon-16 text-bulma font-medium text-center pt-2">
                Bottom Sheet title</h3>
            </BottomSheet.Header>
            <div class="flex grow items-center justify-center bg-jiren text-piccolo">
              Bottom Sheet content
            </div>
          </BottomSheet.Panel>
          <BottomSheet.Backdrop />
        </BottomSheet>
      </div>
    </div>
    """
  end

  def handle_event("set_open_title", _, socket) do
    BottomSheet.open("title_bottom_sheet")
    {:noreply, socket}
  end

  def handle_event("set_open", _, socket) do
    BottomSheet.open("title_draghandle_bottom_sheet")
    {:noreply, socket}
  end

  def code() do
    """
    alias Moon.Design.Button
    alias Moon.Design.BottomSheet

    def render(assigns) do
      ~F/\"""
      <div class="flex flex-wrap items-center justify-around gap-2 w-full">
        <div>
          <Button variant="outline" on_click="set_open_title">
            Bottom Sheet with Title
          </Button>
          <BottomSheet id="title_bottom_sheet">
            <BottomSheet.Panel>
              <BottomSheet.Header>
                <h3 class="text-moon-16 text-bulma font-medium text-center">
                  Bottom Sheet title</h3>
              </BottomSheet.Header>
              <div class="flex grow items-center justify-center bg-jiren text-piccolo">
                Bottom Sheet content
              </div>
            </BottomSheet.Panel>
            <BottomSheet.Backdrop />
          </BottomSheet>
        </div>
        <div>
          <Button variant="outline" on_click="set_open">
            Bottom Sheet with Title and Draghandle
          </Button>
          <BottomSheet id="title_draghandle_bottom_sheet">
            <BottomSheet.Panel>
              <BottomSheet.Header>
                <BottomSheet.DragHandle />
                <h3 class="text-moon-16 text-bulma font-medium text-center pt-2">
                  Bottom Sheet title</h3>
              </BottomSheet.Header>
              <div class="flex grow items-center justify-center bg-jiren text-piccolo">
                Bottom Sheet content
              </div>
            </BottomSheet.Panel>
            <BottomSheet.Backdrop />
          </BottomSheet>
        </div>
      </div>
      /\"""
    end

    def handle_event("set_open_title", _, socket) do
      BottomSheet.open("title_bottom_sheet")
      {:noreply, socket}
    end

    def handle_event("set_open", _, socket) do
      BottomSheet.open("title_draghandle_bottom_sheet")
      {:noreply, socket}
    end
    """
  end
end
