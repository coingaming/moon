defmodule MoonWeb.Examples.Carousel.SelectIndexTest do
  use MoonWeb.ConnCase, async: true

  test "should have buttons with index", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/Design.CarouselExample.SelectIndex")

    assert view |> element("div.relative.w-80") |> has_element?()
    refute view |> element("#selected_index button.moon-right-arrow") |> has_element?()
    refute view |> element("#selected_index button.moon-left-arrow") |> has_element?()
    assert view |> element("#selected_index ul.moon-reel") |> has_element?()

    assert view
           |> element(
             "button.bg-transparent.cursor-pointer.hover\\:bg-heles.rounded-moon-i-sm.text-moon-14 "
           )
           |> has_element?()

    # assert view |> element("#default li.[value=6][visible=true]") |> has_element?()
    # TODO: seems not to recognize visible=true, because its JS?
  end

  # TODO: add screenshot test
end
