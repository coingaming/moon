defmodule MoonWeb.Examples.Design.AvatarExample.StatusOrigin do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Avatar

  def render(assigns) do
    ~F"""
    <Avatar />
    <Avatar />
    <Avatar />
    <Avatar />
    """
  end

  def code() do
    """
    alias Moon.Design.Avatar

    ...


    """
  end
end
