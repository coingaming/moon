defmodule MoonWeb.Examples.Popover.Positions.RightStartTest do
  use MoonWeb.ConnCase, async: true

  test "should be right-start popover", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/Design.PopoverExample.Position")

    assert view
           |> element("#popover-ex-right-start div.hidden[aria-expanded=false]")
           |> has_element?()

    refute view |> element("#popover-ex-right-start div[aria-expanded=true]") |> has_element?()

    assert view
           |> element("#popover-ex-right-start div.ltr\\:left-full.rtl\\:right-full.top-0")
           |> has_element?()
  end

  # TODO: add screenshot test of open panel, default and hover
end
