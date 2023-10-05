defmodule MoonWeb.Examples.Dropdown.Sizes.LargeTest do
  use MoonWeb.ConnCase, async: true

  test "option should be size lg", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/Design.DropdownExample.Sizes")

    assert view
           |> element("#drop-sizes-lg div[aria-haspopup=true]")
           |> has_element?()

    assert view |> element("#drop-sizes-lg div.hidden[role=listbox]") |> has_element?()

    assert view |> element("#drop-sizes-lg button.h-12.p-3.rounded-moon-i-sm") |> has_element?()

    refute view
           |> element("#drop-sizes-lg button.h-10.py-2.px-3.rounded-moon-i-sm")
           |> has_element?()

    refute view
           |> element("#drop-sizes-lg button.h-8.py-1.px-2.rounded-moon-i-xs")
           |> has_element?()
  end

  # TODO: add screenshot test of default state, hover state, open state, selected state
end
