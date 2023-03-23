defmodule MoonWeb.Examples.Design.SwitchExample.Disabled do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Switch

  def render(assigns) do
    ~F"""
    <Switch disabled id="switch_2" />
    <Switch disabled checked id="switch_3" />
    """
  end

  def code() do
    """
    alias Moon.Design.Switch

    ...

    <Switch disabled id="switch_2" />
    <Switch disabled checked id="switch_3" />
    """
  end
end
