defmodule MoonWeb.Examples.Popover.Positions.LeftTest do
  use MoonWeb.ConnCase, async: true

  test "should be left popover", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/Design.PopoverExample.Position")

    assert view
           |> element("#popover-ex-left div.hidden[aria-expanded=false]")
           |> has_element?()

    refute view |> element("#popover-ex-left div[aria-expanded=true]") |> has_element?()

    assert view
           |> element("#popover-ex-left div.ltr\\:right-full.rtl\\:left-full")
           |> has_element?()
  end

  # TODO: add screenshot test of open panel, default and hover
end
