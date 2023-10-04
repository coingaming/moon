defmodule MoonWeb.Examples.Dropdown.Positions.RightStartTest do
  use MoonWeb.ConnCase, async: true

  test "should be placed right-start", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/Design.DropdownExample.Positions")

    assert view
           |> element("#drop-positions-right-start div[aria-haspopup=true]")
           |> has_element?()

    assert view
           |> element("#drop-positions-right-start div.hidden[role=listbox]")
           |> has_element?()

    assert view
           |> element("#drop-positions-right-start div.ltr\\:left-full.rtl\\:right-full.top-0")
           |> has_element?()
  end

  # TODO: add screenshot test of default state, hover state, open state, selected state
end
