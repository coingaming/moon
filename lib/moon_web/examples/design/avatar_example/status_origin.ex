defmodule MoonWeb.Examples.Design.AvatarExample.StatusOrigin do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Avatar

  def render(assigns) do
    ~F"""
    <Avatar>
      <Avatar.Status position={vertical: "top", horizontal: "right"} />
    </Avatar>
    <Avatar>
      <Avatar.Status position={vertical: "top", horizontal: "left"} />
    </Avatar>
    <Avatar>
      <Avatar.Status />
    </Avatar>
    <Avatar>
      <Avatar.Status position={vertical: "bottom", horizontal: "left"} />
    </Avatar>
    """
  end

  def code() do
    """
    alias Moon.Design.Avatar

    ...

    <Avatar>
      <Avatar.Status position={vertical: "top", horizontal: "right"} />
    </Avatar>
    <Avatar>
      <Avatar.Status position={vertical: "top", horizontal: "left"} />
    </Avatar>
    <Avatar>
      <Avatar.Status />
    </Avatar>
    <Avatar>
      <Avatar.Status position={vertical: "bottom", horizontal: "left"} />
    </Avatar>
    """
  end
end
