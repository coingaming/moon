defmodule MoonWeb.Components.Facing.MoonEarth do
  @moduledoc false

  use MoonWeb, :stateless_component

  def render(assigns) do
    ~F"""
    <div>
      <div class="origin-top-left fixed z-1 w-5/12 scale-[0.3] top-[300px] -right-[500px]">
        <img src="/moon/assets/images/facing/earth.png" alt="Earth">
      </div>

      <div class="origin-top-left fixed w-5/12 top-[250px] -right-[500px]">
        <img src="/moon/assets/images/facing/moon.webp" alt="Moon">
      </div>
    </div>
    """
  end
end
