defmodule MoonWeb.Examples.Design.TooltipExample.Customizations do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Tooltip
  alias Moon.Design.Button

  def render(assigns) do
    ~F"""
    <Tooltip>
      <Tooltip.Trigger>
        <Button variant="secondary">Hover Me</Button>
      </Tooltip.Trigger>
      <Tooltip.Content class="bg-chichi/10">
        <Tooltip.Arrow />
        Custom background
      </Tooltip.Content>
    </Tooltip>

    <Tooltip>
      <Tooltip.Trigger>
        <Button variant="secondary">Hover Me</Button>
      </Tooltip.Trigger>
      <Tooltip.Content class="text-moon-18 text-krillin font-medium">
        <Tooltip.Arrow />
        Custom font
      </Tooltip.Content>
    </Tooltip>

    <Tooltip>
      <Tooltip.Trigger>
        <Button variant="secondary">Hover Me</Button>
      </Tooltip.Trigger>
      <Tooltip.Content class="bg-roshi/10 text-piccolo">
        <Tooltip.Arrow />
        Custom font & backgound
      </Tooltip.Content>
    </Tooltip>
    """
  end

  def code() do
    """
    alias Moon.Design.Tooltip
    alias Moon.Design.Button

    ...

    <Tooltip>
      <Tooltip.Trigger>
        <Button variant="secondary">Hover Me</Button>
      </Tooltip.Trigger>
      <Tooltip.Content class="bg-chichi/10">
        <Tooltip.Arrow />
        Custom background
      </Tooltip.Content>
    </Tooltip>

    <Tooltip>
      <Tooltip.Trigger>
        <Button variant="secondary">Hover Me</Button>
      </Tooltip.Trigger>
      <Tooltip.Content class="text-moon-18 text-krillin font-medium">
        <Tooltip.Arrow />
        Custom font
      </Tooltip.Content>
    </Tooltip>

    <Tooltip>
      <Tooltip.Trigger>
        <Button variant="secondary">Hover Me</Button>
      </Tooltip.Trigger>
      <Tooltip.Content class="bg-roshi/10 text-piccolo">
        <Tooltip.Arrow />
        Custom font & backgound
      </Tooltip.Content>
    </Tooltip>
    """
  end
end
