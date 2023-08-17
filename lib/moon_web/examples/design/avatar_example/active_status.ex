defmodule MoonWeb.Examples.Design.AvatarExample.ActiveStatus do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Avatar

  def render(assigns) do
    ~F"""
    <Avatar>
      <Avatar.Status />
    </Avatar>
    <Avatar name="md">
      <Avatar.Status /></Avatar>
    <Avatar image_url="/moon/assets/images/facing/avatar.jpeg">
      <Avatar.Status />
    </Avatar>
    """
  end

  def code() do
    """
    alias Moon.Design.Avatar

    ...

    <Avatar>
      <Avatar.Status />
    </Avatar>
    <Avatar name="md">
      <Avatar.Status /></Avatar>
    <Avatar image_url="/moon/assets/images/facing/avatar.jpeg">
      <Avatar.Status />
    </Avatar>
    """
  end
end
