defmodule MoonWeb.Examples.Dropdown.Positions.LeftTest do
  use MoonWeb.ConnCase, async: true

  test "should be placed left", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/Design.DropdownExample.Positions")

    assert view
           |> element("#drop-positions-left div[aria-haspopup=true]")
           |> has_element?()

    assert view |> element("#drop-positions-left div.hidden[role=listbox]") |> has_element?()

    assert view
           |> element("#drop-positions-left div.ltr\\:right-full.rtl\\:left-full")
           |> has_element?()
  end

  # TODO: add screenshot test of default state, hover state, open state, selected state
end
