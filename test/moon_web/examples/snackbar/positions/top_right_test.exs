defmodule MoonWeb.Examples.Snackbar.Positions.TopRightTest do
  use MoonWeb.ConnCase, async: true

  test "should be top left snackbar", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/SnackbarExample.Positions")

    assert view
           |> element(
             "div[id=snackbar_3][data-autoclose=true][data-timeout=5000][data-animate_class=animate-rightslide]"
           )
           |> has_element?()

    assert view
           |> element("#snackbar_3 div[data-testid=snackbar_3-trigger]")
           |> has_element?()

    assert view
           |> element(
             "#snackbar_3 div.hidden.top-4.right-4.justify-end[data-testid=snackbar_3-content]"
           )
           |> has_element?()
  end

  # TODO: add screenshot test
end
