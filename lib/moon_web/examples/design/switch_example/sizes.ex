defmodule MoonWeb.Examples.Design.SwitchExample.Sizes do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Form.Switch

  def render(assigns) do
    ~F"""
    <Switch size="2xs" id="switch_8" />
    <Switch size="xs" id="switch_9" />
    <Switch id="switch_10" />
    """
  end

  def code() do
    """
    alias Moon.Design.Form.Switch

    ...

    <Switch size="2xs" id="switch_8" />
    <Switch size="xs" id="switch_9" />
    <Switch id="switch_10" />
    """
  end
end
