defmodule MoonWeb.Pages.ExamplePages.Shared.Filters.ContentFilter do
  use MoonWeb, :stateless_component

  alias Moon.Components.Chip
  alias Moon.BackofficeComponents.DropdownMultiFilter
  alias MoonWeb.Pages.ExamplePages.Helpers

  prop filter_name, :string, required: true
  prop all_items, :list, default: []
  prop active_items, :list

  prop chip_class, :string, default: "px-3"
  prop left_icon, :string
  prop right_icon, :string, default: "icon_chevron_down_rounded"

  slot label

  def render(assigns) do
    ~F"""
    <DropdownMultiFilter
      id={@filter_name}
      all_options={@all_items}
      active_values={@active_items}
      :let={toggle_filter: toggle_filter, is_open: is_open}
    >
      <Chip
        class={@chip_class}
        on_click={toggle_filter}
        left_icon={@left_icon}
        right_icon={@right_icon}
        active={is_open or length(@active_items) > 0}
      >
        <#slot name="label">
          {"#{@filter_name} #{length(@active_items) |> Helpers.format_filter_count()}"}
        </#slot>
      </Chip>
    </DropdownMultiFilter>
    """
  end

  #
  # Public API
  #
  def clear(id) do
    send_update(__MODULE__,
      id: id,
      show_filter: false,
      search_text: "",
      selected_items: []
    )
  end

  def close(id) do
    send_update(__MODULE__,
      id: id,
      show_filter: false
    )
  end
end
