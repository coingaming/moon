defmodule MoonWeb.Examples.Design.PopoverExample.Default do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Design.MenuItem
  alias Moon.Components.Lego

  alias Moon.Icons.{
    GenericTrophy,
    MediaTuner,
    MediaMegaphone
  }

  def render(assigns) do
    ~F"""
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
    """
  end
end
