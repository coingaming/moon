defmodule MoonWeb.Pages.ExamplePages.Shared.Filters.CurrencyFilter do
  use MoonWeb, :stateless_component

  alias Moon.ComponentsV2.DropdownMultiFilter
  alias Moon.Components.Chip
  alias MoonWeb.Pages.ExamplePages.Helpers
  alias MoonWeb.MockDB.Currencies

  @default_name "currency_filter"

  prop name, :string, default: @default_name
  prop active_values, :list, required: true

  def render(assigns) do
    ~F"""
    <DropdownMultiFilter
      id={@name}
      all_items={all_items()}
      disable_search={true}
      active_values={@active_values}
      :let={toggle_filter: toggle_filter, is_open: is_open}
    >
      <Chip
        on_click={toggle_filter}
        value="currency"
        right_icon="icon_chevron_down_rounded"
        active={is_open or length(@active_values) > 0}
      >
        {"Currency #{length(@active_values) |> Helpers.format_filter_count()}"}
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
    Currencies.list_all() |> Enum.map(&%{label: &1.name, value: &1.name})
  end
end
