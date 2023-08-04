defmodule MoonWeb.Examples.Carousel.SpacesTest do
  use MoonWeb.ConnCase, async: true

  test "should have reel and customized arrows", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/CarouselExample.Spaces")

    assert view |> element("#spaces ul.moon-reel.gap-10") |> has_element?()
  end

  # TODO: add screenshot test
end
