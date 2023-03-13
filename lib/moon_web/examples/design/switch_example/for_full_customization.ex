defmodule MoonWeb.Examples.Design.SwitchExample.CodeExampleForFullCustomization do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Switch

  def render(assigns) do
    ~F"""
    <Switch
      id="switch_15"
      on_bg_color="bg-piccolo"
      off_bg_color="bg-beerus"
      class="block relative isolate cursor-pointer rounded-full transition focus:outline-none w-[3.75rem] h-8 p-1"
      switcher_class="-translate-y-1/2 absolute bg-goten h-6 pointer-events-none rounded-full shadow-moon-sm top-1/2 transition-all w-6 z-5"
    />
    """
  end

  def code() do
    """
    alias Moon.Design.Switch

    ...

    <Switch
      id="switch_15"
      on_bg_color="bg-piccolo"
      off_bg_color="bg-beerus"
      class="block relative isolate cursor-pointer rounded-full transition focus:outline-none w-[3.75rem] h-8 p-1"
      switcher_class="-translate-y-1/2 absolute bg-goten h-6 pointer-events-none rounded-full shadow-moon-sm top-1/2 transition-all w-6 z-5"
    />
    """
  end
end
