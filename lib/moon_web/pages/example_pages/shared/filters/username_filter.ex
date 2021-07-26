defmodule MoonWeb.Pages.ExamplePages.Shared.Filters.UsernameFilter do
  use MoonWeb, :stateless_component

  alias Moon.ComponentsV2.DropdownMultiFilter
  alias Moon.Components.Chip
  alias MoonWeb.Pages.ExamplePages.Helpers
  alias MoonWeb.MockDB.Users

  @default_name "username_filter"

  prop name, :string, default: @default_name
  prop active_items, :list, required: true

  def render(assigns) do
    ~F"""
    <DropdownMultiFilter
      id={@name}
      active_items={@active_items}
      fun_search_items={&search_users/1}
      :let={toggle_filter: toggle_filter}
    >
      <Chip on_click={toggle_filter} value="country" right_icon="icon_chevron_down_rounded">
        {"Users #{length(@active_items) |> Helpers.format_filter_count()}"}
      </Chip>
    </DropdownMultiFilter>
    """
  end

  def clear(name \\ @default_name) do
    DropdownMultiFilter.clear(name)
  end

  def search_users(search_text) do
    Users.search_by_usernames(search_text)
      |> Enum.map(&%{label: &1.username, value: to_string(&1.id)})
      |> Enum.take(10)
  end
end
