defmodule MoonWeb.Hooks.SetIsMobile do
  import Phoenix.Component

  def on_mount(:default, _params, _session, socket) do
    socket = assign(socket, is_mobile: false)
    {:cont, Surface.Components.Context.put(socket, is_mobile: false)}
  end
end
