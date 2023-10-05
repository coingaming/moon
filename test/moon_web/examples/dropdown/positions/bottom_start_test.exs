defmodule MoonWeb.Examples.Dropdown.Positions.BottomStartTest do
  use MoonWeb.ConnCase, async: true

  test "should be placed bottom-start", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/Design.DropdownExample.Positions")

    assert view
           |> element("#drop-positions-bottom-start div[aria-haspopup=true]")
           |> has_element?()

    assert view
           |> element("#drop-positions-bottom-start div.hidden[role=listbox]")
           |> has_element?()

    assert view
           |> element("#drop-positions-bottom-start div.ltr\\:left-0.rtl\\:right-0.top-full")
           |> has_element?()
  end

  # TODO: add screenshot test of default state, hover state, open state, selected state
end
