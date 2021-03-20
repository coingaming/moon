defmodule MoonWeb.PageLiveTest do
  use MoonWeb.ConnCase

  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/")
    assert disconnected_html =~ "Design"
    assert render(page_live) =~ "Design"
  end
end
