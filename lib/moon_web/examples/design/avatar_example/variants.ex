defmodule MoonWeb.Examples.Design.AvatarExample.Variants do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Avatar

  def render(assigns) do
    ~F"""
    <Avatar />
    <Avatar name="md" />
    <Avatar image_url="https://picsum.photos/id/547/100" />
    """
  end

  def code() do
    """
    alias Moon.Design.Avatar

    ...

    <Avatar />
    <Avatar name="md" />
    <Avatar image_url="https://picsum.photos/id/547/100" />
    """
  end
end
