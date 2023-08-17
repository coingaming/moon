defmodule MoonWeb.Examples.Chip.DefaultTest do
  use MoonWeb.ConnCase, async: true

  test "default chip classes", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/ChipExample.Default")

    assert view
           |> element(
             "button.bg-gohan.text-bulma.hover\\:bg-jiren.hover\\:text-piccolo.h-10.gap-2.py-2.px-3"
           )
           |> has_element?()
  end

  # TODO: add screenshot test for default and hover state
end
