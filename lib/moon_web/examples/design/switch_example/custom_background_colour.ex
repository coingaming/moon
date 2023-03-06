defmodule MoonWeb.Examples.Design.SwitchExample.CustomBackground do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Switch

  def render(assigns) do
    ~F"""
    <Switch on_bg_color="bg-chichi" off_bg_color="bg-krillin" />
    <Switch on_bg_color="bg-roshi" off_bg_color="bg-nappa" />
    """
  end

  def code() do
    """
    alias Moon.Design.Switch

    ...


    """
  end
end
