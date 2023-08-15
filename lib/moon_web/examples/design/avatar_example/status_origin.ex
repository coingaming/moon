defmodule MoonWeb.Examples.Design.AvatarExample.StatusOrigin do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Icons.GenericUser
  alias Moon.Design.Avatar

  def render(assigns) do
    ~F"""
    <Avatar>
      <GenericUser class="text-moon-24" />
      <Avatar.Status position={vertical: "top", horizontal: "right"} />
    </Avatar>
    <Avatar>
      <GenericUser class="text-moon-24" />
      <Avatar.Status position={vertical: "top", horizontal: "left"} />
    </Avatar>
    <Avatar>
      <GenericUser class="text-moon-24" />
      <Avatar.Status />
    </Avatar>
    <Avatar>
      <GenericUser class="text-moon-24" />
      <Avatar.Status position={vertical: "bottom", horizontal: "left"} />
    </Avatar>
    """
  end

  def code() do
    """
    alias Moon.Icons.GenericUser
    alias Moon.Design.Avatar

    ...

    <Avatar>
      <GenericUser class="text-moon-24" />
      <Avatar.Status position={vertical: "top", horizontal: "right"} />
    </Avatar>
    <Avatar>
      <GenericUser class="text-moon-24" />
      <Avatar.Status position={vertical: "top", horizontal: "left"} />
    </Avatar>
    <Avatar>
      <GenericUser class="text-moon-24" />
      <Avatar.Status />
    </Avatar>
    <Avatar>
      <GenericUser class="text-moon-24" />
      <Avatar.Status position={vertical: "bottom", horizontal: "left"} />
    </Avatar>
    """
  end
end
