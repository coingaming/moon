defmodule MoonWeb.Examples.Design.PopoverExample.TriggerElements do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Design.MenuItem

  def render(assigns) do
    ~F"""
    <div>
      <MenuItem>Tournaments</MenuItem>
      <MenuItem>Promotions</MenuItem>
      <MenuItem>Providers</MenuItem>
    </div>
    """
  end
end
