defmodule MoonWeb.Examples.Dropdown.ResponsiveDropdownTest do
  use MoonWeb.ConnCase, async: true

  test "should act as bottomsheet on small screens", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/Design.DropdownExample.ResponsiveDropdown")

    assert view
           |> element("#responsive-dropdown div[aria-haspopup=true]")
           |> has_element?()

    assert view
           |> element("#responsive-dropdown div[role=listbox][class*=\"translate-y-full\"]")
           |> has_element?()

    assert view
           |> element(
             "#responsive-dropdown div.bottom-0.fixed.inset-x-0.md\\:absolute.md\\:bottom-auto.md\\:my-2.md\\:rounded-moon-s-md.md\\:top-full.rounded-t-xl"
           )
           |> has_element?()
  end

  # TODO: add screenshot test of default state, hover state, open state, selected state
end
