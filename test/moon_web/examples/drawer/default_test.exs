defmodule MoonWeb.Examples.Drawer.DefaultTest do
  use MoonWeb.ConnCase, async: true

  test "should open and close Drawer", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/DrawerExample.Default")

    button_to_open_drawer = view |> element("button[data-size=md]")
    assert button_to_open_drawer |> render() =~ "Show default Drawer"

    assert view |> element("div.hidden[id=default_drawer]") |> has_element?()

    button_to_open_drawer |> render_click()

    assert view |> element("div[id=default_drawer][data-is_open]") |> has_element?()
    assert view |> element("#default_drawer div.ltr\\:right-0.rtl\\:left-0") |> has_element?()

    # TODO: add test case for closing the bottomsheet panel on-click-away
  end

  # TODO: add screenshot test
end
