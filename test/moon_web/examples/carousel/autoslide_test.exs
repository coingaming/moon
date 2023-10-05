defmodule MoonWeb.Examples.Carousel.AutoslideTest do
  use MoonWeb.ConnCase, async: true

  test "should have autoslide", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/Design.CarouselExample.Autoslide")

    refute view |> element("#autoslide button.moon-right-arrow") |> has_element?()
    refute view |> element("#autoslide button.moon-left-arrow") |> has_element?()
    assert view |> element("#autoslide ul.moon-reel") |> has_element?()
    assert view |> element("div[data-autoslide_delay=3000][data-step=1]") |> has_element?()

    # assert view |> element("#default li.[value=6][visible=true]") |> has_element?()
    # TODO: seems not to recognize visible=true, because its JS?
  end

  # TODO: add screenshot test
end
