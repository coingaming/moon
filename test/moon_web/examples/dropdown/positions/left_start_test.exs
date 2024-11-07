defmodule MoonWeb.Examples.Dropdown.Positions.LeftStartTest do
  use MoonWeb.ConnCase, async: true

  test "should be placed left-start", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/Design.DropdownExample.Positions")

    assert view
           |> element("#drop-positions-left-start div[aria-haspopup=true]")
           |> has_element?()

    assert view
           |> element(
             "#drop-positions-left-start div[role=listbox][class*=\"max-h-0\"][class*=\"opacity-0\"]"
           )
           |> has_element?()

    assert view
           |> element("#drop-positions-left-start div.ltr\\:right-full.rtl\\:left-full.top-0")
           |> has_element?()
  end

  # TODO: add screenshot test of default state, hover state, open state, selected state
end
