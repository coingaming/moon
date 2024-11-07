defmodule MoonWeb.Examples.Dropdown.OptionLayouts.WithCheckboxTest do
  use MoonWeb.ConnCase, async: true

  test "should have checkboxes", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/Design.DropdownExample.OptionLayouts")

    assert view
           |> element("#dropdown-options-03 div[aria-haspopup=true]")
           |> has_element?()

    assert view
           |> element(
             "#dropdown-options-03 div[role=listbox][class*=\"max-h-0\"][class*=\"opacity-0\"]"
           )
           |> has_element?()

    assert view |> element("#dropdown-options-03 div.border-trunks") |> has_element?()
    assert view |> element("#dropdown-options-03 div.border-piccolo.bg-piccolo") |> has_element?()

    view
    |> element("#dropdown-options-03 div[aria-haspopup=true]")
    |> render_click()

    assert view |> element("#dropdown-options-03 div[role=listbox]") |> has_element?()

    refute view
           |> element(
             "#dropdown-options-03 div[role=listbox][class*=\"max-h-0\"][class*=\"opacity-0\"]"
           )
           |> has_element?()
  end

  # TODO: add screenshot test of default state, hover state, open state, selected state
end
