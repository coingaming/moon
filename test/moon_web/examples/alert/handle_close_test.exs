defmodule MoonWeb.Examples.Alert.HandleCloseTest do
  use MoonWeb.ConnCase, async: true

  test "should close and open alert", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/AlertExample.HandleClose")

    assert view |> element("div[role=alert] button[data-size=xs]") |> has_element?()

    view
    |> element("button[data-size=xs]")
    |> render_click()

    assert view |> element("button[data-size=md]") |> has_element?()

    refute view |> element("div[role=alert] button[data-size=xs]") |> has_element?()

    view
    |> element("button[data-size=md]")
    |> render_click()

    assert view |> element("div[role=alert] button[data-size=xs]") |> has_element?()
  end

  # TODO: add screenshot test
end
