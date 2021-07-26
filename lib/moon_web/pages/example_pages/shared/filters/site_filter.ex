defmodule MoonWeb.Pages.ExamplePages.Shared.Filters.SiteFilter do
  use MoonWeb, :stateless_component

  alias Moon.ComponentsV2.DropdownMultiFilter
  alias Moon.Components.Chip
  alias MoonWeb.Pages.ExamplePages.Helpers
  alias MoonWeb.MockDB.Sites

  @default_name "site_filter"

  prop name, :string, default: @default_name
  prop active_items, :list, required: true

  def render(assigns) do
    ~F"""
    <DropdownMultiFilter
      id={@name}
      all_items={all_items()}
      active_items={@active_items}
      disable_search={true}
      :let={toggle_filter: toggle_filter}
    >
      <Chip on_click={toggle_filter} value="site" right_icon="icon_chevron_down_rounded">
        {"Brands #{length(@active_items) |> Helpers.format_filter_count()}"}
      </Chip>
    </DropdownMultiFilter>
    """
  end

  def clear(name \\ @default_name) do
    DropdownMultiFilter.clear(name)
  end

  # Cache this in memeory
  defp all_items() do
    Sites.list_all() |> Enum.map(&%{label: &1.name, value: &1.name})
  end
end
