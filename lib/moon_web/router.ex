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
  end

  scope "/" do
    live "/", Moon.Sites.MoonDocs.Pages.MainPage
  end

  scope "/sites/aposta10" do
    pipe_through :browser

    live "/", Moon.Sites.Aposta10.Pages.MainPage
    live "/tips/", Moon.Sites.Aposta10.Pages.TipsPage
    live "/tips/:tips_filter", Moon.Sites.Aposta10.Pages.TipsPage
  end
end
