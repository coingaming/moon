defmodule MoonWeb.Examples.Design.TooltipExample.Default do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Tooltip
  alias Moon.Design.Button

  def render(assigns) do
    ~F"""
    <Tooltip>
      <Tooltip.Trigger>
        <Button variant="primary">Hover Me</Button>
      </Tooltip.Trigger>
      <Tooltip.Content>
        I'm a tooltip content
        <Tooltip.Arrow />
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
        <Button variant="primary">Hover Me</Button>
      </Tooltip.Trigger>
      <Tooltip.Content>
        I'm a tooltip content
        <Tooltip.Arrow />
      </Tooltip.Content>
    </Tooltip>
    """
  end
end
