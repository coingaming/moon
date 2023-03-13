defmodule MoonWeb.Examples.Design.AvatarExample.Rounded do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Avatar

  def render(assigns) do
    ~F"""
    <Avatar is_rounded />
    <Avatar is_rounded name="md" />
    <Avatar is_rounded image_url="https://picsum.photos/id/547/100" />
    """
  end

  def code() do
    """
    alias Moon.Design.Avatar

    ...

    <Avatar is_rounded />
    <Avatar is_rounded name="md" />
    <Avatar is_rounded image_url="https://picsum.photos/id/547/100" />
    """
  end
end
