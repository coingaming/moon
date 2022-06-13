defmodule MoonWeb.Components.Version do
  @moduledoc false

  use MoonWeb, :stateless_component
  alias Moon.Assets.Logos.LogoMoonDesignShort

  def render(assigns) do
    ~F"""
    <div class="flex text-moon-14 text-trunks-100 gap-2">
      <LogoMoonDesignShort font_size="1.5rem" />
      <p>Version <span className="font-semibold">2.4.3</span></p>
    </div>
    """
  end
end
