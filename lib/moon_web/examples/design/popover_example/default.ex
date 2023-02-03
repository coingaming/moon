defmodule MoonWeb.Examples.Design.PopoverExample.Default do
  @moduledoc false

  use Moon.StatelessComponent

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
    <Popover id="popover_id_1">
      <Popover.Trigger>
        <Button>Toggle Popover</Button>
      </Popover.Trigger>
      <Popover.Panel>
        <div class="p-6 flex flex-col gap-6">
          <MenuItem>
            <span class="flex w-11 h-11 bg-goku items-center justify-center rounded-lg">
              <GenericTrophy class="text-bulma text-[1.5rem]" />
            </span>
            <Lego.MultiTitle title="Tournaments">
              Best tournaments with streamers
            </Lego.MultiTitle>
          </MenuItem>
          <MenuItem>
            <span class="flex w-11 h-11 bg-goku items-center justify-center">
              <MediaMegaphone class="text-bulma text-[1.5rem]" />
            </span>
            <Lego.MultiTitle title="Promotions">
              Your favourite games
            </Lego.MultiTitle>
          </MenuItem>
          <MenuItem>
            <span class="flex w-11 h-11 bg-goku items-center justify-center">
              <MediaTuner class="text-bulma text-[1.5rem]" />
            </span>
            <Lego.MultiTitle title="Providers">
              Your favourite games
            </Lego.MultiTitle>
          </MenuItem>
        </div>
      </Popover.Panel>
    </Popover>
    """
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

    ...

    <Popover id="popover_id_1">
      <Popover.Trigger>
        <Button>Toggle Popover</Button>
      </Popover.Trigger>
      <Popover.Panel>
        <div class="p-6 flex flex-col gap-6">
          <MenuItem>
            <span class="flex w-11 h-11 bg-goku items-center justify-center rounded-lg">
              <GenericTrophy class="text-bulma text-[1.5rem]" />
            </span>
            <Lego.MultiTitle title="Tournaments">
              Best tournaments with streamers
            </Lego.MultiTitle>
          </MenuItem>
          <MenuItem>
            <span class="flex w-11 h-11 bg-goku items-center justify-center">
              <MediaMegaphone class="text-bulma text-[1.5rem]" />
            </span>
            <Lego.MultiTitle title="Promotions">
              Your favourite games
            </Lego.MultiTitle>
          </MenuItem>
          <MenuItem>
            <span class="flex w-11 h-11 bg-goku items-center justify-center">
              <MediaTuner class="text-bulma text-[1.5rem]" />
            </span>
            <Lego.MultiTitle title="Providers">
              Your favourite games
            </Lego.MultiTitle>
          </MenuItem>
        </div>
      </Popover.Panel>
    </Popover>
    """
  end
end
