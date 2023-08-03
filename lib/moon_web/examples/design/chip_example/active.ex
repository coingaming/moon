defmodule MoonWeb.Examples.Design.ChipExample.Active do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Chip

  def render(assigns) do
    ~F"""
    <Chip is_active size="sm" testid="active">Active</Chip>
    <Chip is_active is_stroke testid="active_stroke">Active</Chip>
    """
  end

  def code() do
    """
    alias Moon.Design.Chip

    ...

    <Chip is_active size="sm">Active</Chip>
    <Chip is_active is_stroke>Active</Chip>
    """
  end
end
