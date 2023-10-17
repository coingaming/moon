defmodule MoonWeb.Examples.Accordion.OnChangeEventTest do
  use MoonWeb.ConnCase, async: true

  test "should change colour", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/Design.AccordionExample.OnChangeEvent")

    assert view
           |> element("#on-change-accordion button.bg-goku[value=bg-krillin]")
           |> has_element?()

    assert view
           |> element("#on-change-accordion button.bg-goku[value=bg-roshi]")
           |> has_element?()

    assert view
           |> element("#on-change-accordion button.bg-goku[value=bg-chichi]")
           |> has_element?()

    view
    |> element("#on-change-accordion button[value=bg-krillin]")
    |> render_click()

    assert view
           |> element("#on-change-accordion button.bg-krillin[value=bg-krillin]")
           |> has_element?()

    assert view
           |> element("#on-change-accordion button.bg-krillin[value=bg-roshi]")
           |> has_element?()

    assert view
           |> element("#on-change-accordion button.bg-krillin[value=bg-chichi]")
           |> has_element?()

    view
    |> element("#on-change-accordion button[value=bg-roshi]")
    |> render_click()

    assert view
           |> element("#on-change-accordion button.bg-roshi[value=bg-krillin]")
           |> has_element?()

    assert view
           |> element("#on-change-accordion button.bg-roshi[value=bg-roshi]")
           |> has_element?()

    assert view
           |> element("#on-change-accordion button.bg-roshi[value=bg-chichi]")
           |> has_element?()

    view
    |> element("#on-change-accordion button[value=bg-chichi]")
    |> render_click()

    assert view
           |> element("#on-change-accordion button.bg-chichi[value=bg-krillin]")
           |> has_element?()

    assert view
           |> element("#on-change-accordion button.bg-chichi[value=bg-roshi]")
           |> has_element?()

    assert view
           |> element("#on-change-accordion button.bg-chichi[value=bg-chichi]")
           |> has_element?()
  end

  # TODO: add screenshot test of default state and expanded state
end
