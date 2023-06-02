defmodule MoonWeb.Examples.Design.PopoverExample.Position do
  @moduledoc false

  use Moon.StatelessComponent

  use MoonWeb, :example

  alias Moon.Design.Popover
  alias Moon.Design.Button

  import MoonWeb.Helpers.Lorem
  import Moon.Helpers.Positions

  prop(placemets, :list, default: position_list())

  def render(assigns) do
    ~F"""
    {#for placement <- @placemets}
      <div class="w-1/4 sm:w-1/5 flex justify-center">
        <Popover id={"popover-ex-#{placement}"}>
          <Popover.Trigger>
            <Button variant="secondary">{placement}</Button>
          </Popover.Trigger>
          <Popover.Panel position={placement}>
            <p class="p-4 text-moon-14">
              I'm a {placement} popover
            </p>
            <p class="p-4 text-moon-14">{lorem()}</p>
          </Popover.Panel>
        </Popover>
      </div>
    {/for}
    """
  end

  def code() do
    """
    alias Moon.Design.Popover
    alias Moon.Design.Button

    prop(placemets, :list, default: [
      "top-start",
      "top",
      "top-end",
      "bottom-start",
      "bottom",
      "bottom-end",
      "right-start",
      "right",
      "right-end",
      "left-start",
      "left",
      "left-end"
    ])

    ...

    {#for placement <- @placemets}
      <Popover id={"popover-ex-\#{placement}"}>
        <Popover.Trigger>
          <Button variant="secondary">{placement}</Button>
        </Popover.Trigger>
        <Popover.Panel position={placement} class="w-[300px]">
          <p class="p-4 text-moon-14">
            I'm a {placement} popover
          </p>
          <p class="p-4 text-moon-14">#{lorem()}</p>
        </Popover.Panel>
      </Popover>
    {/for}
    """
  end
end
