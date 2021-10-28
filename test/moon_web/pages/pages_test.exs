defmodule MoonWeb.Pages.PagesTest do
  use MoonWeb.ConnCase

  test "all pages open", %{conn: conn} do
    MoonWeb.Router.__routes__()
    |> Enum.each(fn route ->
      path = String.replace(route.path, ":theme_name", "lab-light")

      try do
        conn = get(conn, path)
        assert response(conn, 200)
      rescue
        e ->
          flunk("Error on page #{path}\n\n#{Map.get(e, :message, "Message not available")}")
      end
    end)
  end
end
