defmodule MoonWeb.Examples.Dropdown.DefaultTest do
  use MoonWeb.ConnCase, async: true

  test "should open", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/DropdownExample.Default")

    assert view
           |> element("#dropdown-02 div[aria-haspopup=true]")
           |> render() =~ "Choose name..."

    assert view |> element("#dropdown-02 div.hidden[role=listbox]") |> has_element?()

    view
    |> element("#dropdown-02 div[aria-haspopup=true]")
    |> render_click()

    assert view |> element("#dropdown-02 div[role=listbox]") |> has_element?()
    refute view |> element("#dropdown-02 div.hidden[role=listbox]") |> has_element?()
  end

  test "should select", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/DropdownExample.Default")

    select = view |> element("#dropdown-02 div[aria-haspopup=true]")
    assert select |> render() =~ "Choose name..."

    select |> render_click()

    view
    |> element("#dropdown-02 div[role=listbox] button:first-child")
    |> render_click()

    assert select |> render() =~ "Wade Cooper"

    assert view |> element("#dropdown-02 div.hidden[role=listbox]") |> has_element?()
  end
end
