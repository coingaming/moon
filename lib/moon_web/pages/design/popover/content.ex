defmodule MoonWeb.Pages.Design.Popover.Content.Default do
  @moduledoc false

  use MoonWeb, :live_view

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

defmodule MoonWeb.Pages.Design.Popover.Content.Position do
  @moduledoc false

  use MoonWeb, :live_view

  def render(assigns) do
    ~F"""
    <div>
      <p class="p-4 text-moon-14">
        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
        tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
        consequat.
      </p>
    </div>
    """
  end
end

defmodule MoonWeb.Pages.Design.Popover.Content.TriggerElements do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Design.MenuItem

  def render(assigns) do
    ~F"""
    <div>
      <MenuItem>Tournaments</MenuItem>
      <MenuItem>Promotions</MenuItem>
      <MenuItem>Providers</MenuItem>
    </div>
    """
  end
end

defmodule MoonWeb.Pages.Design.Popover.Content.WithClose do
  @moduledoc false

  use MoonWeb, :live_view

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
      <Button>Close</Button>
    </div>
    """
  end
end
