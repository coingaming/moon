defmodule MoonWeb.Examples.Popover.Positions.BottomEndTest do
  use MoonWeb.ConnCase, async: true

  test "should be bottom-end popover", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/PopoverExample.Position")

    assert view
           |> element("#popover-ex-bottom-end div.hidden[aria-expanded=false]")
           |> has_element?()

    refute view |> element("#popover-ex-bottom-end div[aria-expanded=true]") |> has_element?()

    assert view
           |> element("#popover-ex-bottom-end div.ltr\\:right-0.rtl\\:left-0.top-full")
           |> has_element?()
  end

  # TODO: add screenshot test of open panel, default and hover
end
