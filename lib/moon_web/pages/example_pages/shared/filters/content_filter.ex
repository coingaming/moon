defmodule MoonWeb.Pages.ExamplePages.Shared.Filters.ContentFilter do
  @moduledoc false

  use MoonWeb, :stateful_component

  alias Moon.Components.Chip
  alias Moon.Components.DropdownMultiFilter
  alias MoonWeb.Pages.ExamplePages.Helpers

  data show_filter, :boolean, default: false
  data selected_items, :list, default: []

  prop chip_class, :string, default: "px-3"
  prop filter_name, :string, required: true
  prop active_items, :list
  prop all_items, :list, default: []
  prop left_icon, :string
  prop right_icon, :string, default: "icon_chevron_down_rounded"

  slot label

  def render(assigns) do
    ~F"""
    <DropdownMultiFilter
      {=@show_filter}
      {=@all_items}
      {=@selected_items}
      {=@active_items}
      on_apply="apply_filter"
      on_discard="discard_filter"
      on_clear="clear_filter"
      on_select="handle_filter_select"
      on_close="toggle_filter"
    >
      <Chip
        class={@chip_class}
        on_click="toggle_filter"
        left_icon={@left_icon}
        right_icon={@right_icon}
        active={@show_filter or length(@active_items) > 0}
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

  #
  # Event Handlers
  #
  def handle_event("apply_filter", _, socket) do
    apply_filter(socket.assigns.selected_items, socket.assigns.id)
    {:noreply, assign(socket, show_filter: false)}
  end

  def handle_event("discard_filter", _, socket) do
    {:noreply,
     socket
     |> assign(show_filter: false)
     |> assign(selected_items: socket.assigns.active_items)}
  end

  def handle_event("clear_filter", _, socket) do
    {:noreply, assign(socket, selected_items: [])}
  end

  def handle_event("toggle_filter", _, socket) do
    {:noreply, assign(socket, show_filter: !socket.assigns.show_filter)}
  end

  def handle_event("handle_filter_select", %{"toggled_item_id" => id}, socket) do
    %{all_items: all, selected_items: selected} = socket.assigns

    {:noreply, assign(socket, selected_items: Helpers.toggle_selected_item(all, selected, id))}
  end

  defp apply_filter(items, id) do
    send(self(), {:filter, {id, :apply, items}})
  end
end
