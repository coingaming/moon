defmodule MoonWeb.Examples.BottomSheet.DifferentSizesTest do
  use MoonWeb.ConnCase, async: true

  test "should open and close Small BottomSheet", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/BottomSheetExample.DifferentSizes")

    button_to_open_bottomsheet = view |> element("button[data-testid=open_small]")
    assert button_to_open_bottomsheet |> render() =~ "Small Bottom Sheet (default)"
    assert view |> element("div.hidden[id=small_bottom_sheet]") |> has_element?()

    button_to_open_bottomsheet |> render_click()

    assert view |> element("div[id=small_bottom_sheet][data-is_open]") |> has_element?()
    assert view |> element("#small_bottom_sheet div.moon-backdrop") |> has_element?()
    button_to_close_bottomsheet = view |> element("button[data-testid=close_small]")
    assert button_to_close_bottomsheet |> render() =~ "Optional close"

    button_to_close_bottomsheet |> render_click()

    assert view |> element("div.hidden[id=small_bottom_sheet]") |> has_element?()
  end

  test "should open and close Medium BottomSheet", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/BottomSheetExample.DifferentSizes")

    button_to_open_bottomsheet = view |> element("button[data-testid=open_medium]")
    assert button_to_open_bottomsheet |> render() =~ "Medium Bottom Sheet"
    assert view |> element("div.hidden[id=medium_bottom_sheet]") |> has_element?()

    button_to_open_bottomsheet |> render_click()

    assert view |> element("div[id=medium_bottom_sheet][data-is_open]") |> has_element?()
    assert view |> element("#medium_bottom_sheet div.moon-backdrop") |> has_element?()
    button_to_close_bottomsheet = view |> element("button[data-testid=close_medium]")
    assert button_to_close_bottomsheet |> render() =~ "Optional close"

    button_to_close_bottomsheet |> render_click()

    assert view |> element("div.hidden[id=medium_bottom_sheet]") |> has_element?()
  end

  test "should open and close Full BottomSheet", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/BottomSheetExample.DifferentSizes")

    button_to_open_bottomsheet = view |> element("button[data-testid=open_full]")
    assert button_to_open_bottomsheet |> render() =~ "Fullscreen Bottom Sheet"
    assert view |> element("div.hidden[id=fullscreen_bottom_sheet]") |> has_element?()

    button_to_open_bottomsheet |> render_click()

    assert view |> element("div[id=fullscreen_bottom_sheet][data-is_open]") |> has_element?()
    assert view |> element("#fullscreen_bottom_sheet div.moon-backdrop") |> has_element?()
    button_to_close_bottomsheet = view |> element("button[data-testid=close_full]")
    assert button_to_close_bottomsheet |> render() =~ "Optional close"

    button_to_close_bottomsheet |> render_click()

    assert view |> element("div.hidden[id=fullscreen_bottom_sheet]") |> has_element?()
  end

  # TODO: add test case for closing the bottomsheet panel on-click-away
  # TODO: add screenshot test
end
