defmodule MoonWeb.Examples.Dropdown.TriggerElements.IconButtonTest do
  use MoonWeb.ConnCase, async: true

  test "IconButton should open", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/DropdownExample.TriggerElements")

    assert view
           |> element("#dropdown-trigger-01 div[aria-haspopup=true]")
           # TODO: |> render() =~ should we check icon presence here?
           |> has_element?()

    assert view |> element("#dropdown-trigger-01 div.hidden[role=listbox]") |> has_element?()

    view
    |> element("#dropdown-trigger-01 div[aria-haspopup=true]")
    |> render_click()

    assert view |> element("#dropdown-trigger-01 div[role=listbox]") |> has_element?()
    refute view |> element("#dropdown-trigger-01 div.hidden[role=listbox]") |> has_element?()
  end

  test "IconButton should select", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/DropdownExample.TriggerElements")

    select = view |> element("#dropdown-trigger-01 div[aria-haspopup=true]")
    # assert select |> render() =~ should we check icon presence here?

    select |> render_click()

    view
    |> element("#dropdown-trigger-01 div[role=listbox] button:first-child")
    |> render_click()

    # assert select |> render() ("button[class=bg-heles]")"??  should it be checked based on bg-colour?

    assert view |> element("#dropdown-trigger-01 div.hidden[role=listbox]") |> has_element?()
  end

  # TODO: add screenshot test of default state, hover state, open non-selected state, open selected state
end
