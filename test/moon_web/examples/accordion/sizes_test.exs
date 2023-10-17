defmodule MoonWeb.Examples.Accordion.SizesTest do
  use MoonWeb.ConnCase, async: true

  test "should contain Accordion items with all sizes", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/Design.AccordionExample.Sizes")

    assert view
           |> element("#accordion-sizes-xl button[value=0][size=xl]")
           |> has_element?()

    assert view
           |> element("#accordion-sizes-lg button[value=0][size=lg]")
           |> has_element?()

    assert view
           |> element("#accordion-sizes-md button[value=0][size=md]")
           |> has_element?()

    assert view
           |> element("#accordion-sizes-sm button[value=0][size=sm]")
           |> has_element?()
  end

  # TODO: add screenshot test of default state and expanded state
end
