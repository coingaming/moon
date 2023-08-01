defmodule MoonWeb.Examples.Dropdown.OptionLayouts.WithRadioTest do
  use MoonWeb.ConnCase, async: true

  test "should open", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/DropdownExample.OptionLayouts")

    assert view
           |> element("#dropdown-options-02 div[aria-haspopup=true]")
           |> has_element?()

    assert view |> element("#dropdown-options-02 div.hidden[role=listbox]") |> has_element?()

    view
    |> element("#dropdown-options-02 div[aria-haspopup=true]")
    |> render_click()

    assert view |> element("#dropdown-options-02 div[role=listbox]") |> has_element?()
    refute view |> element("#dropdown-options-02 div.hidden[role=listbox]") |> has_element?()
  end

  test "should select", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/DropdownExample.OptionLayouts")

    select = view |> element("#dropdown-options-02 div[aria-haspopup=true]")

    select |> render_click()

    view
    |> element("#dropdown-options-02 div[role=listbox] button:first-child")
    |> render_click()

    # TODO: assert select |> render() ("button[class=bg-heles]")" should it be checked based on bg-colour? and if radio is checked?

    assert view |> element("#dropdown-options-02 div.hidden[role=listbox]") |> has_element?()
  end

  # TODO: add screenshot test of default state, hover state, open state, selected state
end
