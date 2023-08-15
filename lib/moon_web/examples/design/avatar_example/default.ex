defmodule MoonWeb.Examples.Design.AvatarExample.Default do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Icons.GenericUser
  alias Moon.Design.Avatar

  def render(assigns) do
    ~F"""
    <Avatar>
      <GenericUser class="text-moon-24" />
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
    </Avatar>
    """
  end
end
