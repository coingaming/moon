defmodule MoonWeb.Examples.Design.SwitchExample.Default do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Switch

  def render(assigns) do
    ~F"""
    <Switch checked id="switch_1" />
    """
  end

  def code() do
    """
    alias Moon.Design.Switch

    ...

    <Switch checked id="switch_1" />
    """
  end
end