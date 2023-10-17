defmodule MoonWeb.Examples.Loader.SizesTest do
  use MoonWeb.ConnCase, async: true

  test "Loaders with different sizes", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/Design.LoaderExample.Sizes")

    assert view |> element("div.w-4.h-4") |> has_element?()
    assert view |> element("div.w-6.h-6") |> has_element?()
    assert view |> element("div.w-8.h-8") |> has_element?()
    assert view |> element("div.w-10.h-10") |> has_element?()
    assert view |> element("div.w-12.h-12") |> has_element?()
  end
end
