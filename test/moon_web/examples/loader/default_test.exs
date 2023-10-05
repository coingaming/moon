defmodule MoonWeb.Examples.Loader.DefaultTest do
  use MoonWeb.ConnCase, async: true

  test "Default loader", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/Design.LoaderExample.Default")

    assert view |> element("div.w-10.h-10") |> has_element?()
    assert view |> element("div.border-hit.animate-loader") |> has_element?()
  end
end
