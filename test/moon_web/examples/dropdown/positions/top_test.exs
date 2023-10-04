defmodule MoonWeb.Examples.Dropdown.Positions.TopTest do
  use MoonWeb.ConnCase, async: true

  test "should be placed top", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/Design.DropdownExample.Positions")

    assert view
           |> element("#drop-positions-top div[aria-haspopup=true]")
           |> has_element?()

    assert view |> element("#drop-positions-top div.hidden[role=listbox]") |> has_element?()

    assert view
           |> element(
             "#drop-positions-top div.bottom-full[class~=\"left-1/2\", \"-translate-x-1/2\"]"
           )
           |> has_element?()
  end

  # TODO: add screenshot test of default state, hover state, open state, selected state
end
