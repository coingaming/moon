defmodule MoonWeb.Examples.Design.PopoverExample.TriggerElements do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Popover
  alias Moon.Design.Button
  alias Moon.Design.Button.IconButton
  alias Moon.Design.MenuItem

  def render(assigns) do
    ~F"""
    <Popover id="popover_id_5">
      <Popover.Trigger>
        <Button>Button</Button>
      </Popover.Trigger>
      <Popover.Panel position="bottom">
        <MenuItem>Tournaments</MenuItem>
        <MenuItem>Promotions</MenuItem>
        <MenuItem>Providers</MenuItem>
      </Popover.Panel>
    </Popover>
    <Popover id="popover_id_6">
      <Popover.Trigger>
        <IconButton icon_only="controls_chevron_down" variant="secondary" />
      </Popover.Trigger>
      <Popover.Panel position="bottom-end">
        <MenuItem>Tournaments</MenuItem>
        <MenuItem>Promotions</MenuItem>
        <MenuItem>Providers</MenuItem>
      </Popover.Panel>
    </Popover>
    <Popover id="popover_id_7">
      <Popover.Trigger>
        <span class="text-moon-14 text-trunks cursor-pointer hover:text-piccolo">
          Open popover
        </span>
      </Popover.Trigger>
      <Popover.Panel position="bottom-start">
        <MenuItem>Tournaments</MenuItem>
        <MenuItem>Promotions</MenuItem>
        <MenuItem>Providers</MenuItem>
      </Popover.Panel>
    </Popover>
    """
  end

  def code() do
    """
    alias Moon.Design.Popover
    alias Moon.Design.Button
    alias Moon.Design.Button.IconButton
    alias Moon.Design.MenuItem

    ...

    <Popover id="popover_id_5">
      <Popover.Trigger>
        <Button>Button</Button>
      </Popover.Trigger>
      <Popover.Panel position="bottom">
        <MenuItem>Tournaments</MenuItem>
        <MenuItem>Promotions</MenuItem>
        <MenuItem>Providers</MenuItem>
      </Popover.Panel>
    </Popover>
    <Popover id="popover_id_6">
      <Popover.Trigger>
        <IconButton icon_only="controls_chevron_down" variant="secondary" />
      </Popover.Trigger>
      <Popover.Panel position="bottom-end">
        <MenuItem>Tournaments</MenuItem>
        <MenuItem>Promotions</MenuItem>
        <MenuItem>Providers</MenuItem>
      </Popover.Panel>
    </Popover>
    <Popover id="popover_id_7">
      <Popover.Trigger>
        <span class="text-moon-14 text-trunks cursor-pointer hover:text-piccolo">
          Open popover
        </span>
      </Popover.Trigger>
      <Popover.Panel position="bottom-start">
        <MenuItem>Tournaments</MenuItem>
        <MenuItem>Promotions</MenuItem>
        <MenuItem>Providers</MenuItem>
      </Popover.Panel>
    </Popover>
    """
  end
end
