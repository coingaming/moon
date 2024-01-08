defmodule MoonWeb.Schema.Link do
  @moduledoc "Some menu links listing to be used inside the site"

  # TODO: add Old Components pages if needed. Add Homepage.
  def pages() do
    [
      [MoonWeb.Pages.VisionPage, icon: "generic_loyalty"],
      [MoonWeb.Pages.GettingStartedPage, icon: "other_rocket"],
      [MoonWeb.Pages.HowToContributePage, icon: "other_lifebuoy"],
      [MoonWeb.Pages.ColoursPage, icon: "software_settings"],
      [MoonWeb.Pages.TokensPage, icon: "software_puzzle"],
      [MoonWeb.Pages.TypographyPage, icon: "text_size"],
      [MoonWeb.Pages.ComponentsPage, icon: "software_plate"],
      [MoonWeb.Pages.ManifestPage, icon: "generic_trophy"],
      MoonWeb.Pages.Design.AccordionPage,
      MoonWeb.Pages.Design.AlertPage,
      MoonWeb.Pages.Design.AvatarPage,
      MoonWeb.Pages.Design.BottomSheetPage,
      MoonWeb.Pages.Design.BreadcrumbPage,
      MoonWeb.Pages.Design.Button.ButtonPage,
      MoonWeb.Pages.Design.Button.IconButtonPage,
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
      MoonWeb.Pages.Design.Progress.LinearProgressPage,
      MoonWeb.Pages.Design.Progress.CircularProgressPage,
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
      MoonWeb.Pages.Design.Form.GroupPage,
      MoonWeb.Pages.Design.Form.InputPage,
      MoonWeb.Pages.Design.Form.InsetInputPage,
      MoonWeb.Pages.Design.Form.RadioPage,
      MoonWeb.Pages.Design.Form.SelectPage,
      MoonWeb.Pages.Design.Form.TextAreaPage
    ]
  end

  @doc "returns flat list of pages - for search purposes"
  def titles() do
    pages()
    |> Enum.map(fn
      [page | rest] -> [{:page, page}, {:key, page_to_title(page)} | rest]
      page -> [page: page, key: page_to_title(page)]
    end)
  end

  @doc "returns structured list of pages - for menu"
  def menu() do
    items = titles()

    items_with_icon = Enum.filter(items, fn item -> item[:icon] != nil end)
    items_without_icon = Enum.filter(items, fn item -> item[:icon] == nil end)

    sorted_items_without_icon =
      items_without_icon
      |> Enum.reduce(%{}, fn item, acc ->
        group = get_group(item[:page])
        acc |> Map.update(group, [item], &(&1 ++ [item]))
      end)
      |> Enum.map(fn {key, value} ->
        if length(value) == 1 do
          List.first(value)
        else
          [key: group_to_title(key), children: value]
        end
      end)
      |> Enum.sort_by(& &1[:key])

    sorted_items_without_icon ++ items_with_icon
  end

  defp get_group(page) do
    page
    |> to_string()
    |> String.split(".")
    |> Enum.slice(0..4)
    |> Enum.join(".")
  end

  defp page_to_title(page) do
    page
    |> to_string()
    |> String.replace(~r/.*\.([a-zA-Z]*)Page/, "\\1")
    |> String.replace(~r/([a-z])([A-Z])/, "\\1 \\2")
  end

  defp group_to_title(group) do
    group
    |> to_string()
    |> String.split(".")
    |> List.last()
  end
end
