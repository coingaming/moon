defmodule MoonWeb.Helpers.Routes do
  @moduledoc """
  Routing helper functions with checks for side-wide params
  """

  alias MoonWeb.Router.Helpers, as: Routes

  @default_theme "theme-moon-light"
  @default_direction "ltr"

  def live_path(socket, view, props \\ [])

  def live_path(
        socket,
        view,
        props = %{theme_name: @default_theme, direction: @default_direction}
      ) do
    Routes.live_path(socket, view, props |> Map.delete(:theme_name) |> Map.delete(:direction))
  end

  def live_path(socket, view, props = %{theme_name: theme_name, direction: direction}) do
    Routes.live_path(
      socket,
      view,
      theme_name,
      direction,
      props |> Map.delete(:theme_name) |> Map.delete(:direction)
    )
  end

  def live_path(socket, view, props) when is_list(props) do
    live_path(socket, view, Map.new(props))
  end
end
