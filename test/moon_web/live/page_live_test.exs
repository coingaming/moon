defmodule MoonWeb.PageLiveTest do
  use MoonWeb.ConnCase

  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/")
    assert disconnected_html =~ "Moon Elixir"
    assert render(page_live) =~ "Moon Elixir"
  end
end
