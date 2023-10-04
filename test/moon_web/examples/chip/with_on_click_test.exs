defmodule MoonWeb.Examples.Chip.WithOnClickTest do
  use MoonWeb.ConnCase, async: true

  test "should change", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/Design.ChipExample.WithOnClick")

    chip = view |> element("button.bg-goku")
    assert chip |> render() =~ "Click me!"

    chip |> render_click()

    chip = view |> element("button.bg-goku")
    assert chip |> render() =~ "Chip clicked!"
  end

  # TODO: add screenshot test for default and hover state
end
