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

  Enum.each(["/:theme_name", "/"], fn theme_path ->
    scope theme_path do
      pipe_through :browser

      live "/", MoonWeb.Pages.Tutorials.Introduction
      live "/assets/crests", MoonWeb.Pages.Assets.CrestsPage
      live "/assets/currencies", MoonWeb.Pages.Assets.CurrenciesPage
      live "/assets/duotones", MoonWeb.Pages.Assets.DuotonesPage
      live "/assets/icons", MoonWeb.Pages.Assets.IconsPage
      live "/assets/logos", MoonWeb.Pages.Assets.LogosPage
      live "/assets/patterns", MoonWeb.Pages.Assets.PatternsPage
      live "/components/accordion", MoonWeb.Pages.Components.AccordionPage
      live "/components/avatar", MoonWeb.Pages.Components.AvatarPage
      live "/components/badge", MoonWeb.Pages.Components.BadgePage
      live "/components/button", MoonWeb.Pages.Components.ButtonPage
      live "/components/carousel", MoonWeb.Pages.Components.CarouselPage
      live "/components/checkbox", MoonWeb.Pages.Components.CheckboxPage

      live "/components/checkbox-multiselect",
           MoonWeb.Pages.Components.CheckboxMultiselectPage

      live "/components/dropdown", MoonWeb.Pages.Components.DropdownPage
      live "/components/heading", MoonWeb.Pages.Components.HeadingPage
      live "/components/link", MoonWeb.Pages.Components.LinkPage
      live "/components/pagination", MoonWeb.Pages.Components.PaginationPage
      live "/components/select", MoonWeb.Pages.Components.SelectPage
      live "/components/stack", MoonWeb.Pages.Components.StackPage
      live "/components/switch", MoonWeb.Pages.Components.SwitchPage
      live "/components/tabs", MoonWeb.Pages.Components.TabsPage
      live "/components/tabs/:tab_id", MoonWeb.Pages.Components.TabsPage
      live "/components/text", MoonWeb.Pages.Components.TextPage
      live "/components/text_input", MoonWeb.Pages.Components.TextInputPage

      live "/tutorials/add-data-using-form", MoonWeb.Pages.Tutorials.AddDataUsingForm
      live "/tutorials/installation", MoonWeb.Pages.Tutorials.Installation

      live "/tutorials/process-description-and-team-interactions",
           MoonWeb.Pages.Tutorials.Introduction

      live "/tutorials/theming-and-visuals", MoonWeb.Pages.Tutorials.ThemingAndVisuals
    end
  end)

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
