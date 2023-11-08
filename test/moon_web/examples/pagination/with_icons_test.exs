defmodule MoonWeb.Examples.Pagination.WithIconsTest do
  use MoonWeb.ConnCase, async: true

  test "should switch active page to last and disable next arrow", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/Design.PaginationExample.WithIcons")

    assert view |> element("#with_buttons svg.moon-icon.fill-none.text-moon-24.rtl:rotate-180")

    assert view
           |> element("#with_buttons button[data-testid=prev_button][value=0][disabled]")
           |> has_element?()

    assert view
           |> element("#with_buttons button[data-testid=next_button][value=2]")
           |> has_element?()

    assert view |> element("#with_buttons nav[aria-label=pagination]") |> has_element?()
    assert view |> element("#with_buttons button.bg-piccolo[aria-label=page_1]") |> has_element?()

    assert view
           |> element("#with_buttons button.bg-transparent[aria-label=page_2]")
           |> has_element?()

    view
    |> element("#with_buttons button.bg-transparent[aria-label=page_26]")
    |> render_click()

    assert view
           |> element("#with_buttons button.bg-transparent[aria-label=page_1]")
           |> has_element?()

    assert view
           |> element("#with_buttons button.bg-piccolo[aria-label=page_26]")
           |> has_element?()

    refute view
           |> element("#with_buttons button[data-testid=prev_button][value=25][disabled]")
           |> has_element?()

    assert view
           |> element("#with_buttons button[data-testid=prev_button][value=25]")
           |> has_element?()

    assert view
           |> element("#with_buttons button[data-testid=next_button][value=27][disabled]")
           |> has_element?()
  end

  test "should switch active pages with arrows", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/Design.PaginationExample.WithIcons")

    assert view
           |> element("#with_buttons button[data-testid=prev_button][value=0][disabled]")
           |> has_element?()

    view
    |> element("#with_buttons button[data-testid=next_button][value=2]")
    |> render_click()

    assert view
           |> element("#with_buttons button.bg-transparent[aria-label=page_1]")
           |> has_element?()

    assert view |> element("#with_buttons button.bg-piccolo[aria-label=page_2]") |> has_element?()

    refute view
           |> element("#with_buttons button[data-testid=prev_button][value=1][disabled]")
           |> has_element?()

    assert view
           |> element("#with_buttons button[data-testid=prev_button][value=1]")
           |> has_element?()

    view
    |> element("#with_buttons button[data-testid=prev_button][value=1]")
    |> render_click()

    assert view
           |> element("#with_buttons button[data-testid=prev_button][value=0][disabled]")
           |> has_element?()

    assert view
           |> element("#with_buttons button.bg-transparent[aria-label=page_2]")
           |> has_element?()

    assert view |> element("#with_buttons button.bg-piccolo[aria-label=page_1]") |> has_element?()
  end

  # TODO: add screenshot test if needed
end
