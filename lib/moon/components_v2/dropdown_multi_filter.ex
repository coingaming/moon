defmodule Moon.ComponentsV2.DropdownMultiFilterView do
  use Moon.StatelessComponent

  alias Moon.Assets.Icons.IconZoom
  alias Moon.Autolayouts.{LeftToRight, TopToDown}
  alias Moon.Components.{Button, CheckboxMultiselectV2, Divider, Form, PopoverV2, TextInput}

  prop show_filter, :boolean, required: true
  prop search_text, :string, required: true
  prop onscreen_items, :list, required: true
  prop selected_items, :list, required: true

  prop on_apply, :event
  prop on_discard, :event, required: true
  prop on_clear, :event, required: true
  prop on_search, :event
  prop on_select, :event, required: true
  prop on_close, :event, required: true

  slot default, required: true

  def render(assigns) do
    ~F"""
    <PopoverV2 show={@show_filter} on_close={@on_close}>
      <#slot />
      <:content>
        <div class="w-80 bg-gohan-100 shadow rounded-lg pt-2">
          <div :if={@on_search != nil}>
            <Form for={:search} change={@on_search} autocomplete="off" class="px-1">
              <TextInput
                placeholder="Search"
                field={:search_text}
                value={@search_text}
                class="border-none"
                background_color="gohan-100"
                size="medium"
              >
                <:left_icon><IconZoom /></:left_icon>
              </TextInput>
            </Form>
            <Divider class="my-1" />
          </div>

          <div class="h-80 overflow-y-auto no-scrollbar">
            {#if !Enum.empty?(@onscreen_items)}
              <TopToDown gap={1} class="px-1">
                <CheckboxMultiselectV2
                  values={@selected_items |> Enum.map(& &1.value)}
                  options={@onscreen_items}
                  on_select={@on_select}
                />
              </TopToDown>
            {#elseif @search_text != "" and Enum.empty?(@onscreen_items)}
              <div class="h-full flex items-center justify-around">
                <div>No results found</div>
              </div>
            {#else}
              <div class="h-full flex items-center text-beerus-100 justify-around">
                <div>Looking for something?  ☝️</div>
              </div>
            {/if}
          </div>
          <Divider class="mt-1" />
          <LeftToRight class="justify-between p-2">
            {#if length(@selected_items) > 0}
              <Button size="xsmall" class="rounded" on_click={@on_clear}>
                Clear
              </Button>
            {#else}
              <Button size="xsmall" class="rounded" disabled>
                Clear
              </Button>
            {/if}

            <LeftToRight>
              <Button variant="tertiary" size="xsmall" on_click={@on_discard}>
                Discard
              </Button>
              {#if @on_apply}
                <Button variant="primary" size="xsmall" on_click={@on_apply}>
                  Apply
                </Button>
              {#else}
                <Button variant="primary" size="xsmall" disabled>
                  Apply
                </Button>
              {/if}
            </LeftToRight>
          </LeftToRight>
        </div>
      </:content>
    </PopoverV2>
    """
  end
end

