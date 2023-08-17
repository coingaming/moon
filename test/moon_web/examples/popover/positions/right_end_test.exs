defmodule MoonWeb.Examples.Popover.Positions.RightEndTest do
  use MoonWeb.ConnCase, async: true

  test "should be right-end popover", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/PopoverExample.Position")

    assert view
           |> element("#popover-ex-right-end div.hidden[aria-expanded=false]")
           |> has_element?()

    refute view |> element("#popover-ex-right-end div[aria-expanded=true]") |> has_element?()

    assert view
           |> element("#popover-ex-right-end div.ltr\\:left-full.rtl\\:right-full.bottom-0")
           |> has_element?()
  end

  # TODO: add screenshot test of open panel, default and hover
end
