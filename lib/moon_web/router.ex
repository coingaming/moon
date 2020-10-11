defmodule MoonWeb.Router do
  use Phoenix.Router
  import Plug.Conn
  import Phoenix.Controller
  import Phoenix.LiveView.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :put_user_token
  end

  defp put_user_token(conn, _) do
    if current_user = conn.assigns[:current_user] do
      token = Phoenix.Token.sign(conn, "user socket", current_user.id)
      IO.puts("Generated user token: #{token}")
      assign(conn, :user_token, token)
    else
      assign(conn, :user_token, "hello")
    end
  end

  scope "/" do
    pipe_through :browser

    live "/", Moon.Sites.MoonDocs.Pages.MainPage
    live "/assets/crests", Moon.Sites.MoonDocs.Pages.Assets.CrestsPage
    live "/assets/duotones", Moon.Sites.MoonDocs.Pages.Assets.DuotonesPage
    live "/assets/icons", Moon.Sites.MoonDocs.Pages.Assets.IconsPage
    live "/assets/logos", Moon.Sites.MoonDocs.Pages.Assets.LogosPage
    live "/assets/patterns", Moon.Sites.MoonDocs.Pages.Assets.PatternsPage

    live "/components/badge", Moon.Sites.MoonDocs.Pages.Components.BadgePage
    live "/components/button", Moon.Sites.MoonDocs.Pages.Components.ButtonPage
    live "/components/inline", Moon.Sites.MoonDocs.Pages.Components.InlinePage
    live "/components/link", Moon.Sites.MoonDocs.Pages.Components.LinkPage
    live "/components/stack", Moon.Sites.MoonDocs.Pages.Components.StackPage
    live "/components/text", Moon.Sites.MoonDocs.Pages.Components.TextPage
    live "/components/text_input", Moon.Sites.MoonDocs.Pages.Components.TextInputPage
  end

  scope "/sites/aposta10" do
    pipe_through :browser

    live "/", Moon.Sites.Aposta10.Pages.MainPage
    live "/tips/", Moon.Sites.Aposta10.Pages.TipsPage
    live "/tips/:tips_filter", Moon.Sites.Aposta10.Pages.TipsPage
  end
end
