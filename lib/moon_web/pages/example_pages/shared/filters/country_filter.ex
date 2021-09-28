defmodule MoonWeb.Pages.ExamplePages.Shared.Filters.CountryFilter do
  use MoonWeb, :stateless_component

  alias Moon.Components.Chip
  alias Moon.BackofficeComponents.DropdownMultiFilter
  alias MoonWeb.Pages.ExamplePages.Helpers
  alias MoonWeb.MockDB.Countries

  @default_name "country_filter"

  prop name, :string, default: @default_name
  prop active_values, :list, required: true

  def render(assigns) do
    ~F"""
    <DropdownMultiFilter
      id={@name}
      all_options={all_options()}
      active_values={@active_values}
      :let={toggle_filter: toggle_filter, is_open: is_open}
    >
      <Chip
        on_click={toggle_filter}
        value="country"
        right_icon="icon_chevron_down_rounded"
        active={is_open or length(@active_values) > 0}
      >
        {"Country #{length(@active_values) |> Helpers.format_filter_count()}"}
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
  defp all_options() do
    Countries.list_all() |> Enum.map(&%{label: &1.name, value: &1.name})
  end
end
