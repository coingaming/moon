defmodule MoonWeb.Examples.Accordion.DisabledItemTest do
  use MoonWeb.ConnCase, async: true

  test "should have one disabled item", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/AccordionExample.DisabledItem")

    refute view
           |> element("#disabled-accordion button[value=0][aria-expanded=true]")
           |> has_element?()

    assert view
           |> element("#disabled-accordion button[value=1][disabled]")
           |> has_element?()

    refute view
           |> element("#disabled-accordion button[value=2][aria-expanded=true]")
           |> has_element?()
  end

  # TODO: add screenshot test of default state and expanded state
end
