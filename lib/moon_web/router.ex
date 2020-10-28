defmodule MoonWeb.Router do
  use MoonWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    # plug :put_root_layout, {MoonWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :browser

    live "/", Moon.Sites.MoonDocs.Pages.MainPage
    live "/tutorials/add-data-using-form", Moon.Sites.MoonDocs.Pages.Tutorials.AddDataUsingForm
    live "/assets/crests", Moon.Sites.MoonDocs.Pages.Assets.CrestsPage
    live "/assets/duotones", Moon.Sites.MoonDocs.Pages.Assets.DuotonesPage
    live "/assets/icons", Moon.Sites.MoonDocs.Pages.Assets.IconsPage
    live "/assets/logos", Moon.Sites.MoonDocs.Pages.Assets.LogosPage
    live "/assets/patterns", Moon.Sites.MoonDocs.Pages.Assets.PatternsPage
    live "/components/avatar", Moon.Sites.MoonDocs.Pages.Components.AvatarPage
    live "/components/badge", Moon.Sites.MoonDocs.Pages.Components.BadgePage
    live "/components/button", Moon.Sites.MoonDocs.Pages.Components.ButtonPage
    live "/components/checkbox", Moon.Sites.MoonDocs.Pages.Components.CheckboxPage

    live "/components/checkbox-multiselect",
         Moon.Sites.MoonDocs.Pages.Components.CheckboxMultiselectPage

    live "/components/inline", Moon.Sites.MoonDocs.Pages.Components.InlinePage
    live "/components/link", Moon.Sites.MoonDocs.Pages.Components.LinkPage
    live "/components/select", Moon.Sites.MoonDocs.Pages.Components.SelectPage
    live "/components/stack", Moon.Sites.MoonDocs.Pages.Components.StackPage
    live "/components/text", Moon.Sites.MoonDocs.Pages.Components.TextPage
    live "/components/text_input", Moon.Sites.MoonDocs.Pages.Components.TextInputPage
    live "/themes/list-of-themes", Moon.Sites.MoonDocs.Pages.Themes.ListOfThemes
  end

  scope "/sites/aposta10" do
    pipe_through :browser

    live "/", Moon.Sites.Aposta10.Pages.MainPage
    live "/tips/", Moon.Sites.Aposta10.Pages.TipsPage
    live "/tips/:tips_filter", Moon.Sites.Aposta10.Pages.TipsPage
  end
end
