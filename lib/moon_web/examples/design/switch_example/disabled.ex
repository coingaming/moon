defmodule MoonWeb.Examples.Design.SwitchExample.Disabled do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Switch

  def render(assigns) do
    ~F"""
    <Switch disabled />
    <Switch disabled is_switched />
    """
  end

  def code() do
    """
    alias Moon.Design.Switch

    ...


    """
  end
end
