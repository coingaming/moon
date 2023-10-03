defmodule MoonWeb.Examples.Dropdown.TriggerElements.ChipWithArrowTest do
  use MoonWeb.ConnCase, async: true

  test "should have Chip with animated icon as trigger", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/DropdownExample.TriggerElements")

    assert view
           |> element("#dropdown-trigger-03 div[aria-haspopup=true]")
           |> has_element?()

    assert view |> element("#dropdown-trigger-03 div.hidden[role=listbox]") |> has_element?()
    assert view |> element("#dropdown-trigger-03 button.bg-goku") |> has_element?()
    assert view |> element("#dropdown-trigger-03 svg.moon-icon") |> has_element?()
    refute view |> element("#dropdown-trigger-03 svg.moon-icon.rotate-180") |> has_element?()

    view
    |> element("#dropdown-trigger-03 div[aria-haspopup=true]")
    |> render_click()

    assert view |> element("#dropdown-trigger-03 div[role=listbox]") |> has_element?()
    refute view |> element("#dropdown-trigger-03 div.hidden[role=listbox]") |> has_element?()
    assert view |> element("#dropdown-trigger-03 svg.moon-icon.rotate-180") |> has_element?()
  end

  # TODO: add screenshot test of default state, hover state, open non-selected state, open selected state
end
