defmodule MoonWeb.Examples.Dropdown.Positions.LeftEndTest do
  use MoonWeb.ConnCase, async: true

  test "should be placed left-end", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/Design.DropdownExample.Positions")

    assert view
           |> element("#drop-positions-left-end div[aria-haspopup=true]")
           |> has_element?()

    assert view |> element("#drop-positions-left-end div.hidden[role=listbox]") |> has_element?()

    assert view
           |> element("#drop-positions-left-end div.ltr\\:right-full.rtl\\:left-full.bottom-0")
           |> has_element?()
  end

  # TODO: add screenshot test of default state, hover state, open state, selected state
end
