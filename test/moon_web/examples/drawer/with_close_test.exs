defmodule MoonWeb.Examples.Drawer.WithCloseTest do
  use MoonWeb.ConnCase, async: true

  test "should open and close Drawer", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/Design.DrawerExample.WithClose")

    assert view |> element("button[id=with_close]")
    assert view |> element("div.hidden[id=with_close_drawer]") |> has_element?()

    view
    |> element("button[id=with_close]")
    |> render_click()

    assert view |> element("div[id=with_close_drawer][data-is_open]") |> has_element?()
    assert view |> element("#with_close_drawer div.ltr\\:right-0.rtl\\:left-0") |> has_element?()
    assert view |> element("#with_close_drawer button[id=close_drawer]")

    view
    |> element("button[id=close_drawer]")
    |> render_click()

    assert view |> element("div.hidden[id=with_close_drawer]") |> has_element?()

    # TODO: add test case for closing the bottomsheet panel on-click-away
  end

  # TODO: add screenshot test
end
