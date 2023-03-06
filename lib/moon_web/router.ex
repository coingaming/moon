defmodule MoonWeb.Router do
  use MoonWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_live_flash)
    plug(:put_root_layout, {MoonWeb.LayoutView, :root})
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
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
      pipe_through(:browser)
      live_dashboard("/dashboard")
    end
  end

  live_session :default, on_mount: MoonWeb.Hooks.SetGlobalParams do
    Enum.each(["/", "/:theme_name/:direction"], fn theme_path ->
      scope theme_path do
        pipe_through(:browser)

        live("/", MoonWeb.Pages.MainPage)
        live("/vision", MoonWeb.Pages.VisionPage)
        live("/getting-started", MoonWeb.Pages.GettingStartedPage)
        live("/contribute", MoonWeb.Pages.ContributePage)
        live("/colours", MoonWeb.Pages.ColoursPalettePage)
        live("/tokens", MoonWeb.Pages.TokensPage)
        live("/assets/age_limit", MoonWeb.Pages.Assets.AgeLimitPage)
        live("/assets/crests", MoonWeb.Pages.Assets.CrestsPage)
        live("/assets/currencies", MoonWeb.Pages.Assets.CurrenciesPage)
        live("/assets/duotones", MoonWeb.Pages.Assets.DuotonesPage)
        live("/assets/icons", MoonWeb.Pages.Assets.IconsPage)
        live("/manifest", MoonWeb.Pages.ManifestPage)
        live("/assets/logos", MoonWeb.Pages.Assets.LogosPage)
        live("/assets/patterns", MoonWeb.Pages.Assets.PatternsPage)

        live("/components/v2/accordion/", MoonWeb.Pages.Design.AccordionPage)
        live("/components/v2/breadcrumb/", MoonWeb.Pages.Design.BreadcrumbPage)
        live("/components/v2/button/", MoonWeb.Pages.Design.ButtonPage)
        live("/components/v2/chip/", MoonWeb.Pages.Design.ChipPage)
        live("/components/v2/circularprogress/", MoonWeb.Pages.Design.CircularProgressPage)
        live("/components/v2/dropdown/", MoonWeb.Pages.Design.DropdownPage)
        live("/components/v2/form/select", MoonWeb.Pages.Design.Form.SelectPage)
        live("/components/v2/form/textarea", MoonWeb.Pages.Design.Form.TextareaPage)
        live("/components/v2/icon-button", MoonWeb.Pages.Design.Button.IconButtonPage)
        live("/components/v2/loader", MoonWeb.Pages.Design.LoaderPage)
        live("/components/v2/menu_item", MoonWeb.Pages.Design.MenuItemPage)
        live("/components/v2/modal", MoonWeb.Pages.Design.ModalPage)
        live("/components/v2/popover", MoonWeb.Pages.Design.PopoverPage)
        live("/components/v2/progress", MoonWeb.Pages.Design.ProgressPage)
        live("/components/v2/snackbar", MoonWeb.Pages.Design.SnackbarPage)
        live("/components/v2/switch", MoonWeb.Pages.Design.SwitchPage)
        live("/components/v2/table", MoonWeb.Pages.Design.TablePage)
        live("/components/v2/tabs", MoonWeb.Pages.Design.TabsPage)
        live("/components/v2/tag", MoonWeb.Pages.Design.TagPage)
        live("/components/v2/tooltip", MoonWeb.Pages.Design.TooltipPage)

        live("/components/accordion", MoonWeb.Pages.Components.AccordionPage)
        live("/components/avatar", MoonWeb.Pages.Components.AvatarPage)
        live("/components/banner", MoonWeb.Pages.Components.BannerPage)
        live("/components/breadcrumb", MoonWeb.Pages.Components.BreadcrumbPage)
        live("/components/button", MoonWeb.Pages.Components.ButtonPage)
        live("/components/calendar", MoonWeb.Pages.Components.CalendarPage)
        live("/components/card", MoonWeb.Pages.Components.CardPage)
        live("/components/carousel", MoonWeb.Pages.Components.CarouselPage)

        live("/components/charts/geo-map", MoonWeb.Pages.Components.Charts.GeoMapPage)
        live("/components/charts/pie", MoonWeb.Pages.Components.Charts.PiePage)
        live("/components/charts/line-chart", MoonWeb.Pages.Components.Charts.LineChartPage)
        live("/components/charts/table", MoonWeb.Pages.Components.Charts.TablePage)
        live("/components/charts/vertical-bar", MoonWeb.Pages.Components.Charts.VerticalBarPage)

        live("/components/checkbox", MoonWeb.Pages.Components.CheckboxPage)
        live("/components/chip", MoonWeb.Pages.Components.ChipPage)
        live("/components/country-flags", MoonWeb.Pages.Components.CountryFlagsPage)

        live("/components/date/datepicker", MoonWeb.Pages.Components.Date.DatepickerPage)
        live("/components/date/single-date", MoonWeb.Pages.Components.Date.SingleDatePage)
        live("/components/date/range-date", MoonWeb.Pages.Components.Date.RangeDatePage)

        live("/components/dialog/modal", MoonWeb.Pages.Components.Dialog.ModalPage)
        live("/components/dialog/dialog-content", MoonWeb.Pages.Components.Dialog.ContentPage)
        live("/components/dialog/dialog-overlay", MoonWeb.Pages.Components.Dialog.OverlayPage)
        live("/components/dialog/dialog-header", MoonWeb.Pages.Components.Dialog.HeaderPage)
        live("/components/dialog/dialog-footer", MoonWeb.Pages.Components.Dialog.FooterPage)
        live("/components/dialog/popover", MoonWeb.Pages.Components.Dialog.PopoverPage)

        live(
          "/components/checkbox-multiselect",
          MoonWeb.Pages.Components.CheckboxMultiselectPage
        )

        live("/components/dropdown_menu_button", MoonWeb.Pages.Components.DropdownMenuButtonPage)

        live("/components/drawer", MoonWeb.Pages.Components.DrawerPage)
        live("/components/file-input", MoonWeb.Pages.Components.FileInputPage)
        live("/components/icons", MoonWeb.Pages.Components.IconsPage)
        live("/components/label", MoonWeb.Pages.Components.LabelPage)
        live("/components/link", MoonWeb.Pages.Components.LinkPage)
        live("/components/list_items", MoonWeb.Pages.Components.ListItemsPage)
        live("/components/loader", MoonWeb.Pages.Components.LoaderPage)
        live("/components/pagination", MoonWeb.Pages.Components.PaginationPage)

        live("/components/progress/circular", MoonWeb.Pages.Components.Progress.CircularPage)
        live("/components/progress/linear", MoonWeb.Pages.Components.Progress.LinearPage)

        live("/components/radio-button", MoonWeb.Pages.Components.RadioButtonPage)
        live("/components/search", MoonWeb.Pages.Components.SearchPage)

        #
        live("/components/select/dropdown", MoonWeb.Pages.Components.Select.DropdownPage)
        live("/components/select", MoonWeb.Pages.Components.Select.SelectPage)
        live("/components/select/single-select", MoonWeb.Pages.Components.Select.SingleSelectPage)
        live("/components/select/multi-select", MoonWeb.Pages.Components.Select.MultiSelectPage)

        live("/components/sidebar", MoonWeb.Pages.Components.SidebarPage)
        live("/components/switch", MoonWeb.Pages.Components.SwitchPage)
        live("/components/switcher", MoonWeb.Pages.Components.SwitcherPage)
        live("/components/tabs", MoonWeb.Pages.Components.TabsPage)
        live("/components/tabs/:tab_id", MoonWeb.Pages.Components.TabsPage)
        live("/components/table", MoonWeb.Pages.Components.TablePage)

        live("/components/text-input", MoonWeb.Pages.Components.TextInputPage)

        live("/components/input-group", MoonWeb.Pages.Components.InputGroupPage)
        live("/components/toast", MoonWeb.Pages.Components.ToastPage)
        live("/components/tooltip", MoonWeb.Pages.Components.TooltipPage)

        live("/components/typography", MoonWeb.Pages.Components.TypographyPage)
        live("/components/typography/caption", MoonWeb.Pages.Components.Typography.CaptionPage)
        live("/components/typography/heading", MoonWeb.Pages.Components.Typography.HeadingPage)
        live("/components/typography/text", MoonWeb.Pages.Components.Typography.TextPage)

        live("/tutorials/add-data-using-form", MoonWeb.Pages.Tutorials.AddDataUsingForm)
        live("/tutorials/installation", MoonWeb.Pages.Tutorials.Installation)

        live(
          "/tutorials/process-description-and-team-interactions",
          MoonWeb.Pages.Tutorials.Introduction
        )

        live("/tutorials/theming-and-visuals", MoonWeb.Pages.Theming.ThemingAndVisuals)

        live("/usage_with_phoenix_templates", MoonWeb.Pages.PhoenixUsagePage)
        live("/test/live", MoonWeb.Pages.Test.LivePage)
      end
    end)
  end
end
