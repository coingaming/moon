defmodule MoonWeb.Examples.Tabs.WithSegmentsTest do
  use MoonWeb.ConnCase, async: true

  test "should have segments", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/Design.TabsExample.WithSegments")

    assert view
           |> element(
             "#tabs-with-segments button.bg-goku.transition-colors.rounded-moon-i-sm[value=0][tabindex=0][role=tab][aria-selected=true]"
           )
           |> has_element?()

    assert view
           |> element(
             "#tabs-with-segments button.transition-colors.rounded-moon-i-sm[value=1][tabindex=1][role=tab]"
           )
           |> has_element?()

    refute view
           |> element(
             "#tabs-with-segments button.bg-goku.transition-colors.rounded-moon-i-sm[value=1][tabindex=1][role=tab]"
           )
           |> has_element?()

    assert view
           |> element(
             "#tabs-with-segments button.transition-colors.rounded-moon-i-sm[value=2][tabindex=2][role=tab]"
           )
           |> has_element?()

    refute view
           |> element(
             "#tabs-with-segments button.bg-goku.transition-colors.rounded-moon-i-sm[value=2][tabindex=2][role=tab]"
           )
           |> has_element?()
  end

  # TODO: add screenshot test
end
