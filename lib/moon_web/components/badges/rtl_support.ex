defmodule MoonWeb.Components.Badges.RTLSupport do
  @moduledoc false

  use MoonWeb, :stateless_component

  alias Moon.Design.Tag

  def render(assigns) do
    ~F"""
    <Tag size="2xs" class="text-goten bg-whis tracking-[1px]">RTL</Tag>
    """
  end
end
