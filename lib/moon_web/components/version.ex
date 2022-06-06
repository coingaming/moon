defmodule MoonWeb.Components.Version do
  @moduledoc false

  use MoonWeb, :stateless_component
  alias Moon.Assets.Logos.LogoMoonDesignShort

  def render(assigns) do
    ~F"""
    <div class="flex mt-10 text-trunks-100 gap-2 px-3">
      <LogoMoonDesignShort font_size="1.5rem" />
      <p>Version <span className="font-medium">2.4.3</span></p>
    </div>
    """
  end
end
