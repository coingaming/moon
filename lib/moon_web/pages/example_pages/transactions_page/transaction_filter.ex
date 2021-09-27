defmodule MoonWeb.Pages.ExamplePages.TransactionsPage.TransactionFilter do
  @moduledoc """
  It's a obsolute module, I'm going to remove it with mock data generation on transaction page
  """
  use MoonWeb, :stateless_component

  alias Moon.Components.Chip
  alias Moon.ComponentsV2.DropdownMultiFilter
  alias MoonWeb.Pages.ExamplePages.Helpers

  @default_name "dropdown_filter"
  @default_label "Label"

  prop label, :string, default: @default_label
  prop name, :string, default: @default_name
  prop active_options, :list, required: true
  prop options, :list, required: true
  prop disable_search, :boolean, default: true

  def render(assigns) do
    ~F"""
    <DropdownMultiFilter
      id={@name}
      all_items={@options}
      {=@disable_search}
      active_values={@active_options}
      :let={toggle_filter: toggle_filter, is_open: is_open}
    >
      <Chip
        on_click={toggle_filter}
        value={@name}
        right_icon="icon_chevron_down_rounded"
        active={is_open or length(@active_options) > 0}
      >
        {"#{@label} #{length(@active_options) |> Helpers.format_filter_count()}"}
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
end
