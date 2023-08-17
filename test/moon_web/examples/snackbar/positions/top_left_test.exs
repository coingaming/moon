defmodule MoonWeb.Examples.Snackbar.Positions.TopLeftTest do
  use MoonWeb.ConnCase, async: true

  test "should be top left snackbar", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/SnackbarExample.Positions")

    assert view
           |> element(
             "div[id=snackbar_1][data-autoclose=true][data-timeout=5000][data-animate_class=animate-leftslide]"
           )
           |> has_element?()

    assert view
           |> element("#snackbar_1 div[data-testid=snackbar_1-trigger]")
           |> has_element?()

    assert view
           |> element("#snackbar_1 div.hidden.top-4.left-4[data-testid=snackbar_1-content]")
           |> has_element?()
  end

  # TODO: add screenshot test
end
