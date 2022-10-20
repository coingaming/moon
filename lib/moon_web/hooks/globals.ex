defmodule MoonWeb.Hooks.Globals do
  @moduledoc """
  Setting globals - site-wide params for (almost) all LiveViews
  """
  import Phoenix.LiveView, only: [assign: 2]

  def on_mount(:default, params, _session, socket) do
    {:cont,
     socket
     |> assign(
       theme_name: params["theme_name"] || "moon-design-light",
       direction: params["direction"] || "ltr",
       active_page: socket.view
     )}
  end
end
