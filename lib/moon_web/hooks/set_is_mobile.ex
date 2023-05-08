defmodule MoonWeb.Hooks.SetIsMobile do
  @moduledoc """
  depends on MoonWeb.Plugs.SetIsMobile
  """
  import Phoenix.Component

  def on_mount(:default, _params, session, socket) do
    is_mobile = session["is_mobile"]
    socket = assign(socket, is_mobile: is_mobile)
    {:cont, Surface.Components.Context.put(socket, is_mobile: is_mobile)}
  end
end
