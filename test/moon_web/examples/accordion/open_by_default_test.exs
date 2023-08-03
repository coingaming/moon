defmodule MoonWeb.Examples.Accordion.OpenByDefaultTest do
  use MoonWeb.ConnCase, async: true

  test "should be open by default", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/AccordionExample.OpenByDefault")

    assert view
           |> element("#open-accordion button[value=0][aria-expanded=true]")
           |> has_element?()

    assert view
           |> element("#open-accordion button[value=1][aria-expanded=true]")
           |> has_element?()

    view
    |> element("#open-accordion button[value=0]")
    |> render_click()

    refute view
           |> element("#open-accordion button[value=0][aria-expanded=true]")
           |> has_element?()

    assert view
           |> element("#open-accordion button[value=1][aria-expanded=true]")
           |> has_element?()

    view
    |> element("#open-accordion button[value=1]")
    |> render_click()

    refute view
           |> element("#open-accordion button[value=0][aria-expanded=true]")
           |> has_element?()

    refute view
           |> element("#open-accordion button[value=1][aria-expanded=true]")
           |> has_element?()
  end

  # TODO: add screenshot test of default state and collapsed state
end
