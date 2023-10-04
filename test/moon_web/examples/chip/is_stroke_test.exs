defmodule MoonWeb.Examples.Chip.IsStrokeTest do
  use MoonWeb.ConnCase, async: true

  test "small chip with stroke", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/Design.ChipExample.IsStroke")

    assert view
           |> element(
             "button.h-8.gap-1.py-1.px-2.hover\\:shadow-interactive[data-testid=stroke_sm]"
           )
           |> has_element?()

    refute view |> element("button.h-10.gap-2.py-2.px-3[data-testid=stroke_sm]") |> has_element?()
  end

  test "medium chip with stroke", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/Design.ChipExample.IsStroke")

    refute view
           |> element(
             "button.h-8.gap-1.py-1.px-2.hover\\:shadow-interactive[data-testid=stroke_md]"
           )
           |> has_element?()

    assert view |> element("button.h-10.gap-2.py-2.px-3[data-testid=stroke_md]") |> has_element?()
  end

  # TODO: add screenshot test for default and hover state
end
