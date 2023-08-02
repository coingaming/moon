defmodule MoonWeb.Examples.Accordion.DefaultTest do
  use MoonWeb.ConnCase, async: true

  test "should expand and collapse", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/AccordionExample.Default")

    refute view
           |> element("#simple-accordion button[value=0][aria-expanded=true]")
           |> has_element?()

    refute view
           |> element("#simple-accordion button[value=1][aria-expanded=true]")
           |> has_element?()

    refute view
           |> element("#simple-accordion button[value=2][aria-expanded=true]")
           |> has_element?()

    view
    |> element("#simple-accordion button[value=0]")
    |> render_click()

    assert view
           |> element("#simple-accordion button[value=0][aria-expanded=true]")
           |> has_element?()

    refute view
           |> element("#simple-accordion button[value=1][aria-expanded=true]")
           |> has_element?()

    refute view
           |> element("#simple-accordion button[value=2][aria-expanded=true]")
           |> has_element?()

    view
    |> element("#simple-accordion button[value=1]")
    |> render_click()

    assert view
           |> element("#simple-accordion button[value=0][aria-expanded=true]")
           |> has_element?()

    assert view
           |> element("#simple-accordion button[value=1][aria-expanded=true]")
           |> has_element?()

    refute view
           |> element("#simple-accordion button[value=2][aria-expanded=true]")
           |> has_element?()

    view
    |> element("#simple-accordion button[value=2]")
    |> render_click()

    assert view
           |> element("#simple-accordion button[value=0][aria-expanded=true]")
           |> has_element?()

    assert view
           |> element("#simple-accordion button[value=1][aria-expanded=true]")
           |> has_element?()

    assert view
           |> element("#simple-accordion button[value=2][aria-expanded=true]")
           |> has_element?()

    view
    |> element("#simple-accordion button[value=0]")
    |> render_click()

    refute view
           |> element("#simple-accordion button[value=0][aria-expanded=true]")
           |> has_element?()

    view
    |> element("#simple-accordion button[value=1]")
    |> render_click()

    refute view
           |> element("#simple-accordion button[value=1][aria-expanded=true]")
           |> has_element?()

    view
    |> element("#simple-accordion button[value=2]")
    |> render_click()

    refute view
           |> element("#simple-accordion button[value=2][aria-expanded=true]")
           |> has_element?()
  end

  # TODO: add screenshot test of default state and expanded state
end
