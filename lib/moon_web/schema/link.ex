defmodule MoonWeb.Schema.Link do
  @doc "Some menu links listing to be used inside the site"

  # TODO: add all pages here - Old Components and other accordions (except Form)
  def pages() do
    [
      [MoonWeb.Pages.VisionPage, icon: "generic_loyalty"],
      [MoonWeb.Pages.GettingStartedPage, icon: "other_rocket"],
      [MoonWeb.Pages.ContributePage, icon: "other_lifebuoy"],
      [MoonWeb.Pages.ColoursPalettePage, icon: "software_settings"],
      [MoonWeb.Pages.TokensPage, icon: "software_puzzle"],
      [MoonWeb.Pages.TypographyPage, icon: "text_size"],
      [MoonWeb.Pages.ComponentPage, icon: "software_plate"],
      [MoonWeb.Pages.ManifestPage, icon: "generic_trophy"],
      MoonWeb.Pages.Design.AccordionPage,
      MoonWeb.Pages.Design.AlertPage,
      MoonWeb.Pages.Design.BottomSheetPage,
      MoonWeb.Pages.Design.AvatarPage,
      MoonWeb.Pages.Design.BreadcrumbPage,
      MoonWeb.Pages.Design.CarouselPage,
      MoonWeb.Pages.Design.ChipPage,
      MoonWeb.Pages.Design.DrawerPage,
      MoonWeb.Pages.Design.DropdownPage,
      MoonWeb.Pages.Components.IconsPage,
      MoonWeb.Pages.Design.LoaderPage,
      MoonWeb.Pages.Design.MenuItemPage,
      MoonWeb.Pages.Design.ModalPage,
      MoonWeb.Pages.Design.PaginationPage,
      MoonWeb.Pages.Design.PopoverPage,
      MoonWeb.Pages.Design.SearchPage,
      MoonWeb.Pages.Design.SnackbarPage,
      MoonWeb.Pages.Design.SwitchPage,
      MoonWeb.Pages.Design.TablePage,
      MoonWeb.Pages.Design.TabsPage,
      MoonWeb.Pages.Design.TagPage,
      MoonWeb.Pages.Design.TooltipPage,
      MoonWeb.Pages.Design.Form.AuthCodePage,
      MoonWeb.Pages.Design.Form.CheckboxPage,
      MoonWeb.Pages.Design.Form.ComboboxPage,
      MoonWeb.Pages.Design.Form.DropdownPage,
      MoonWeb.Pages.Design.Form.GroupPage,
      MoonWeb.Pages.Design.Form.InputPage,
      MoonWeb.Pages.Design.Form.InsetInputPage,
      MoonWeb.Pages.Design.Form.RadioPage,
      MoonWeb.Pages.Design.Form.SelectPage,
      MoonWeb.Pages.Design.Form.TextAreaPage
    ]
  end

  def titles() do
    pages()
    |> Enum.map(fn
      [page | rest] -> [{:page, page}, {:key, page_to_title(page)} | rest]
      page -> [page: page, key: page_to_title(page)]
    end)
  end

  defp page_to_title(page) do
    page
    |> to_string()
    |> String.replace(~r/.*\.([a-zA-Z]*)Page/, "\\1")
    |> String.replace(~r/([a-z])([A-Z])/, "\\1 \\2")
  end
end
