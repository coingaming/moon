defmodule MoonWeb.Components.MainPage.FacingReel do
  @moduledoc false

  use MoonWeb, :stateless_component

  slot default

  def render(assigns) do
    ~F"""
      <div className="flex flex-row items-start gap-16 overflow-x-auto reel">
        <#slot/>
      </div>
    """
  end
end
