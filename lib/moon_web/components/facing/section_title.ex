defmodule MoonWeb.Components.Facing.SectionTitle do
  @moduledoc false

  use MoonWeb, :stateless_component

  def render(assigns) do
    ~F"""
      <div className="flex flex-row items-start gap-16 overflow-x-auto reel">
        <#slot/>
      </div>
    """
  end
end
