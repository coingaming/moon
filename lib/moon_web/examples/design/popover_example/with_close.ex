defmodule MoonWeb.Examples.Design.PopoverExample.WithClose do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Design.Popover
  alias Moon.Design.Button
  alias Moon.Design.MenuItem
  alias Moon.Components.Lego

  alias Moon.Icons.{
    GenericTrophy,
    MediaTuner,
    MediaMegaphone
  }

  def render(assigns) do
    ~F"""
    <div>
      <Popover id="popover_id_8">
        <Popover.Trigger>
          <Button>Toggle Popover</Button>
        </Popover.Trigger>
        <Popover.Panel class="!w-96">
          <div class="p-6 flex flex-col gap-6">
            <MenuItem>
              <span class="flex w-11 h-11 bg-gohan items-center justify-center rounded-lg">
                <GenericTrophy class="text-bulma text-[1.5rem]" />
              </span>
              <Lego.MultiTitle title="Tournaments">
                Best tournaments with streamers
              </Lego.MultiTitle>
            </MenuItem>
            <MenuItem>
              <span class="flex w-11 h-11 bg-gohan items-center justify-center">
                <MediaMegaphone class="text-bulma text-[1.5rem]" />
              </span>
              <Lego.MultiTitle title="Promotions">
                Your favourite games
              </Lego.MultiTitle>
            </MenuItem>
            <MenuItem>
              <span class="flex w-11 h-11 bg-gohan items-center justify-center">
                <MediaTuner class="text-bulma text-[1.5rem]" />
              </span>
              <Lego.MultiTitle title="Providers">
                Your favourite games
              </Lego.MultiTitle>
            </MenuItem>
            <Button on_click="set_close" testid="close_popover">Close</Button>
          </div>
        </Popover.Panel>
      </Popover>
    </div>
    """
  end

  def handle_event("set_close", _, socket) do
    Popover.close("popover_id_8")
    {:noreply, socket}
  end

  def code() do
    """
    alias Moon.Design.Popover
    alias Moon.Design.Button
    alias Moon.Design.MenuItem
    alias Moon.Components.Lego

    alias Moon.Icons.{
      GenericTrophy,
      MediaTuner,
      MediaMegaphone
    }

    def render(assigns) do
      ~F\\\"""
      <div>
        <Popover id="popover_id_8">
          <Popover.Trigger>
            <Button>Toggle Popover</Button>
          </Popover.Trigger>
          <Popover.Panel class="!w-96">
            <div class="p-6 flex flex-col gap-6">
              <MenuItem>
                <span class="flex w-11 h-11 bg-gohan items-center justify-center rounded-lg">
                  <GenericTrophy class="text-bulma text-[1.5rem]" />
                </span>
                <Lego.MultiTitle title="Tournaments">
                  Best tournaments with streamers
                </Lego.MultiTitle>
              </MenuItem>
              <MenuItem>
                <span class="flex w-11 h-11 bg-gohan items-center justify-center">
                  <MediaMegaphone class="text-bulma text-[1.5rem]" />
                </span>
                <Lego.MultiTitle title="Promotions">
                  Your favourite games
                </Lego.MultiTitle>
              </MenuItem>
              <MenuItem>
                <span class="flex w-11 h-11 bg-gohan items-center justify-center">
                  <MediaTuner class="text-bulma text-[1.5rem]" />
                </span>
                <Lego.MultiTitle title="Providers">
                  Your favourite games
                </Lego.MultiTitle>
              </MenuItem>
              <Button on_click="set_close" testid="close_popover">Close</Button>
            </div>
          </Popover.Panel>
        </Popover>
      </div>
      \\\"""
    end

    def handle_event("set_close", _, socket) do
      Popover.close("popover_id_8")
      {:noreply, socket}
    end
    """
  end
end
