defmodule MoonWeb.Examples.BottomSheet.WithTitleTest do
  use MoonWeb.ConnCase, async: true

  test "should open and close Title BottomSheet", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/BottomSheetExample.WithTitle")

    button_to_open_bottomsheet = view |> element("button[data-testid=open_title]")
    assert button_to_open_bottomsheet |> render() =~ "Bottom Sheet with Title"

    assert view |> element("div.hidden[id=title_bottom_sheet]") |> has_element?()

    button_to_open_bottomsheet |> render_click()

    assert view |> element("div[id=title_bottom_sheet][data-is_open]") |> has_element?()
  end

  test "should open and close Title&Draghandle BottomSheet", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/BottomSheetExample.WithTitle")

    button_to_open_bottomsheet = view |> element("button[data-testid=open_title_draghandle]")
    assert button_to_open_bottomsheet |> render() =~ "Bottom Sheet with Title and Draghandle"

    assert view |> element("div.hidden[id=title_draghandle_bottom_sheet]") |> has_element?()

    button_to_open_bottomsheet |> render_click()

    assert view
           |> element("div[id=title_draghandle_bottom_sheet][data-is_open]")
           |> has_element?()

    assert view
           |> element("#title_draghandle_bottom_sheet div.moon-drag-handle")
           |> has_element?()
  end

  # TODO: add test case for closing the bottomsheet panel on-click-away
  # TODO: add screenshot test
end
