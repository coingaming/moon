defmodule MoonWeb.Examples.Pagination.WithTextTest do
  use MoonWeb.ConnCase, async: true

  test "should switch active page to last and disable next arrow", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/PaginationExample.WithText")

    refute view |> element("#default svg.moon-icon.fill-none.text-moon-24.rtl:rotate-180")

    assert view
           |> element("#default button[data-testid=prev_button][value=0][disabled]")
           |> has_element?()

    assert view
           |> element("#default button[data-testid=next_button][value=2]")
           |> has_element?()

    assert view |> element("#default nav[aria-label=pagination]") |> has_element?()
    assert view |> element("#default button.bg-piccolo[aria-label=page_1]") |> has_element?()
    assert view |> element("#default button.bg-none[aria-label=page_2]") |> has_element?()

    view
    |> element("#default button.bg-none[aria-label=page_11]")
    |> render_click()

    assert view |> element("#default button.bg-none[aria-label=page_1]") |> has_element?()

    assert view
           |> element("#default button.bg-piccolo[aria-label=page_11]")
           |> has_element?()

    refute view
           |> element("#default button[data-testid=prev_button][value=10][disabled]")
           |> has_element?()

    assert view
           |> element("#default button[data-testid=prev_button][value=10]")
           |> has_element?()

    assert view
           |> element("#default button[data-testid=next_button][value=12][disabled]")
           |> has_element?()
  end

  test "should switch active pages with arrows", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/PaginationExample.WithIcons")

    assert view
           |> element("#default button[data-testid=prev_button][value=0][disabled]")
           |> has_element?()

    view
    |> element("#default button[data-testid=next_button][value=2]")
    |> render_click()

    assert view |> element("#default button.bg-none[aria-label=page_1]") |> has_element?()
    assert view |> element("#default button.bg-piccolo[aria-label=page_2]") |> has_element?()

    refute view
           |> element("#default button[data-testid=prev_button][value=1][disabled]")
           |> has_element?()

    assert view
           |> element("#default button[data-testid=prev_button][value=1]")
           |> has_element?()

    view
    |> element("#default button[data-testid=prev_button][value=1]")
    |> render_click()

    assert view
           |> element("#default button[data-testid=prev_button][value=0][disabled]")
           |> has_element?()

    assert view |> element("#default button.bg-none[aria-label=page_2]") |> has_element?()
    assert view |> element("#default button.bg-piccolo[aria-label=page_1]") |> has_element?()
  end

  # TODO: add screenshot test if needed
end
