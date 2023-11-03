defmodule MoonWeb.Components.Badges.Deprecated do
  @moduledoc false

  use MoonWeb, :stateless_component

  alias Moon.Design.Tag

  def render(assigns) do
    ~F"""
    <Tag size="2xs" class="text-popo bg-chichi-60 tracking-[1px]">Deprecated</Tag>
    """
  end
end
