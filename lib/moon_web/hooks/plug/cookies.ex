defmodule MoonWeb.Hooks.Plug.Cookies do
  @moduledoc """
  Getting globals from cookie to session
  """
  import Plug.Conn

  def init(default), do: default

  def call(conn, _) do
    conn
      |> put_session(:theme_name, get_cookie(conn, "theme_name") || "theme-moon-light")
      |> put_session(:direction, get_cookie(conn, "direction") || "ltr")
  end

  defp get_cookie(conn, name) do
    conn
      |> fetch_cookies()
      |> Map.get(:cookies, %{})
      |> Map.get(name)
  end

end
