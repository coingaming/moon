defmodule MoonWeb.Plugs.SetIsMobile do
  @moduledoc """
  Depends on assets/js/set-is-mobile.js setIsMobile()
  """
  import Plug.Conn

  def init(default), do: default

  def call(conn, _) do
    conn = fetch_cookies(conn)

    cookie_is_mobile =
      conn
      |> fetch_cookies()
      |> Map.get(:cookies, %{})
      |> Map.get("is_mobile")

    # unless is_mobile is explicitly false it is true
    is_mobile = cookie_is_mobile != "false"
    put_session(conn, :is_mobile, is_mobile)
  end
end
