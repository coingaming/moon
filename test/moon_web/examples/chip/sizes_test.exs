defmodule MoonWeb.Examples.Chip.SizesTest do
  use MoonWeb.ConnCase, async: true

  test "small chip classes", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/Design.ChipExample.Sizes")

    assert view |> element("button.h-8.gap-1.py-1.px-2[data-testid=small]") |> has_element?()
    refute view |> element("button.h-10.gap-2.py-2.px-3[data-testid=small]") |> has_element?()
  end

  test "medium chip classes", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/Design.ChipExample.Sizes")

    refute view |> element("button.h-8.gap-1.py-1.px-2[data-testid=medium]") |> has_element?()
    assert view |> element("button.h-10.gap-2.py-2.px-3[data-testid=medium]") |> has_element?()
  end

  # TODO: add screenshot test for default and hover state
end
