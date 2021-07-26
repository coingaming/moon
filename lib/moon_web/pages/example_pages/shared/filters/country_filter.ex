defmodule MoonWeb.Pages.ExamplePages.Shared.Filters.CountryFilter do
  use MoonWeb, :stateless_component

  alias Moon.Components.Chip
  alias Moon.ComponentsV2.DropdownMultiFilter
  alias MoonWeb.Pages.ExamplePages.Helpers
  alias MoonWeb.MockDB.Countries

  @default_name "country_filter"

  prop name, :string, default: @default_name
  prop active_items, :list, required: true

  def render(assigns) do
    ~F"""
    <DropdownMultiFilter
      id={@name}
      all_items={all_items()}
      active_items={@active_items}
      :let={toggle_filter: toggle_filter}
    >
      <Chip on_click={toggle_filter} value="country" right_icon="icon_chevron_down_rounded">
        {"Country #{length(@active_items) |> Helpers.format_filter_count()}"}
      </Chip>
    </DropdownMultiFilter>
    """
  end

  def clear(name \\ @default_name) do
    DropdownMultiFilter.clear(name)
  end

  def close(name \\ @default_name) do
    DropdownMultiFilter.close(name)
  end

  # Cache this in memeory
  defp all_items() do
    Countries.list_all() |> Enum.map(&%{label: &1.name, value: &1.name})
  end
end
