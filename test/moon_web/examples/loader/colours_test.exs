defmodule MoonWeb.Examples.Loader.ColoursTest do
  use MoonWeb.ConnCase, async: true

  test "Default loader", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/LoaderExample.Colours")

    assert view |> element("div.border-dodoria.animate-loader") |> has_element?()
    assert view |> element("div.border-trunks.animate-loader") |> has_element?()
    assert view |> element("div.border-raditz.animate-loader") |> has_element?()
  end
end
