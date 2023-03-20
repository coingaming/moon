defmodule MoonWeb.Examples.Design.SwitchExample.CustomBackground do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Switch

  def render(assigns) do
    ~F"""
    <Switch on_bg_color="bg-chichi" off_bg_color="bg-krillin" id="switch_5" />
    <Switch on_bg_color="bg-roshi" off_bg_color="bg-nappa" id="switch_6" />
    """
  end

  def code() do
    """
    alias Moon.Design.Switch

    ...

    <Switch on_bg_color="bg-chichi" off_bg_color="bg-krillin" id="switch_5" />
    <Switch on_bg_color="bg-roshi" off_bg_color="bg-nappa" id="switch_6" />
    """
  end
end
