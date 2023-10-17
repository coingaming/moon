defmodule MoonWeb.Examples.Carousel.CustomizedArrowsTest do
  use MoonWeb.ConnCase, async: true

  test "should have reel and customized arrows", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/Design.CarouselExample.CustomizedArrows")

    refute view |> element("#customized_arrows button.moon-right-arrow") |> has_element?()
    refute view |> element("#customized_arrows button.moon-left-arrow") |> has_element?()
    assert view |> element("#customized_arrows ul.moon-reel") |> has_element?()
    # assert view |> element("#default li.[value=6][visible=true]") |> has_element?()
    # TODO: seems not to recognize visible=true, because its JS?
  end

  # TODO: add screenshot test
end
