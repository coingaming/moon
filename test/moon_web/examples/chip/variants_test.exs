defmodule MoonWeb.Examples.Chip.VariantsTest do
  use MoonWeb.ConnCase, async: true

  test "should be ghost chip", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/ChipExample.Variants")

    assert view
           |> element(
             "button.bg-none.text-bulma.hover\\:bg-jiren.hover\\:text-piccolo[data-testid=ghost]"
           )
           |> has_element?()

    refute view
           |> element(
             "button.bg-goku.text-bulma.hover\\:bg-jiren.hover\\:text-piccolo[data-testid=ghost]"
           )
           |> has_element?()
  end

  # TODO: add screenshot test for default and hover state
end
