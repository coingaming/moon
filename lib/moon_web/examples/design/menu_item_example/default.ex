defmodule MoonWeb.Examples.Design.MenuItemExample.Default do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.MenuItem

  def render(assigns) do
    ~F"""
    <MenuItem>Menu item text</MenuItem>
    """
  end

  def code() do
    """
    alias Moon.Design.MenuItem

    ...

    <MenuItem>Menu item text</MenuItem>
    """
  end
end
