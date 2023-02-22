defmodule MoonWeb.Examples.Design.ChipExample.Sizes do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Chip

  def render(assigns) do
    ~F"""
    <Chip size="sm">Small</Chip>
    <Chip>Medium is default</Chip>
    """
  end

  def code() do
    """
    alias Moon.Design.Chip

    ...

    <Chip size="sm">Small</Chip>
    <Chip>Medium is default</Chip>
    """
  end
end
