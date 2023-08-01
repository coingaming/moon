defmodule MoonWeb.Examples.Accordion.DefaultTest do
  use MoonWeb.ConnCase, async: true

  test "should expand and collapse 1st", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/AccordionExample.Default")

    assert view
           |> element("#simple-accordion button[value=0]")
           |> render() =~ "Lorem"

    view
    |> element("#simple-accordion button[value=0]")
    |> render_click()

    assert view |> element("#simple-accordion div[role=region]") |> has_element?()

    view
    |> element("#simple-accordion button[value=0]")
    |> render_click()

    refute view |> element("#simple-accordion div[role=region]") |> has_element?()
  end

  test "should expand and collapse 2nd", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/AccordionExample.Default")

    assert view
           |> element("#simple-accordion button[value=1]")
           |> render() =~ "Beerus bg"

    view
    |> element("#simple-accordion button[value=1]")
    |> render_click()

    assert view |> element("#simple-accordion div[role=region]") |> has_element?()

    view
    |> element("#simple-accordion button[value=1]")
    |> render_click()

    refute view |> element("#simple-accordion div[role=region]") |> has_element?()
  end

  test "should expand and collapse 3rd", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/AccordionExample.Default")

    assert view
           |> element("#simple-accordion button[value=2]")
           |> render() =~ "Dolor"

    view
    |> element("#simple-accordion button[value=2]")
    |> render_click()

    assert view |> element("#simple-accordion div[role=region]") |> has_element?()

    view
    |> element("#simple-accordion button[value=2]")
    |> render_click()

    refute view |> element("#simple-accordion div[role=region]") |> has_element?()
  end

  # TODO: add screenshot test of default state and expanded state
end
