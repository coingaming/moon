defmodule MoonWeb.Components.Version do
  @moduledoc false

  use MoonWeb, :stateless_component
  alias Moon.Assets.Logos.LogoMoonDesignShort

  def render(assigns) do
    ~F"""
    <div class="flex text-moon-14 text-trunks bg-goku gap-2 lg:fixed lg:bottom-0 ltr:lg:left-0 rtl:lg:right-0 lg:w-80 lg:py-6 lg:px-8">
      <LogoMoonDesignShort height="1.5rem" width="1.5rem" />
      <p>Version <span class="font-semibold">{version()}</span></p>
    </div>
    """
  end

  defp version(), do: Application.spec(:moon, :vsn)
end
