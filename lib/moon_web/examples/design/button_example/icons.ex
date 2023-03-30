defmodule MoonWeb.Examples.Design.ButtonExample.Icons do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Button

  def render(assigns) do
    ~F"""
    <Button left_icon="generic_settings">Icon Left</Button>
    <Button right_icon="generic_settings">Icon Right</Button>
    """
  end

  def code() do
    """
    alias Moon.Design.Button

    ...

    <Button left_icon="generic_settings">Icon Left</Button>
    <Button right_icon="generic_settings">Icon Right</Button>
    """
  end
end
