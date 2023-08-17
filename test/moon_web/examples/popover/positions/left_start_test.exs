defmodule MoonWeb.Examples.Popover.Positions.LeftStartTest do
  use MoonWeb.ConnCase, async: true

  test "should be left-start popover", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/PopoverExample.Position")

    assert view
           |> element("#popover-ex-left-start div.hidden[aria-expanded=false]")
           |> has_element?()

    refute view |> element("#popover-ex-left-start div[aria-expanded=true]") |> has_element?()

    assert view
           |> element("#popover-ex-left-start div.ltr\\:right-full.rtl\\:left-full.top-0")
           |> has_element?()
  end

  # TODO: add screenshot test of open panel, default and hover
end
