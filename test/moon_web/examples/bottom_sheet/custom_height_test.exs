defmodule MoonWeb.Examples.BottomSheet.CustomHeightTest do
  use MoonWeb.ConnCase, async: true

  test "should open and close BottomSheet", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/BottomSheetExample.CustomHeight")

    button_to_open_bottomsheet = view |> element("button.bg-piccolo[data-size=md]")
    assert button_to_open_bottomsheet |> render() =~ "Initialize uncloaking"

    assert view |> element("div.hidden[id=custom_height_bottom_sheet]") |> has_element?()

    button_to_open_bottomsheet |> render_click()

    assert view |> element("div[id=custom_height_bottom_sheet][data-is_open]") |> has_element?()
    assert view |> element("#custom_height_bottom_sheet div.moon-backdrop") |> has_element?()
    assert view |> element("#custom_height_bottom_sheet div.moon-drag-handle") |> has_element?()

    # TODO: add height test if needed-> assert view |> element("#custom_height_bottom_sheet div.h-[77%]") |> has_element?()

    button_to_close_bottomsheet = view |> element("button.bg-none[data-size=md]")
    assert button_to_close_bottomsheet |> render() =~ "I don&#39;t wanna see this"

    button_to_close_bottomsheet |> render_click()

    assert view |> element("div.hidden[id=custom_height_bottom_sheet]") |> has_element?()
  end

  # TODO: add test case for closing the bottomsheet panel on-click-away
  # TODO: add screenshot test
end