defmodule Moon.ComponentsV2.DropdownMultiFilter do
  use Moon.StatefulComponent

  alias Moon.Components.Tooltip
  alias Moon.ComponentsV2.DropdownMultiFilterView

  data show_filter, :boolean, default: false
  data search_text, :string, default: ""
  data active_items, :list, default: []
  data onscreen_items, :list, default: []
  data selected_items, :list, default: []

  prop all_items, :list, default: []
  prop active_values, :list, required: true
  prop disable_search, :boolean, default: false
  prop func_query_items, :fun
  prop func_search_items, :fun

  slot default, required: true, args: [:toggle_filter, :is_open]

  def render(assigns) do
    tooltip_text =
      assigns.active_items
      |> Enum.map(& &1.label)
      |> Enum.join(", ")

    can_apply_filter =
      selection_modified?(
        assigns.selected_items,
        assigns.active_values
      )

    ~F"""
    <DropdownMultiFilterView
      {=@show_filter}
      {=@search_text}
      {=@onscreen_items}
      {=@selected_items}
      on_apply={if can_apply_filter, do: "apply_filter", else: nil}
      on_discard="discard_filter"
      on_clear="clear_filter"
      on_search={if @disable_search, do: nil, else: "search_filter_items"}
      on_select="select_filter_item"
      on_close="toggle_filter"
    >
      {#if length(@active_items) > 0}
        <Tooltip placement="top" text={tooltip_text}>
          <#slot :args={
            is_open: @show_filter,
            toggle_filter: %{name: "toggle_filter", target: @myself}
          } />
        </Tooltip>
      {#else}
        <#slot :args={
          is_open: @show_filter,
          toggle_filter: %{name: "toggle_filter", target: @myself}
        } />
      {/if}
    </DropdownMultiFilterView>
    """
  end

  #
  # Public API
  #
  def clear(id) do
    send_update(__MODULE__, id: id, search_text: "", selected_items: [])
  end

  def close(id) do
    send_update(__MODULE__, id: id, show_filter: false)
  end

  #
  # Lifecycle methods
  #
  def update(
        assigns = %{all_items: all_items, active_values: active_values},
        socket = %{
          assigns: %{
            onscreen_items: onscreen_items,
            selected_items: selected_items
          }
        }
      ) do
    query_active_values(assigns, socket.assigns)

    updated_active_items =
      active_values
      |> Enum.map(fn value ->
        Enum.find(all_items, &(&1.value == value)) ||
          Enum.find(selected_items, &(&1.value == value)) ||
          %{label: nil, value: value}
      end)

    updated_onscreen_items =
      case {all_items, onscreen_items} do
        {_, [_ | _]} -> onscreen_items
        {[_ | _], _} -> all_items
        _ -> []
      end

    updated_selected_items =
      if Enum.empty?(selected_items),
        do: updated_active_items,
        else: selected_items

    {:ok,
     socket
     |> assign(assigns)
     |> assign(active_items: updated_active_items)
     |> assign(onscreen_items: updated_onscreen_items)
     |> assign(selected_items: updated_selected_items)}
  end

  # load active items once they are queried asynchronously
  def update(%{active_items: active_items}, socket) do
    update_item = fn item ->
      if item.label != nil,
        do: item,
        else: Enum.find(active_items, &(&1.value == item.value))
    end

    updated_active_items =
      socket.assigns.active_items
      |> Enum.map(update_item)
      |> Enum.filter(&(&1 != nil))

    updated_selected_items =
      socket.assigns.selected_items
      |> Enum.map(update_item)
      |> Enum.filter(&(&1 != nil))

    updated_onscreen_items =
      if Enum.empty?(socket.assigns.onscreen_items),
        do: updated_selected_items,
        else: socket.assigns.onscreen_items

    {:ok,
     socket
     |> assign(active_items: updated_active_items)
     |> assign(onscreen_items: updated_onscreen_items)
     |> assign(selected_items: updated_selected_items)}
  end

  # clear(), close()
  def update(assigns, socket) do
    {:ok, socket |> assign(assigns)}
  end

  #
  # Event Handlers
  #
  def handle_event(
        "apply_filter",
        _value,
        socket = %{assigns: %{id: id, selected_items: items}}
      ) do
    apply_filter(id, items)

    {:noreply,
     socket
     |> assign(show_filter: false)}
  end

  def handle_event(
        "clear_filter",
        _value,
        socket = %{assigns: %{onscreen_items: onscreen_items, active_items: active_items}}
      ) do
    onscreen_items = if Enum.empty?(onscreen_items), do: active_items, else: onscreen_items

    {:noreply,
     socket
     |> assign(onscreen_items: onscreen_items)
     |> assign(selected_items: [])}
  end

  def handle_event(
        "discard_filter",
        _value,
        socket = %{assigns: %{active_items: active_items}}
      ) do
    {:noreply,
     socket
     |> assign(show_filter: false)
     |> assign(selected_items: active_items)}
  end

  def handle_event(
        "toggle_filter",
        _value,
        socket = %{assigns: %{show_filter: show_filter}}
      ) do
    {:noreply, socket |> assign(show_filter: !show_filter)}
  end

  def handle_event(
        "search_filter_items",
        %{"search" => %{"search_text" => ""}},
        socket = %{assigns: %{all_items: all_items, selected_items: selected_items}}
      ) do
    {:noreply,
     socket
     |> assign(onscreen_items: all_items || Enum.filter(selected_items, & &1.field))
     |> assign(search_text: "")}
  end

  def handle_event(
        "search_filter_items",
        %{"search" => %{"search_text" => search_text}},
        socket = %{assigns: %{all_items: all_items, func_search_items: nil}}
      ) do
    {:noreply,
     socket
     |> assign(onscreen_items: all_items |> search_by_labels(search_text))
     |> assign(search_text: search_text)}
  end

  def handle_event(
        "search_filter_items",
        %{"search" => %{"search_text" => search_text}},
        socket = %{assigns: %{func_search_items: custom_search}}
      ) do
    {:noreply,
     socket
     |> assign(onscreen_items: custom_search.(search_text))
     |> assign(search_text: search_text)}
  end

  def handle_event(
        "select_filter_item",
        %{"toggled_item_id" => id},
        socket = %{assigns: %{onscreen_items: onscreen_items, selected_items: selected_items}}
      ) do
    {:noreply,
     socket
     |> assign(selected_items: update_selected_items(id, onscreen_items, selected_items))}
  end

  #
  # Helpers
  #
  defp apply_filter(filter_id, items) do
    values = Enum.map(items, & &1.value)

    send(self(), {:filter, {filter_id, :apply, values}})
  end

  defp search_by_labels(all_items, search_text) do
    search_text = String.upcase(search_text)

    all_items
    |> Enum.filter(&String.contains?(String.upcase(&1.label), search_text))
  end

  defp update_selected_items(selected_value, onscreen_items, selected_items) do
    in_onscreen_items = Enum.find(onscreen_items, &(&1.value == selected_value))
    in_selected_items = Enum.find(selected_items, &(&1.value == selected_value))

    case {in_onscreen_items, in_selected_items} do
      {nil, nil} -> selected_items
      {item, nil} -> [item | selected_items]
      {_, item} -> List.delete(selected_items, item)
    end
  end

  # Checks if user has modified selection from the current active filter values,
  # this is useful to apply filters only when necessary
  defp selection_modified?([], []), do: false

  defp selection_modified?(selected_items, active_values)
       when length(selected_items) != length(active_values),
       do: true

  defp selection_modified?(selected_items, active_values) do
    selected_items_sorted = Enum.sort(selected_items, &(&1.value < &2.value))
    active_values_sorted = Enum.sort(active_values, &(&1 < &2))

    selected_items_sorted
    |> Enum.zip(active_values_sorted)
    |> Enum.any?(fn {%{value: x}, y} -> x != y end)
  end

  # Take incoming & current assigns, asynchronously query active values if required and
  # then load them into component assigns
  defp query_active_values(
         %{
           id: id,
           all_items: [],
           active_values: active_values = [_ | _],
           func_query_items: func_query_items
         },
         %{
           active_items: [],
           onscreen_items: [],
           selected_items: []
         }
       ) do
    pid = self()

    if func_query_items == nil do
      IO.warn("Improper Usage of DropdownMultiFilter {#{id}}: func_query_items not provided")
      apply_filter(id, [])
    else
      Task.async(fn ->
        active_items = func_query_items.(active_values)
        send_update(pid, __MODULE__, id: id, active_items: active_items)
      end)
    end
  end

  defp query_active_values(_incoming_assigns, _current_assigns) do
    nil
  end
end
