defmodule MoonWeb.Router do
  use MoonWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {MoonWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through(:api)
    get("/healthcheck", MoonWeb.Controllers.HealthcheckController, :index)
  end

  scope "/" do
    pipe_through :browser

    live "/", MoonWeb.Pages.MainPage
    live "/tutorials/add-data-using-form", MoonWeb.Pages.Tutorials.AddDataUsingForm
    live "/assets/crests", MoonWeb.Pages.Assets.CrestsPage
    live "/assets/duotones", MoonWeb.Pages.Assets.DuotonesPage
    live "/assets/icons", MoonWeb.Pages.Assets.IconsPage
    live "/assets/logos", MoonWeb.Pages.Assets.LogosPage
    live "/assets/patterns", MoonWeb.Pages.Assets.PatternsPage
    live "/components/avatar", MoonWeb.Pages.Components.AvatarPage
    live "/components/badge", MoonWeb.Pages.Components.BadgePage
    live "/components/button", MoonWeb.Pages.Components.ButtonPage
    live "/components/checkbox", MoonWeb.Pages.Components.CheckboxPage

    live "/components/checkbox-multiselect",
         MoonWeb.Pages.Components.CheckboxMultiselectPage

    live "/components/inline", MoonWeb.Pages.Components.InlinePage
    live "/components/link", MoonWeb.Pages.Components.LinkPage
    live "/components/select", MoonWeb.Pages.Components.SelectPage
    live "/components/stack", MoonWeb.Pages.Components.StackPage
    live "/components/text", MoonWeb.Pages.Components.TextPage
    live "/components/text_input", MoonWeb.Pages.Components.TextInputPage
  end

  # Other scopes may use custom stacks.
  # scope "/api", MoonWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: MoonWeb.Telemetry
    end
  end
end
