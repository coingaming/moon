defmodule MoonWeb.Examples.Popover.Positions.TopTest do
  use MoonWeb.ConnCase, async: true

  test "should be top popover", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/Design.PopoverExample.Position")

    assert view
           |> element("#popover-ex-top div.hidden[aria-expanded=false]")
           |> has_element?()

    refute view |> element("#popover-ex-top div[aria-expanded=true]") |> has_element?()

    assert view
           |> element(
             "#popover-ex-top div.bottom-full[class~=\"left-1/2\", \"-translate-x-1/2\"]"
           )
           |> has_element?()
  end

  # TODO: add screenshot test of open panel, default and hover
end
