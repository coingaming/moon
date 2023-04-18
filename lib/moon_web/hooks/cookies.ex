defmodule MoonWeb.Hooks.Cookies do
  @moduledoc """
  Setting globals - site-wide params for (almost) all LiveViews
  """
  import Phoenix.Component, only: [assign: 2]
  import Phoenix.LiveView, only: [attach_hook: 4, push_event: 3]
  import Surface.Components.Context, only: [put: 2]

  def on_mount(:default, _params, session, socket) do
    {:cont,
     socket
     |> attach_hook(:set_global_params, :handle_event, &handle_event/3)
     |> set_params(
       theme_name: session["theme_name"] || "theme-moon-light",
       direction: session["direction"] || "ltr",
       active_page: socket.view
     )}
  end

  def handle_event("toggle_dark_mode", %{"value" => is_dark}, socket) do
    theme_name = String.replace(socket.assigns.theme_name, ["-light", "-dark"], "")
      <> if is_dark == "true", do: "-dark", else: "-light"
    {:halt, socket |> set_params(theme_name: theme_name) |> push_event("set-cookie", %{name: "theme_name", value: theme_name })}
  end

  def handle_event("toggle_direction",  %{"value" => is_rtl}, socket) do
    direction = if is_rtl == "true", do: "rtl", else: "ltr"
    {:halt, socket |> set_params(direction: direction) |> push_event("set-cookie", %{name: "direction", value: direction })}
  end

  def handle_event(_, _, socket), do: {:cont, socket}

  defp set_params(socket, values) do
    socket |> assign(values) |> put(values)
  end
end
