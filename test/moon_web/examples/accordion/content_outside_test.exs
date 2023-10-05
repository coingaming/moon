defmodule MoonWeb.Examples.Accordion.ContentOutsideTest do
  use MoonWeb.ConnCase, async: true

  test "should contain example with content outside", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/Design.AccordionExample.ContentOutside")

    assert view
           |> element("#outside-accordion button[value=0][is-content-outside=true]")
           |> has_element?()

    refute view
           |> element("#outside-accordion button[value=1][is-content-outside=true]")
           |> has_element?()

    refute view
           |> element("#outside-accordion button[value=2][is-content-outside=true]")
           |> has_element?()
  end

  # TODO: add screenshot test of default state and expanded state
end
