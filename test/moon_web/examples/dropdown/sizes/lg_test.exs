defmodule MoonWeb.Examples.Dropdown.Sizes.LargeTest do
  use MoonWeb.ConnCase, async: true

  test "should open", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/DropdownExample.Sizes")

    assert view
           |> element("#drop-sizes-lg div[aria-haspopup=true]")
           |> has_element?()

    assert view |> element("#drop-sizes-lg div.hidden[role=listbox]") |> has_element?()

    view
    |> element("#drop-sizes-lg div[aria-haspopup=true]")
    |> render_click()

    assert view |> element("#drop-sizes-lg div[role=listbox]") |> has_element?()
    refute view |> element("#drop-sizes-lg div.hidden[role=listbox]") |> has_element?()
  end

  test "should select", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/DropdownExample.Sizes")

    select = view |> element("#drop-sizes-lg div[aria-haspopup=true]")

    select |> render_click()

    view
    |> element("#drop-sizes-lg div[role=listbox] button:first-child")
    |> render_click()

    # TODO: assert select |> render() ("button[class=bg-heles]")" should it be checked based on bg-colour? and if checkbox is checked?

    # assert view |> element("#drop-sizes-lg div.hidden[role=listbox]") |> has_element?()
  end

  # TODO: add screenshot test of default state, hover state, open state, selected state
end
