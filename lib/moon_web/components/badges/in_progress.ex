defmodule MoonWeb.Components.Badges.InProgress do
  @moduledoc false

  use MoonWeb, :stateless_component

  alias Moon.Design.Tag

  def render(assigns) do
    ~F"""
    <Tag size="2xs" class="text-popo bg-krillin">In progress</Tag>
    """
  end
end
