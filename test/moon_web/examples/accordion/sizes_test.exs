defmodule MoonWeb.Examples.Accordion.SizesTest do
  use MoonWeb.ConnCase, async: true

  test "should expand and collapse xl", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/AccordionExample.Sizes")

    assert view
           |> element("#accordion-sizes-xl button[value=0][size=xl]")
           |> has_element?()

    refute view
           |> element("#accordion-sizes-xl button[aria-expanded=true]")
           |> has_element?()

    view
    |> element("#accordion-sizes-xl button[value=0]")
    |> render_click()

    assert view
           |> element("#accordion-sizes-xl button[value=0][aria-expanded=true][size=xl]")
           |> has_element?()

    view
    |> element("#accordion-sizes-xl button[value=0]")
    |> render_click()

    assert view
           |> element("#accordion-sizes-xl button[value=0][size=xl]")
           |> has_element?()

    refute view
           |> element("#accordion-sizes-xl button[aria-expanded=true]")
           |> has_element?()
  end

  test "should expand and collapse lg", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/AccordionExample.Sizes")

    assert view
           |> element("#accordion-sizes-lg button[value=0][size=lg]")
           |> has_element?()

    refute view
           |> element("#accordion-sizes-lg button[aria-expanded=true]")
           |> has_element?()

    view
    |> element("#accordion-sizes-lg button[value=0]")
    |> render_click()

    assert view
           |> element("#accordion-sizes-lg button[value=0][aria-expanded=true][size=lg]")
           |> has_element?()

    view
    |> element("#accordion-sizes-lg button[value=0]")
    |> render_click()

    assert view
           |> element("#accordion-sizes-lg button[value=0][size=lg]")
           |> has_element?()

    refute view
           |> element("#accordion-sizes-lg button[aria-expanded=true]")
           |> has_element?()
  end

  test "should expand and collapse md", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/AccordionExample.Sizes")

    assert view
           |> element("#accordion-sizes-md button[value=0][size=md]")
           |> has_element?()

    refute view
           |> element("#accordion-sizes-md button[aria-expanded=true]")
           |> has_element?()

    view
    |> element("#accordion-sizes-md button[value=0]")
    |> render_click()

    assert view
           |> element("#accordion-sizes-md button[value=0][aria-expanded=true][size=md]")
           |> has_element?()

    view
    |> element("#accordion-sizes-md button[value=0]")
    |> render_click()

    assert view
           |> element("#accordion-sizes-md button[value=0][size=md]")
           |> has_element?()

    refute view
           |> element("#accordion-sizes-md button[aria-expanded=true]")
           |> has_element?()
  end

  test "should expand and collapse sm", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/AccordionExample.Sizes")

    assert view
           |> element("#accordion-sizes-sm button[value=0][size=sm]")
           |> has_element?()

    refute view
           |> element("#accordion-sizes-sm button[aria-expanded=true]")
           |> has_element?()

    view
    |> element("#accordion-sizes-sm button[value=0]")
    |> render_click()

    assert view
           |> element("#accordion-sizes-sm button[value=0][aria-expanded=true][size=sm]")
           |> has_element?()

    view
    |> element("#accordion-sizes-sm button[value=0]")
    |> render_click()

    assert view
           |> element("#accordion-sizes-sm button[value=0][size=sm]")
           |> has_element?()

    refute view
           |> element("#accordion-sizes-sm button[aria-expanded=true]")
           |> has_element?()
  end

  # TODO: add screenshot test of default state and expanded state
end
