defmodule MoonWeb.Examples.Design.ChipExample.IsStroke do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Chip

  def render(assigns) do
    ~F"""
    <Chip is_stroke size="sm">
      Stroke on hover
    </Chip>
    <Chip is_stroke>Stroke on hover</Chip>
    """
  end

  def code() do
    """
    alias Moon.Design.Chip

    ...

    Chip is_stroke size="sm">
      Stroke on hover
    </Chip>
    <Chip is_stroke>Stroke on hover</Chip>
    """
  end
end
