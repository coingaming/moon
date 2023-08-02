defmodule MoonWeb.Examples.BottomSheet.DefaultTest do
  use MoonWeb.ConnCase, async: true

  test "should open and close BottomSheet", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/BottomSheetExample.Default")

    button_to_open_bottomsheet = view |> element("button[data-size=md]")
    assert button_to_open_bottomsheet |> render() =~ "My mind is ready"

    assert view |> element("div.hidden[id=default_bottom_sheet]") |> has_element?()

    button_to_open_bottomsheet |> render_click()

    assert view |> element("div[id=default_bottom_sheet][data-is_open]") |> has_element?()

    button_to_close_bottomsheet = view |> element("button[data-size=lg]")
    assert button_to_close_bottomsheet |> render() =~ "I am honestly done"

    button_to_close_bottomsheet |> render_click()

    assert view |> element("div.hidden[id=default_bottom_sheet]") |> has_element?()
  end

  # TODO: add test case for closing the bottomsheet panel on-click-away
  # TODO: add screenshot test
end
