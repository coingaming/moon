defmodule MoonWeb.Examples.Switch.SizesTest do
  use MoonWeb.ConnCase, async: true

  test "should be 2xs", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/Design.SwitchExample.Sizes")

    assert view
           |> element(
             "button.bg-beerus.h-4.w-7.rounded-full.transition[class~=\"p-0.5\"][aria-pressed=false][value=true][data-testid=2xs]"
           )
           |> has_element?()

    assert view
           |> element("#[data-testid=2xs] span.w-3.h-3.ltr\\:left-0.rtl\\:right-0")
           |> has_element?()

    view
    |> element(
      "button.bg-beerus.h-4.w-7.rounded-full.transition[class~=\"p-0.5\"][aria-pressed=false][value=true][data-testid=2xs]"
    )
    |> render_click()

    assert view
           |> element(
             "#[data-testid=2xs] span.w-3.h-3[class~=\"ltr:left-[calc(100%-12px)]\", \"rtl:right-[calc(100%-12px)]\"]"
           )
           |> has_element?()
  end

  test "should be xs", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/Design.SwitchExample.Sizes")

    assert view
           |> element(
             "button.bg-piccolo.h-6.w-11.p-1.rounded-full.transition[aria-pressed=true][value=false][data-testid=xs]"
           )
           |> has_element?()

    assert view
           |> element(
             "#[data-testid=xs] span.w-4.h-4[class~=\"ltr:left-[calc(100%-16px)]\", \"rtl:right-[calc(100%-16px)]\"]"
           )
           |> has_element?()

    view
    |> element("button.bg-piccolo.h-6.w-11.p-1.rounded-full.transition[data-testid=xs]")
    |> render_click()

    assert view
           |> element("#[data-testid=xs] span.w-4.h-4.ltr\\:left-0.rtl\\:right-0")
           |> has_element?()
  end

  test "should be md", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/Design.SwitchExample.Sizes")

    assert view
           |> element(
             "button.bg-beerus.h-8.p-1.rounded-full.transition[class~=\"w-[3.75rem]\"][aria-pressed=false][value=true][data-testid=default]"
           )
           |> has_element?()

    assert view
           |> element("#[data-testid=default] span.w-6.h-6.ltr\\:left-0.rtl\\:right-0")
           |> has_element?()

    view
    |> element(
      "button.bg-beerus.h-8.p-1.rounded-full.transition[class~=\"w-[3.75rem]\"][aria-pressed=false][value=true][data-testid=default]"
    )
    |> render_click()

    assert view
           |> element(
             "#[data-testid=default] span.w-6.h-6[class~=\"ltr:left-[calc(100%-24px)]\", \"rtl:right-[calc(100%-24px)]\"]"
           )
           |> has_element?()
  end

  # TODO: add screenshot test
end
