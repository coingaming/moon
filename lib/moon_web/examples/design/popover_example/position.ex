defmodule MoonWeb.Examples.Design.PopoverExample.Position do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Design.Popover
  alias Moon.Design.Button

  def render(assigns) do
    ~F"""
    <Popover id="popover_id_2">
      <Popover.Trigger>
        <Button>Top</Button>
      </Popover.Trigger>
      <Popover.Panel>
        <p class="p-4 text-moon-14">
          Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
          tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
          quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
          consequat.
        </p>
      </Popover.Panel>
    </Popover>
    <Popover id="popover_id_3">
      <Popover.Trigger>
        <Button>Right</Button>
      </Popover.Trigger>
      <Popover.Panel position="right">
        <p class="p-4 text-moon-14">
          Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
          tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
          quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
          consequat.
        </p>
      </Popover.Panel>
    </Popover>
    <Popover id="popover_id_4">
      <Popover.Trigger>
        <Button>Left</Button>
      </Popover.Trigger>
      <Popover.Panel position="left">
        <p class="p-4 text-moon-14">
          Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
          tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
          quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
          consequat.
        </p>
      </Popover.Panel>
    </Popover>
    """
  end

  def code() do
    """
    alias Moon.Design.Popover
    alias Moon.Design.Button

    ...

    <Popover id="popover_id_2">
      <Popover.Trigger>
        <Button>Top</Button>
      </Popover.Trigger>
      <Popover.Panel>
        <p class="p-4 text-moon-14">
          Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
          tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
          quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
          consequat.
        </p>
      </Popover.Panel>
    </Popover>
    <Popover id="popover_id_3">
      <Popover.Trigger>
        <Button>Right</Button>
      </Popover.Trigger>
      <Popover.Panel position="right">
        <p class="p-4 text-moon-14">
          Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
          tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
          quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
          consequat.
        </p>
      </Popover.Panel>
    </Popover>
    <Popover id="popover_id_4">
      <Popover.Trigger>
        <Button>Left</Button>
      </Popover.Trigger>
      <Popover.Panel position="left">
        <p class="p-4 text-moon-14">
          Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
          tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
          quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
          consequat.
        </p>
      </Popover.Panel>
    </Popover>
    """
  end
end
