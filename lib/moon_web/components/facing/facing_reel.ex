defmodule MoonWeb.Components.Facing.FacingReel do
  @moduledoc false

  use MoonWeb, :stateless_component

  slot(default)

  def render(assigns) do
    ~F"""
    <div class="flex flex-row items-start gap-4 md:gap-16 overflow-x-auto reel">
      <#slot />
    </div>
    """
  end
end
