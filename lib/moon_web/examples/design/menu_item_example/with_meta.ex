defmodule MoonWeb.Examples.Design.MenuItemExample.WithMeta do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.MenuItem
  alias Moon.Components.Lego

  alias Moon.Icons.ControlsChevronRight

  def render(assigns) do
    ~F"""
    <div class="w-56">
      <MenuItem>
        <Lego.Title>Your value</Lego.Title>
        <span class="text-moon-12 text-trunks">Meta</span>
      </MenuItem>
    </div>
    <div class="w-56">
      <MenuItem>
        <ControlsChevronRight class="text-[1.5rem]" />
        <Lego.Title>Your value</Lego.Title>
        <span class="text-moon-12 text-trunks">Meta</span>
      </MenuItem>
    </div>
    """
  end

  def code() do
    """
    alias Moon.Design.MenuItem
    alias Moon.Components.Lego

    alias Moon.Icons.ControlsChevronRight

    ...

    <div class="w-56">
      <MenuItem>
        <Lego.Title>Your value</Lego.Title>
        <span class="text-moon-12 text-trunks">Meta</span>
      </MenuItem>
    </div>
    <div class="w-56">
      <MenuItem>
        <ControlsChevronRight class="text-[1.5rem]" />
        <Lego.Title>Your value</Lego.Title>
        <span class="text-moon-12 text-trunks">Meta</span>
      </MenuItem>
    </div>
    """
  end
end
