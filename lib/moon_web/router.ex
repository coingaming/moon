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

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard"
    end
  end

  Enum.each(["/", "/:theme_name"], fn theme_path ->
    scope theme_path do
      pipe_through :browser

      live "/", MoonWeb.Pages.Tutorials.Introduction
      live "/assets/crests", MoonWeb.Pages.Assets.CrestsPage
      live "/assets/currencies", MoonWeb.Pages.Assets.CurrenciesPage
      live "/assets/duotones", MoonWeb.Pages.Assets.DuotonesPage
      live "/assets/icons", MoonWeb.Pages.Assets.IconsPage
      live "/icons", MoonWeb.Pages.IconsPage
      live "/assets/logos", MoonWeb.Pages.Assets.LogosPage
      live "/assets/patterns", MoonWeb.Pages.Assets.PatternsPage
      live "/components/accordion", MoonWeb.Pages.Components.AccordionPage
      live "/components/avatar", MoonWeb.Pages.Components.AvatarPage
      live "/components/button", MoonWeb.Pages.Components.ButtonPage
      live "/components/calendar", MoonWeb.Pages.Components.CalendarPage
      live "/components/card", MoonWeb.Pages.Components.CardPage
      live "/components/carousel", MoonWeb.Pages.Components.CarouselPage
      live "/components/checkbox", MoonWeb.Pages.Components.CheckboxPage

      live "/components/checkbox-multiselect",
           MoonWeb.Pages.Components.CheckboxMultiselectPage

      live "/components/datepicker", MoonWeb.Pages.Components.DatepickerPage
      live "/components/drawer", MoonWeb.Pages.Components.DrawerPage
      live "/components/dropdown", MoonWeb.Pages.Components.DropdownPage
      live "/components/dropdown_menu_button", MoonWeb.Pages.Components.DropdownMenuButtonPage
      live "/components/file-input", MoonWeb.Pages.Components.FileInputPage
      live "/components/heading", MoonWeb.Pages.Components.HeadingPage
      live "/components/label", MoonWeb.Pages.Components.LabelPage
      live "/components/link", MoonWeb.Pages.Components.LinkPage
      live "/components/list_items", MoonWeb.Pages.Components.ListItemsPage
      live "/components/pagination", MoonWeb.Pages.Components.PaginationPage
      live "/components/password_input", MoonWeb.Pages.Components.PasswordInputPage
      live "/components/popover", MoonWeb.Pages.Components.PopoverPage
      live "/components/select", MoonWeb.Pages.Components.SelectPage
      live "/components/select/multi-select", MoonWeb.Pages.Components.Select.MultiSelectPage
      live "/components/select/single-select", MoonWeb.Pages.Components.Select.SingleSelectPage
      live "/components/sidebar", MoonWeb.Pages.Components.SidebarPage
      live "/components/switch", MoonWeb.Pages.Components.SwitchPage
      live "/components/switcher", MoonWeb.Pages.Components.SwitcherPage
      live "/components/tabs", MoonWeb.Pages.Components.TabsPage
      live "/components/tabs/:tab_id", MoonWeb.Pages.Components.TabsPage
      live "/components/text", MoonWeb.Pages.Components.TextPage
      live "/components/text_input", MoonWeb.Pages.Components.TextInputPage
      live "/components/toast", MoonWeb.Pages.Components.ToastPage
      live "/components/tooltip", MoonWeb.Pages.Components.TooltipPage
      live "/components/dialog/modal", MoonWeb.Pages.Components.Dialog.ModalPage

      live "/charts/line-chart", MoonWeb.Pages.Components.LineChartPage

      live "/tutorials/add-data-using-form", MoonWeb.Pages.Tutorials.AddDataUsingForm
      live "/tutorials/installation", MoonWeb.Pages.Tutorials.Installation

      live "/tutorials/process-description-and-team-interactions",
           MoonWeb.Pages.Tutorials.Introduction

      live "/tutorials/theming-and-visuals", MoonWeb.Pages.Theming.ThemingAndVisuals

      live "/example-pages/dashboard", MoonWeb.Pages.ExamplePages.DashboardPage
      live "/example-pages/transactions", MoonWeb.Pages.ExamplePages.TransactionsPage
      live "/example-pages/marketing", MoonWeb.Pages.ExamplePages.MarketingPage
      live "/example-pages/affiliates", MoonWeb.Pages.ExamplePages.AffiliatesPage
      live "/example-pages/customers", MoonWeb.Pages.ExamplePages.CustomersPage
    end
  end)
end
