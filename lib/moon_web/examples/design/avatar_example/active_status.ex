defmodule MoonWeb.Examples.Design.AvatarExample.ActiveStatus do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Avatar

  def render(assigns) do
    ~F"""
    <Avatar is_status_active />
    <Avatar name="md" is_status_active />
    <Avatar image_url="https://picsum.photos/id/547/100" is_status_active />
    """
  end

  def code() do
    """
    alias Moon.Design.Avatar

    ...

    <Avatar is_status_active />
    <Avatar name="md" is_status_active />
    <Avatar image_url="https://picsum.photos/id/547/100" is_status_active />
    """
  end
end
