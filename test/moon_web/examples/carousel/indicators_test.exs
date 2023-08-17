defmodule MoonWeb.Examples.Carousel.IndicatorsTest do
  use MoonWeb.ConnCase, async: true

  test "should have w-80 and indicators", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/CarouselExample.Indicators")

    assert view |> element("div.relative.w-80") |> has_element?()
    assert view |> element("#indicators button.moon-right-arrow") |> has_element?()
    assert view |> element("#indicators button.moon-left-arrow") |> has_element?()
    assert view |> element("#indicators ul.moon-reel") |> has_element?()

    assert view
           |> element(
             "#indicators button[data-default_bg_color=bg-beerus][data-selected_bg_color=bg-piccolo]"
           )
           |> has_element?()

    # assert view |> element("#default li.[value=6][visible=true]") |> has_element?()
    # TODO: seems not to recognize visible=true, because its JS?
  end

  # TODO: add screenshot test
end
