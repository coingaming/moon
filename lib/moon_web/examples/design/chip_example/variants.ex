defmodule MoonWeb.Examples.Design.ChipExample.Variants do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Chip

  def render(assigns) do
    ~F"""
    <Chip variant="ghost">Ghost variant</Chip>
    <Chip>Default variant</Chip>
    """
  end

  def code() do
    """
    alias Moon.Design.Chip

    ...

    <Chip variant="ghost">Ghost variant</Chip>
    <Chip>Default variant</Chip>
    """
  end
end
