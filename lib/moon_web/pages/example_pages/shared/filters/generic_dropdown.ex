defmodule MoonWeb.Pages.ExamplePages.Shared.Filters.GenericDropdown do
  use MoonWeb, :stateful_component
  alias Moon.Components.Chip
  alias Moon.Components.DropdownMultiFilter
  alias MoonWeb.Pages.ExamplePages.Helpers

  data show_filter, :boolean, default: false
  data search_text, :string, default: ""
  data selected_items, :list, default: []

  prop all_items, :list, default: []
  prop label, :string, default: "Label"
  prop active_items, :list, required: true

  def render(assigns) do
    ~F"""
    <DropdownMultiFilter
      {=@show_filter}
      {=@search_text}
      all_items={@all_items |> handle_search(@search_text)}
      {=@selected_items}
      {=@active_items}
      on_apply="apply_filter"
      on_discard="discard_filter"
      on_clear="clear_filter"
      on_search="handle_filter_search"
      on_select="handle_filter_select"
      on_close="toggle_filter"
    >
      <Chip on_click="toggle_filter" value="users" right_icon="icon_chevron_down_rounded">
        {"#{@label} #{length(@selected_items) |> Helpers.format_filter_count()}"}
      </Chip>
    </DropdownMultiFilter>
    """
  end

  #
  # Event Handlers
  #
  defp handle_search(all_items, search_text) do
    search_text = String.upcase(search_text)

    all_items
    |> Enum.filter(&String.contains?(String.upcase(&1.label), search_text))
  end

  def handle_event("apply_filter", _, socket) do
    %{selected_items: items, id: filter_id} = socket.assigns

    apply_filter(items, filter_id)

    {:noreply, assign(socket, show_filter: false)}
  end

  def handle_event("discard_filter", _, socket) do
    apply_filter([], socket.assigns.id)

    {:noreply, assign(socket, show_filter: false, selected_items: [], search_text: "")}
  end

  def handle_event("clear_filter", _, socket) do
    {:noreply, assign(socket, selected_items: [], search_text: "")}
  end

  def handle_event("toggle_filter", _, socket) do
    %{show_filter: show_filter} = socket.assigns

    {:noreply, assign(socket, show_filter: !show_filter)}
  end

  def handle_event(
        "handle_filter_search",
        %{"search" => %{"search_text" => search_text}},
        socket
      ) do
    active_items =
      socket.assigns.all_items
      |> Enum.map(&%{label: &1.label, value: to_string(&1.value)})
      |> Enum.take(10)

    {:noreply, assign(socket, search_text: search_text, active_items: active_items)}
  end

  def handle_event("handle_filter_select", %{"toggled_item_id" => id}, socket) do
    %{all_items: all, selected_items: selected} = socket.assigns

    {:noreply,
     assign(socket, selected_items: Helpers.toggle_selected_item(all, selected, id))}
  end

  defp apply_filter(items, filter_id) do
    send(self(), {:apply_filter, {filter_id, items}})
  end
end
