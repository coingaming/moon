defmodule MoonWeb.Examples.Design.TooltipExample.Positions do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Tooltip
  alias Moon.Design.Button

  def render(assigns) do
    ~F"""
    {#for placement <- ~w(top-start top-center top-end bottom-start bottom-center bottom-end right left)}
      <Tooltip>
        <Tooltip.Trigger>
          <Button variant="secondary">{placement}</Button>
        </Tooltip.Trigger>
        <Tooltip.Content position={placement}>
          I'm a {placement} tooltip
          <Tooltip.Arrow />
        </Tooltip.Content>
      </Tooltip>
    {/for}
    """
  end

  def code() do
    """
    alias Moon.Design.Tooltip
    alias Moon.Design.Button

    ...

    {#for placement <- ~w(top-start top-center top-end bottom-start bottom-center bottom-end right left)}
      <Tooltip>
        <Tooltip.Trigger>
          <Button variant="secondary">{placement}</Button>
        </Tooltip.Trigger>
        <Tooltip.Content position={placement}>
          I'm a {placement} tooltip
          <Tooltip.Arrow />
        </Tooltip.Content>
      </Tooltip>
    {/for}
    """
  end
end
