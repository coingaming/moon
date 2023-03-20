defmodule MoonWeb.Examples.Design.SwitchExample.CodeExampleForFullCustomization do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Design.Switch

  prop(is_switched, :boolean, default: false)

  def render(assigns) do
    ~F"""
    <div>
      <Switch
        id="switch_15"
        on_change="toggle_switch"
        class={
          "block relative isolate cursor-pointer rounded-full transition focus:outline-none w-[3.75rem] h-8 p-1",
          "bg-piccolo",
          "bg-beerus": @is_switched == true
        }
        switcher_class={
          "-translate-y-1/2 absolute bg-goten h-6 pointer-events-none rounded-full shadow-moon-sm top-1/2 transition-all w-6 z-5",
          "w-6 h-6 ltr:left-[calc(100%-24px)] rtl:right-[calc(100%-24px)]",
          "ltr:left-0 rtl:right-0": @is_switched == true
        }
      />
    </div>
    """
  end

  def handle_event("toggle_switch", _params, socket) do
    {:noreply, assign(socket, is_switched: !socket.assigns.is_switched)}
  end

  def code() do
    """
    alias Moon.Design.Switch

    prop(is_switched, :boolean, default: false)

    ...

    <div>
      <Switch
        id="switch_15"
        on_change="toggle_switch"
        class={
          "block relative isolate cursor-pointer rounded-full transition focus:outline-none w-[3.75rem] h-8 p-1",
          "bg-piccolo",
          "bg-beerus": @is_switched == true
        }
        switcher_class={
          "-translate-y-1/2 absolute bg-goten h-6 pointer-events-none rounded-full shadow-moon-sm top-1/2 transition-all w-6 z-5",
          "w-6 h-6 ltr:left-[calc(100%-24px)] rtl:right-[calc(100%-24px)]",
          "ltr:left-0 rtl:right-0": @is_switched == true
        }
      />
    </div>

    ...

    def handle_event("toggle_switch", _params, socket) do
      {:noreply, assign(socket, is_switched: !socket.assigns.is_switched)}
    end
    """
  end
end
