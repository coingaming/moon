defmodule MoonWeb.Examples.Popover.Positions.LeftEndTest do
  use MoonWeb.ConnCase, async: true

  test "should be left-end popover", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/Design.PopoverExample.Position")

    assert view
           |> element("#popover-ex-left-end div.hidden[aria-expanded=false]")
           |> has_element?()

    refute view |> element("#popover-ex-left-end div[aria-expanded=true]") |> has_element?()

    assert view
           |> element("#popover-ex-left-end div.ltr\\:right-full.rtl\\:left-full.bottom-0")
           |> has_element?()
  end

  # TODO: add screenshot test of open panel, default and hover
end
