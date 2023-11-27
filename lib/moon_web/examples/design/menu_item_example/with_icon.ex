defmodule MoonWeb.Examples.Design.MenuItemExample.WithIcon do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.MenuItem
  alias Moon.Lego

  alias Moon.Icons.SportBadminton

  def render(assigns) do
    ~F"""
    <div class="w-56">
      <MenuItem>
        <SportBadminton class="text-[1.5rem]" />
        <Lego.Title>Your value</Lego.Title>
      </MenuItem>
    </div>
    <div class="w-56">
      <MenuItem>
        <Lego.Title>Your value</Lego.Title>
        <SportBadminton class="text-[1.5rem]" />
      </MenuItem>
    </div>
    """
  end

  def code() do
    """
    alias Moon.Design.MenuItem
    alias Moon.Lego

    alias Moon.Icons.SportBadminton

    ...

    <div class="w-56">
      <MenuItem>
        <SportBadminton class="text-[1.5rem]" />
        <Lego.Title>Your value</Lego.Title>
      </MenuItem>
    </div>
    <div class="w-56">
      <MenuItem>
        <Lego.Title>Your value</Lego.Title>
        <SportBadminton class="text-[1.5rem]" />
      </MenuItem>
    </div>
    """
  end
end
