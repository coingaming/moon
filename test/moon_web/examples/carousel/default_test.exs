defmodule MoonWeb.Examples.Carousel.DefaultTest do
  use MoonWeb.ConnCase, async: true

  test "should have arrows and reel", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/Design.CarouselExample.Default")

    assert view |> element("#default button.moon-right-arrow") |> has_element?()
    assert view |> element("#default button.moon-left-arrow") |> has_element?()
    assert view |> element("#default ul.moon-reel") |> has_element?()
    # assert view |> element("#default li.[value=6][visible=true]") |> has_element?()
    # TODO: seems not to recognize visible=true, because its JS?
  end

  # TODO: add screenshot test
end
