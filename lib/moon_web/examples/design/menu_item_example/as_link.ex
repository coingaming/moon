defmodule MoonWeb.Examples.Design.MenuItemExample.AsLink do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.MenuItem

  def render(assigns) do
    ~F"""
    <MenuItem as="a">Menu item text</MenuItem>
    """
  end

  def code() do
    """
    alias Moon.Design.MenuItem

    ...

    <MenuItem as="a">Menu item text</MenuItem>
    """
  end
end
