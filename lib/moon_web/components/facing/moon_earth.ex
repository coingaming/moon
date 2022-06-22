defmodule MoonWeb.Components.Facing.MoonEarth do
  @moduledoc false

  use MoonWeb, :stateless_component

  def render(assigns) do
    ~F"""
    <div>
      <div class="origin-bottom-left fixed z-20 w-3/12 scale-50 top-[-5px] right-[-210px]">
        <img src="/moon/assets/images/facing/earth.png" alt="Earth">
      </div>

      <div class="origin-bottom-left fixed z-10 w-11/12 scale-50 top-[-510px] right-[-1300px]">
        <img src="/moon/assets/images/facing/moon.png" alt="Moon">
      </div>
    </div>
    """
  end
end
