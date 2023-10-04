defmodule MoonWeb.Examples.Popover.Positions.TopStartTest do
  use MoonWeb.ConnCase, async: true

  test "should be top-start popover", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/Design.PopoverExample.Position")

    assert view
           |> element("#popover-ex-top-start div.hidden[aria-expanded=false]")
           |> has_element?()

    refute view |> element("#popover-ex-top-start div[aria-expanded=true]") |> has_element?()

    assert view
           |> element("#popover-ex-top-start div.ltr\\:left-0.rtl\\:right-0.bottom-full")
           |> has_element?()
  end

  # TODO: add screenshot test of open panel, default and hover
end
