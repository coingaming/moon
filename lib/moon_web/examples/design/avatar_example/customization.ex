defmodule MoonWeb.Examples.Design.AvatarExample.Customization do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Avatar

  def render(assigns) do
    ~F"""
    <Avatar class="text-chichi" />
    <Avatar class="bg-piccolo text-goten" />
    <Avatar class="rounded-full" />
    <Avatar>
      <Avatar.Status class="bg-chichi" />
    </Avatar>
    <Avatar>
      <Avatar.Status class="border-chichi" />
    </Avatar>
    """
  end

  def code() do
    """
    alias Moon.Design.Avatar

    ...

    <Avatar class="text-chichi" />
    <Avatar class="bg-piccolo text-goten" />
    <Avatar class="rounded-full" />
    <Avatar>
      <Avatar.Status class="bg-chichi" />
    </Avatar>
    <Avatar>
      <Avatar.Status class="border-chichi" />
    </Avatar>
    """
  end
end
