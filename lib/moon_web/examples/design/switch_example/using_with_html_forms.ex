defmodule MoonWeb.Examples.Design.SwitchExample.UsingWithHTMLForms do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Switch

  def render(assigns) do
    ~F"""
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
