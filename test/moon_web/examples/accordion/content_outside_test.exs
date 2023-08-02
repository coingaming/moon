defmodule MoonWeb.Examples.Accordion.ContentOutsideTest do
  use MoonWeb.ConnCase, async: true

  test "should expand and collapse", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/AccordionExample.ContentOutside")

    assert view
           |> element("#outside-accordion button[value=0][is-content-outside=true]")
           |> has_element?()

    refute view
           |> element("#outside-accordion button[value=1][is-content-outside=true]")
           |> has_element?()

    refute view
           |> element("#outside-accordion button[value=2][is-content-outside=true]")
           |> has_element?()

    view
    |> element("#outside-accordion button[value=0]")
    |> render_click()

    assert view
           |> element(
             "#outside-accordion button[value=0][is-content-outside=true][aria-expanded=true]"
           )
           |> has_element?()

    refute view
           |> element("#outside-accordion button[value=1][aria-expanded=true]")
           |> has_element?()

    refute view
           |> element("#outside-accordion button[value=2][aria-expanded=true]")
           |> has_element?()

    view
    |> element("#outside-accordion button[value=1]")
    |> render_click()

    assert view
           |> element(
             "#outside-accordion button[value=0][is-content-outside=true][aria-expanded=true]"
           )
           |> has_element?()

    assert view
           |> element("#outside-accordion button[value=1][aria-expanded=true]")
           |> has_element?()

    refute view
           |> element("#outside-accordion button[value=2][aria-expanded=true]")
           |> has_element?()

    view
    |> element("#outside-accordion button[value=2]")
    |> render_click()

    assert view
           |> element(
             "#outside-accordion button[value=0][is-content-outside=true][aria-expanded=true]"
           )
           |> has_element?()

    assert view
           |> element("#outside-accordion button[value=1][aria-expanded=true]")
           |> has_element?()

    assert view
           |> element("#outside-accordion button[value=2][aria-expanded=true]")
           |> has_element?()

    view
    |> element("#outside-accordion button[value=0]")
    |> render_click()

    assert view
           |> element("#outside-accordion button[value=0][is-content-outside=true]")
           |> has_element?()

    assert view
           |> element("#outside-accordion button[value=1][aria-expanded=true]")
           |> has_element?()

    assert view
           |> element("#outside-accordion button[value=2][aria-expanded=true]")
           |> has_element?()

    view
    |> element("#outside-accordion button[value=1]")
    |> render_click()

    assert view
           |> element("#outside-accordion button[value=0][is-content-outside=true]")
           |> has_element?()

    refute view
           |> element("#outside-accordion button[value=1][aria-expanded=true]")
           |> has_element?()

    assert view
           |> element("#outside-accordion button[value=2][aria-expanded=true]")
           |> has_element?()

    view
    |> element("#outside-accordion button[value=2]")
    |> render_click()

    assert view
           |> element("#outside-accordion button[value=0][is-content-outside=true]")
           |> has_element?()

    refute view
           |> element("#outside-accordion button[value=1][aria-expanded=true]")
           |> has_element?()

    refute view
           |> element("#outside-accordion button[value=2][aria-expanded=true]")
           |> has_element?()
  end

  # TODO: add screenshot test of default state and expanded state
end
