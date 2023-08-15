defmodule MoonWeb.Examples.Design.AvatarExample.Customization do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Icons.GenericUser
  alias Moon.Design.Avatar

  def render(assigns) do
    ~F"""
    <Avatar class="text-chichi">
      <GenericUser class="text-moon-24" />
    </Avatar>
    <Avatar class="bg-piccolo text-goten">
      <GenericUser class="text-moon-24" />
    </Avatar>
    <Avatar class="rounded-full rounded-moon-i-xx">
      <GenericUser class="text-moon-24" />
    </Avatar>
    <Avatar>
      <GenericUser class="text-moon-24" />
      <Avatar.Status class="bg-chichi" />
    </Avatar>
    <Avatar>
      <GenericUser class="text-moon-24" />
      <Avatar.Status class="border-chichi" />
    </Avatar>
    """
  end

  def code() do
    """
    alias Moon.Icons.GenericUser
    alias Moon.Design.Avatar

    ...

    <Avatar class="text-chichi">
      <GenericUser class="text-moon-24" />
    </Avatar>
    <Avatar class="bg-piccolo text-goten">
      <GenericUser class="text-moon-24" />
    </Avatar>
    <Avatar class="rounded-full rounded-moon-i-xx">
      <GenericUser class="text-moon-24" />
    </Avatar>
    <Avatar>
      <GenericUser class="text-moon-24" />
      <Avatar.Status class="bg-chichi" />
    </Avatar>
    <Avatar>
      <GenericUser class="text-moon-24" />
      <Avatar.Status class="border-chichi" />
    </Avatar>
    """
  end
end
