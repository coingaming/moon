defmodule MoonWeb.Examples.Switch.DefaultTest do
  use MoonWeb.ConnCase, async: true

  test "should switch", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/Design.SwitchExample.Default")

    assert view
           |> element(
             "button.bg-piccolo.h-8.p-1.rounded-full.transition[class~=\"w-[3.75rem]\"][aria-pressed=true][value=false]"
           )
           |> has_element?()

    assert view
           |> element(
             "span.w-6.h-6.bg-goten[class~=\"ltr:left-[calc(100%-24px)]\", \"rtl:right-[calc(100%-24px)]\"][aria-hidden=true]"
           )
           |> has_element?()

    view
    |> element(
      "button.bg-piccolo.h-8.p-1.rounded-full.transition[class~=\"w-[3.75rem]\"][aria-pressed=true][value=false]"
    )
    |> render_click()

    assert view
           |> element(
             "button.bg-beerus.h-8.p-1.rounded-full.transition[class~=\"w-[3.75rem]\"][aria-pressed=false][value=true]"
           )
           |> has_element?()

    assert view
           |> element("span.ltr\\:left-0.rtl\\:right-0[aria-hidden=true]")
           |> has_element?()

    view
    |> element(
      "button.bg-beerus.h-8.p-1.rounded-full.transition[class~=\"w-[3.75rem]\"][aria-pressed=false][value=true]"
    )
    |> render_click()

    assert view
           |> element(
             "button.bg-piccolo.h-8.p-1.rounded-full.transition[class~=\"w-[3.75rem]\"][aria-pressed=true][value=false]"
           )
           |> has_element?()

    assert view
           |> element(
             "span[class~=\"ltr:left-[calc(100%-24px)]\", \"rtl:right-[calc(100%-24px)]\", \"w-6\", \"bg-goten\"][aria-hidden=true]"
           )
           |> has_element?()
  end

  # TODO: add screenshot test
end
