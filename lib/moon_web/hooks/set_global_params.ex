defmodule MoonWeb.Hooks.SetGlobalParams do
  @moduledoc """
  Setting globals - site-wide params for (almost) all LiveViews
  """
  import Phoenix.LiveView.Utils, only: [assign: 3]

  def on_mount(:default, params, _session, socket) do
    {:cont,
     socket
     |> assign(:theme_name, params["theme_name"] || "moon-design-light")
     |> assign(:direction, params["direction"] || "ltr")
     |> assign(:active_page, socket.view)
     |> Surface.Components.Context.put(
       theme_name: params["theme_name"] || "moon-design-light",
       direction: params["direction"] || "ltr",
       active_page: socket.view
     )}
  end
end
