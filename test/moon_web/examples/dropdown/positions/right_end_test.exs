defmodule MoonWeb.Examples.Dropdown.Positions.RightEndTest do
  use MoonWeb.ConnCase, async: true

  test "should be placed right-end", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/DropdownExample.Positions")

    assert view
           |> element("#drop-positions-right-end div[aria-haspopup=true]")
           |> has_element?()

    assert view |> element("#drop-positions-right-end div.hidden[role=listbox]") |> has_element?()

    assert view
           |> element("#drop-positions-right-end div.ltr\\:left-full.rtl\\:right-full.bottom-0")
           |> has_element?()
  end

  # TODO: add screenshot test of default state, hover state, open state, selected state
end
