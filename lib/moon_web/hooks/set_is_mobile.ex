defmodule MoonWeb.Hooks.SetIsMobile do
  import Phoenix.Component

  def on_mount(:default, _params, session, socket) do
    is_mobile = session["is_mobile"]
    socket = assign(socket, is_mobile: is_mobile)
    {:cont, Surface.Components.Context.put(socket, is_mobile: is_mobile)}
  end
end
