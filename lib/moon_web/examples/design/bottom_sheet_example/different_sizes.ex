defmodule MoonWeb.Examples.Design.BottomSheetExample.DifferentSizes do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Design.Button
  alias Moon.Design.BottomSheet

  def render(assigns) do
    ~F"""
    <div class="flex flex-wrap items-center justify-around gap-2 w-full">
      <div>
        <Button variant="outline" on_click="set_open_small" testid="open_small">
          Small Bottom Sheet (default)
        </Button>
        <BottomSheet id="small_bottom_sheet">
          <BottomSheet.Panel class="flex flex-col gap-2 items-center">
            <div class="flex grow items-center justify-center bg-jiren text-piccolo w-full">
              Bottom Sheet content
            </div>
            <Button on_click="set_close_small" testid="close_small">Optional close</Button>
          </BottomSheet.Panel>
          <BottomSheet.Backdrop />
        </BottomSheet>
      </div>
      <div>
        <Button variant="outline" on_click="set_open_medium" testid="open_medium">
          Medium Bottom Sheet
        </Button>
        <BottomSheet id="medium_bottom_sheet">
          <BottomSheet.Panel class="flex flex-col gap-2 items-center h-2/3">
            <div class="flex grow items-center justify-center bg-jiren text-piccolo w-full">
              Bottom Sheet content
            </div>
            <Button on_click="set_close_medium" testid="close_medium">Optional close</Button>
          </BottomSheet.Panel>
          <BottomSheet.Backdrop />
        </BottomSheet>
      </div>
      <div>
        <Button variant="outline" on_click="set_open_full" testid="open_full">
          Fullscreen Bottom Sheet
        </Button>
        <BottomSheet id="fullscreen_bottom_sheet">
          <BottomSheet.Panel class="flex flex-col gap-2 items-center h-full">
            <div class="flex grow items-center justify-center bg-jiren text-piccolo w-full">
              Bottom Sheet content
            </div>
            <Button on_click="set_close_full" testid="close_full">Optional close</Button>
          </BottomSheet.Panel>
          <BottomSheet.Backdrop />
        </BottomSheet>
      </div>
    </div>
    """
  end

  def handle_event("set_open_small", _, socket) do
    BottomSheet.open("small_bottom_sheet")
    {:noreply, socket}
  end

  def handle_event("set_close_small", _, socket) do
    BottomSheet.close("small_bottom_sheet")
    {:noreply, socket}
  end

  def handle_event("set_open_medium", _, socket) do
    BottomSheet.open("medium_bottom_sheet")
    {:noreply, socket}
  end

  def handle_event("set_close_medium", _, socket) do
    BottomSheet.close("medium_bottom_sheet")
    {:noreply, socket}
  end

  def handle_event("set_open_full", _, socket) do
    BottomSheet.open("fullscreen_bottom_sheet")
    {:noreply, socket}
  end

  def handle_event("set_close_full", _, socket) do
    BottomSheet.close("fullscreen_bottom_sheet")
    {:noreply, socket}
  end

  def code() do
    """
    alias Moon.Design.Button
    alias Moon.Design.BottomSheet

    def render(assigns) do
      ~F\"""
      <div class="flex flex-wrap items-center justify-around gap-2 w-full">
        <div>
          <Button variant="outline" on_click="set_open_small">
            Small Bottom Sheet (default)
          </Button>
          <BottomSheet id="small_bottom_sheet">
            <BottomSheet.Panel class="flex flex-col gap-2 items-center">
              <div class="flex grow items-center justify-center bg-jiren text-piccolo w-full">
                Bottom Sheet content
              </div>
              <Button on_click="set_close_small">Optional close</Button>
            </BottomSheet.Panel>
            <BottomSheet.Backdrop />
          </BottomSheet>
        </div>
        <div>
          <Button variant="outline" on_click="set_open_medium">
            Medium Bottom Sheet
          </Button>
          <BottomSheet id="medium_bottom_sheet">
            <BottomSheet.Panel class="flex flex-col gap-2 items-center h-2/3">
              <div class="flex grow items-center justify-center bg-jiren text-piccolo w-full">
                Bottom Sheet content
              </div>
              <Button on_click="set_close_medium">Optional close</Button>
            </BottomSheet.Panel>
            <BottomSheet.Backdrop />
          </BottomSheet>
        </div>
        <div>
          <Button variant="outline" on_click="set_open_full">
            Fullscreen Bottom Sheet
          </Button>
          <BottomSheet id="fullscreen_bottom_sheet">
            <BottomSheet.Panel class="flex flex-col gap-2 items-center h-full">
              <div class="flex grow items-center justify-center bg-jiren text-piccolo w-full">
                Bottom Sheet content
              </div>
              <Button on_click="set_close_full">Optional close</Button>
            </BottomSheet.Panel>
            <BottomSheet.Backdrop />
          </BottomSheet>
        </div>
      </div>
      \"""
    end

    def handle_event("set_open_small", _, socket) do
      BottomSheet.open("small_bottom_sheet")
      {:noreply, socket}
    end

    def handle_event("set_close_small", _, socket) do
      BottomSheet.close("small_bottom_sheet")
      {:noreply, socket}
    end

    def handle_event("set_open_medium", _, socket) do
      BottomSheet.open("medium_bottom_sheet")
      {:noreply, socket}
    end

    def handle_event("set_close_medium", _, socket) do
      BottomSheet.close("medium_bottom_sheet")
      {:noreply, socket}
    end

    def handle_event("set_open_full", _, socket) do
      BottomSheet.open("fullscreen_bottom_sheet")
      {:noreply, socket}
    end

    def handle_event("set_close_full", _, socket) do
      BottomSheet.close("fullscreen_bottom_sheet")
      {:noreply, socket}
    end
    """
  end
end
