defmodule MoonWeb.Examples.Design.ChipExample.Default do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Chip

  def render(assigns) do
    ~F"""
    <Chip>Default</Chip>
    """
  end

  def code() do
    """
    alias Moon.Design.Chip

    ...

    <Chip>Default</Chip>
    """
  end
end
