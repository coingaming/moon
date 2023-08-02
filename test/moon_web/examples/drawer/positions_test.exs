defmodule MoonWeb.Examples.Drawer.PositionsTest do
  use MoonWeb.ConnCase, async: true

  test "should open and close start Drawer", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/DrawerExample.Positions")

    assert view |> element("button[id=start]") |> has_element?()
    assert view |> element("div.hidden[id=start_drawer]") |> has_element?()

    view
    |> element("button[id=start]")
    |> render_click()

    assert view |> element("div[id=start_drawer][data-is_open]") |> has_element?()
    # TODO: replace with ltr:left-0 class?
    assert view |> element("#start_drawer div.inset-y-0") |> has_element?()

    # TODO: add test case for closing the bottomsheet panel on-click-away
  end

  test "should open and close top Drawer", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/DrawerExample.Positions")

    assert view |> element("button[id=top]") |> has_element?()
    assert view |> element("div.hidden[id=top_drawer]") |> has_element?()

    view
    |> element("button[id=top]")
    |> render_click()

    assert view |> element("div[id=top_drawer][data-is_open]") |> has_element?()
    assert view |> element("#top_drawer div.top-0") |> has_element?()

    # TODO: add test case for closing the bottomsheet panel on-click-away
  end

  test "should open and close end Drawer", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/DrawerExample.Positions")

    assert view |> element("button[id=end]") |> has_element?()
    assert view |> element("div.hidden[id=end_drawer]") |> has_element?()

    view
    |> element("button[id=end]")
    |> render_click()

    assert view |> element("div[id=end_drawer][data-is_open]") |> has_element?()
    # TODO: replace with ltr:right-0 class?
    assert view |> element("#end_drawer div.inset-y-0") |> has_element?()

    # TODO: add test case for closing the bottomsheet panel on-click-away
  end

  test "should open and close bottom Drawer", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/DrawerExample.Positions")

    assert view |> element("button[id=bottom]") |> has_element?()
    assert view |> element("div.hidden[id=bottom_drawer]") |> has_element?()

    view
    |> element("button[id=bottom]")
    |> render_click()

    assert view |> element("div[id=bottom_drawer][data-is_open]") |> has_element?()
    assert view |> element("#bottom_drawer div.bottom-0") |> has_element?()

    # TODO: add test case for closing the bottomsheet panel on-click-away
  end

  # TODO: add screenshot test
end
