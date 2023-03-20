defmodule MoonWeb.Examples.Design.AvatarExample.CustomColours do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Avatar

  def render(assigns) do
    ~F"""
    <Avatar />
    <Avatar color="text-goten" bg_color="bg-piccolo" />
    <Avatar color="text-goten" bg_color="bg-chichi" />
    """
  end

  def code() do
    """
    alias Moon.Design.Avatar

    ...

    <Avatar />
    <Avatar color="text-goten" bg_color="bg-piccolo" />
    <Avatar color="text-goten" bg_color="bg-chichi" />
    """
  end
end
