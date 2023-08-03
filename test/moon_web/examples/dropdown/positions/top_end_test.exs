defmodule MoonWeb.Examples.Dropdown.Positions.TopEndTest do
  use MoonWeb.ConnCase, async: true

  test "should be placed top-end", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/DropdownExample.Positions")

    assert view
           |> element("#drop-positions-top-end div[aria-haspopup=true]")
           |> has_element?()

    assert view |> element("#drop-positions-top-end div.hidden[role=listbox]") |> has_element?()

    assert view
           |> element("#drop-positions-top-end div.ltr\\:right-0.rtl\\:left-0.bottom-full")
           |> has_element?()
  end

  # TODO: add screenshot test of default state, hover state, open state, selected state
end
