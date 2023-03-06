defmodule MoonWeb.Examples.Design.SwitchExample.Sizes do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Switch

  def render(assigns) do
    ~F"""
    <Switch size="2xs" />
    <Switch size="xs" />
    <Switch />
    """
  end

  def code() do
    """
    alias Moon.Design.Switch

    ...


    """
  end
end
