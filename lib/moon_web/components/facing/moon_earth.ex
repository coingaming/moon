defmodule MoonWeb.Components.Facing.MoonEarth do
  @moduledoc false

  use MoonWeb, :stateless_component

  def render(assigns) do
    ~F"""
    <div>
      <div class="origin-top-left fixed z-10 w-5/12 scale-[0.3] top-[300px] -right-[500px]">
        <img src="/moon/assets/images/facing/earth.webp" alt="Earth" height="1414" width="1400">
      </div>

      <div class="origin-top-left fixed w-5/12 top-[250px] -right-[500px]">
        <img src="/moon/assets/images/facing/moon.webp" alt="Moon" height="1356" width="1356">
      </div>
    </div>
    """
  end
end
