defmodule MoonWeb.Examples.Design.SwitchExample.Default do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Form.Switch

  def render(assigns) do
    ~F"""
    <Switch id="switch_1" />
    """
  end

  def code() do
    """
    alias Moon.Design.Switch

    ...


    """
  end
end
