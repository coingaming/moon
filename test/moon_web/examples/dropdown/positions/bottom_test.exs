defmodule MoonWeb.Examples.Dropdown.Positions.BottomTest do
  use MoonWeb.ConnCase, async: true

  test "should be placed bottom", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/Design.DropdownExample.Positions")

    assert view
           |> element("#drop-positions-bottom div[aria-haspopup=true]")
           |> has_element?()

    assert view
           |> element(
             "#drop-positions-bottom div[role=listbox][class*=\"max-h-0\"][class*=\"opacity-0\"]"
           )
           |> has_element?()

    assert view
           |> element(
             "#drop-positions-bottom div.top-full[class~=\"left-1/2\"][class~=\"-translate-x-1/2\"]"
           )
           |> has_element?()
  end

  # TODO: add screenshot test of default state, hover state, open state, selected state
end
