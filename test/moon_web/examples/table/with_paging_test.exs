defmodule MoonWeb.Examples.Table.WithPagingTest do
  use MoonWeb.ConnCase, async: true

  test "should change page with button", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/TableExample.WithPaging")

    assert view
           |> element("#with_buttons nav[aria-label=pagination]")
           |> has_element?()

    assert view
           |> element("#[aria-label=pagination] button.bg-piccolo[aria-label=page_1]")
           |> has_element?()

    assert view
           |> element("#[aria-label=pagination] button.bg-none[aria-label=page_2]")
           |> has_element?()

    assert view
           |> element("tr[phx-value-selected=1]")
           |> has_element?()

    refute view
           |> element("tr[phx-value-selected=11]")
           |> has_element?()

    view
    |> element("#[aria-label=pagination] button.bg-none[aria-label=page_2]")
    |> render_click()

    assert view
           |> element("#[aria-label=pagination] button.bg-piccolo[aria-label=page_2]")
           |> has_element?()

    assert view
           |> element("#[aria-label=pagination] button.bg-none[aria-label=page_1]")
           |> has_element?()

    refute view
           |> element("tr[phx-value-selected=1]")
           |> has_element?()

    assert view
           |> element("tr[phx-value-selected=11]")
           |> has_element?()
  end

  test "should change page with arrows", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/TableExample.WithPaging")

    assert view
           |> element("#with_buttons button[disabled][value=0]")
           |> has_element?()

    assert view
           |> element("#with_buttons button.bg-transparent[value=2]")
           |> has_element?()

    view
    |> element("#with_buttons button.bg-transparent[value=2]")
    |> render_click()

    assert view
           |> element("#with_buttons button.bg-transparent[value=1]")
           |> has_element?()

    refute view
           |> element("#with_buttons button.bg-transparent[disabled][value=1]")
           |> has_element?()

    assert view
           |> element("#[aria-label=pagination] button.bg-piccolo[aria-label=page_2]")
           |> has_element?()

    assert view
           |> element("#[aria-label=pagination] button.bg-none[aria-label=page_1]")
           |> has_element?()

    refute view
           |> element("tr[phx-value-selected=1]")
           |> has_element?()

    assert view
           |> element("tr[phx-value-selected=11]")
           |> has_element?()

    view
    |> element("#with_buttons button.bg-transparent[value=1]")
    |> render_click()

    assert view
           |> element("#[aria-label=pagination] button.bg-piccolo[aria-label=page_1]")
           |> has_element?()

    assert view
           |> element("#[aria-label=pagination] button.bg-none[aria-label=page_2]")
           |> has_element?()

    assert view
           |> element("tr[phx-value-selected=1]")
           |> has_element?()

    refute view
           |> element("tr[phx-value-selected=11]")
           |> has_element?()
  end

  # TODO: add screenshot test
end
