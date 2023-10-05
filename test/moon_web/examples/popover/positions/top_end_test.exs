defmodule MoonWeb.Examples.Popover.Positions.TopEndTest do
  use MoonWeb.ConnCase, async: true

  test "should be top-end popover", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/Design.PopoverExample.Position")

    assert view
           |> element("#popover-ex-top-end div.hidden[aria-expanded=false]")
           |> has_element?()

    refute view |> element("#popover-ex-top-end div[aria-expanded=true]") |> has_element?()

    assert view
           |> element("#popover-ex-top-end div.ltr\\:right-0.rtl\\:left-0.bottom-full")
           |> has_element?()
  end

  # TODO: add screenshot test of open panel, default and hover
end
