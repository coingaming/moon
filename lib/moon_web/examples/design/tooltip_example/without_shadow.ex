defmodule MoonWeb.Examples.Design.TooltipExample.WithoutShadow do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Tooltip
  alias Moon.Design.Button

  def render(assigns) do
    ~F"""
    <Tooltip>
      <Tooltip.Trigger>
        <Button>Hover Me</Button>
      </Tooltip.Trigger>
      <Tooltip.Content position="top-center" has_no_shadow>
        <Tooltip.Arrow />
        I'm a tooltip without shadow
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
        <Button>Hover Me</Button>
      </Tooltip.Trigger>
      <Tooltip.Content position="top-center" has_no_shadow>
        <Tooltip.Arrow />
        I'm a tooltip without shadow
      </Tooltip.Content>
    </Tooltip>
    """
  end
end
