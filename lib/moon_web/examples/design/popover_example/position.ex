defmodule MoonWeb.Examples.Design.PopoverExample.Position do
  @moduledoc false

  use Moon.StatelessComponent

  use MoonWeb, :example

  alias Moon.Design.Popover
  alias Moon.Design.Button

  import MoonWeb.Helpers.Lorem

  prop(placemets, :list,
    default: [
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
    ]
  )

  def render(assigns) do
    ~F"""
    {#for placement <- @placemets}
      <Popover id={"popover-ex-#{placement}"}>
        <Popover.Trigger>
          <Button variant="secondary">{placement}</Button>
        </Popover.Trigger>
        <Popover.Panel position={placement} class="w-[300px]">
          <p class="p-4 text-moon-14">
            I'm a {placement} popover
          </p>
          <p class="p-4 text-moon-14">{lorem()}</p>
        </Popover.Panel>
      </Popover>
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

  def note(), do: "The complete list of all possible positions is in the props table below."
end
