defmodule MoonWeb.Components.Version do
  @moduledoc false

  use MoonWeb, :stateless_component
  alias Moon.Assets.Logos.LogoMoonDesignShort

  prop version, :string, default: Application.spec(:moon, :vsn)

  def render(assigns) do
    ~F"""
    <div class="flex text-moon-14 text-trunks-100 gap-2">
      <LogoMoonDesignShort height="1.5rem" width="1.5rem" />
      <p>Version <span class="font-semibold">{@version}</span></p>
    </div>
    """
  end
end
