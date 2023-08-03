defmodule MoonWeb.Examples.Dropdown.Positions.RightTest do
  use MoonWeb.ConnCase, async: true

  test "should be placed right", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/DropdownExample.Positions")

    assert view
           |> element("#drop-positions-right div[aria-haspopup=true]")
           |> has_element?()

    assert view |> element("#drop-positions-right div.hidden[role=listbox]") |> has_element?()

    assert view
           |> element("#drop-positions-right div.ltr\\:left-full.rtl\\:right-full")
           |> has_element?()
  end

  # TODO: add screenshot test of default state, hover state, open state, selected state
end
