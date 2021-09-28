defmodule MoonWeb.Pages.ExamplePages.Shared.Filters.UsernameFilter do
  use MoonWeb, :stateless_component

  alias Moon.BackofficeComponents.DropdownMultiFilter
  alias Moon.Components.Chip
  alias MoonWeb.Pages.ExamplePages.Helpers
  alias MoonWeb.MockDB.Users

  @default_name "username_filter"

  prop name, :string, default: @default_name
  prop active_values, :list, required: true

  def render(assigns) do
    ~F"""
    <DropdownMultiFilter
      id={@name}
      active_values={@active_values}
      func_query_options={&query_filter_items/1}
      func_search_options={&search_users/1}
      :let={toggle_filter: toggle_filter, is_open: is_open}
    >
      <Chip
        on_click={toggle_filter}
        value="users"
        right_icon="icon_chevron_down_rounded"
        active={is_open or length(@active_values) > 0}
      >
        {"Users #{length(@active_values) |> Helpers.format_filter_count()}"}
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

  def search_users(search_text) do
    Users.search_by_usernames(search_text)
    |> Enum.map(&%{label: &1.username, value: to_string(&1.id)})
    |> Enum.take(10)
  end

  def query_filter_items(filter_values) do
    user_ids = filter_values |> Enum.map(&String.to_integer/1)

    Users.list(%{
      filter: %{id: user_ids, site: [], country: []},
      sort: %{}
    })
    |> Enum.map(&%{label: &1.username, value: "#{&1.id}"})
  end
end
