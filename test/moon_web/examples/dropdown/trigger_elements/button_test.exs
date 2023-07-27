defmodule MoonWeb.Examples.Dropdown.TriggerElements.ButtonTest do
  use MoonWeb.ConnCase, async: true

  test "Button should open", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/DropdownExample.TriggerElements")

    assert view
           |> element("#dropdown-trigger-02 div[aria-haspopup=true]")
           |> has_element?()

    assert view |> element("#dropdown-trigger-02 div.hidden[role=listbox]") |> has_element?()

    view
    |> element("#dropdown-trigger-02 div[aria-haspopup=true]")
    |> render_click()

    assert view |> element("#dropdown-trigger-02 div[role=listbox]") |> has_element?()
    refute view |> element("#dropdown-trigger-02 div.hidden[role=listbox]") |> has_element?()
  end

  test "Button should select", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/DropdownExample.TriggerElements")

    select = view |> element("#dropdown-trigger-02 div[aria-haspopup=true]")
    select |> render_click()

    view
    |> element("#dropdown-trigger-02 div[role=listbox] button:first-child")
    |> render_click()

    # TODO: assert select |> render() ("button[class=bg-heles]")" should it be checked based on bg-colour?

    assert view |> element("#dropdown-trigger-02 div.hidden[role=listbox]") |> has_element?()
  end

  # TODO: should screenshot test be added down here or separate?
end
