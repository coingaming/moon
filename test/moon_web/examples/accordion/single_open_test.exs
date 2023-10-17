defmodule MoonWeb.Examples.Accordion.SingleOpenTest do
  use MoonWeb.ConnCase, async: true

  test "should expand one and collapse others", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/Design.AccordionExample.SingleOpen")

    refute view
           |> element("#single-accordion button[value=0][aria-expanded=true]")
           |> has_element?()

    refute view
           |> element("#single-accordion button[value=1][aria-expanded=true]")
           |> has_element?()

    refute view
           |> element("#single-accordion button[value=2][aria-expanded=true]")
           |> has_element?()

    view
    |> element("#single-accordion button[value=0]")
    |> render_click()

    assert view
           |> element("#single-accordion button[value=0][aria-expanded=true]")
           |> has_element?()

    refute view
           |> element("#single-accordion button[value=1][aria-expanded=true]")
           |> has_element?()

    refute view
           |> element("#single-accordion button[value=2][aria-expanded=true]")
           |> has_element?()

    view
    |> element("#single-accordion button[value=1]")
    |> render_click()

    refute view
           |> element("#single-accordion button[value=0][aria-expanded=true]")
           |> has_element?()

    assert view
           |> element("#single-accordion button[value=1][aria-expanded=true]")
           |> has_element?()

    refute view
           |> element("#single-accordion button[value=2][aria-expanded=true]")
           |> has_element?()
  end

  # TODO: add screenshot test of default state and expanded state
end
