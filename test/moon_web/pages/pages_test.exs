defmodule MoonWeb.Pages.PagesTest do
  use MoonWeb.ConnCase, async: true

  test "all pages open", %{conn: conn} do
    MoonWeb.Router.__routes__()
    |> Enum.each(fn route ->
      path = String.replace(route.path, ":theme_name", "lab-light")

      conn = get(conn, path)
      assert response(conn, 200)
    end)
  end
end
