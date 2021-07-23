defmodule Moon.ComponentsV2.DropdownMultiFilterView do
  use Moon.StatelessComponent

  alias Moon.Components.{PopoverV2, CheckboxMultiselectV2, Form, TextInput, Button, Divider}
  alias Moon.Autolayouts.{LeftToRight}

  prop show_filter, :boolean, required: true
  prop search_text, :string, required: true
  prop onscreen_items, :list, required: true
  prop selected_items, :list, required: true
  prop active_items, :list, required: true

  prop on_apply, :event, required: true
  prop on_discard, :event, required: true
  prop on_clear, :event, required: true
  prop on_search, :event
  prop on_select, :event, required: true
  prop on_close, :event, required: true

  slot default, required: true

  def render(assigns) do
    ~F"""
    <PopoverV2 show={@show_filter} on_close={@on_close}>
      <#slot/>
      <:content>
        <div class="w-80 bg-gohan-100 shadow rounded">
          <div :if={@on_search != nil} class="p-3">
            <Form
              for={:search}
              change={@on_search}
              autocomplete="off"
            >
              <TextInput
                left_icon="icon_zoom"
                placeholder="Type here..."
                field={:search_text}
                value={@search_text}
                class="border-none bg-goku-100"
              />
            </Form>
          </div>
          <div class={"h-80 pl-2 pr-1 overflow-y-auto no-scrollbar #{is_nil(@on_search) && "pt-4"}"}>
            {#if length(@onscreen_items) > 0}
              <CheckboxMultiselectV2
                values={@selected_items |> Enum.map(&(&1.value))}
                options={@onscreen_items}
                on_select={@on_select}
              />
            {#elseif @search_text != "" and length(@onscreen_items) == 0}
              <div class="h-full flex items-center justify-around">
                <div>No results found</div>
              </div>
            {#elseif length(@selected_items) > 0}
              <CheckboxMultiselectV2
                values={@selected_items |> Enum.map(&(&1.value))}
                options={@selected_items}
                on_select={@on_select}
              />
            {#else}
              <div class="h-full flex items-center beerus-100 justify-around">
                <div>No filters applied</div>
              </div>
            {/if}
          </div>
          <Divider class="mt-2"/>
          <LeftToRight class="justify-between p-2">
            {#if can_clear_filters?(@selected_items)}
              <Button variant="danger" size="xsmall" class="rounded" on_click={@on_clear}>
                Clear
              </Button>
            {#else}
              <Button variant="danger" size="xsmall" class="rounded">
                <span class="text-beerus-100">Clear</span>
              </Button>
            {/if}
            <LeftToRight>
              <Button variant="danger" size="xsmall" class="rounded border-bulma-100" on_click={@on_discard}>
                Discard
              </Button>
              {#if can_apply_filters?(@selected_items, @active_items)}
                <Button variant="primary" size="xsmall" class="rounded" on_click={@on_apply}>
                  &nbspApply&nbsp
                </Button>
              {#else}
                <Button size="xsmall" class="rounded bg-hit-80">
                  <span class="text-goten-100">&nbspApply&nbsp</span>
                </Button>
              {/if}
            </LeftToRight>
          </LeftToRight>
        </div>
      </:content>
    </PopoverV2>
    """
  end

  defp can_clear_filters?(selected_items) do
    length(selected_items) > 0
  end

  defp can_apply_filters?([], []), do: false

  defp can_apply_filters?(selected_items, active_items)
       when length(selected_items) != length(active_items),
       do: true

  defp can_apply_filters?(selected_items, active_items) do
    selected_items_sorted = Enum.sort(selected_items, &(&1.value < &2.value))
    active_items_sorted = Enum.sort(active_items, &(&1.value < &2.value))

    selected_items_sorted
    |> Enum.zip(active_items_sorted)
    |> Enum.any?(fn {a, b} -> a.value != b.value end)
  end
end

defmodule Moon.ComponentsV2.DropdownMultiFilter do
  use Moon.StatefulComponent

  alias Moon.ComponentsV2.DropdownMultiFilterView

  data show_filter, :boolean, default: false
  data search_text, :string, default: ""
  data onscreen_items, :list, default: []
  data selected_items, :list, default: []

  prop all_items, :list
  prop active_items, :list, required: true
  prop hide_search, :boolean, default: false

  slot default, required: true, args: [:toggle_filter, :is_open]

  def render(assigns) do
    ~F"""
    <DropdownMultiFilterView
      {=@show_filter}
      {=@search_text}
      {=@onscreen_items}
      {=@selected_items}
      {=@active_items}
      on_apply="apply_filter"
      on_discard="discard_filter"
      on_clear="clear_filter"
      on_search="search_filter_items"
      on_select="select_filter_item"
      on_close="toggle_filter"
    >
      <#slot
        :args={
          is_open: @show_filter,
          toggle_filter: %{name: "toggle_filter", target: @myself}
        }
      />
    </DropdownMultiFilterView>
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

  #
  # Lifecycle methods
  #
  def update(assigns, socket) do
    %{all_items: all_items} = assigns
    %{onscreen_items: onscreen_items} = socket.assigns

    updated_onscreen_items =
      case {all_items, onscreen_items} do
        {_, [_ | _]} -> onscreen_items
        {[_ | _], _} -> all_items
        _ -> []
      end

    {:ok, socket
      |> assign(assigns)
      |> assign(onscreen_items: updated_onscreen_items)}
  end

  #
  # Event Handlers
  #
  def handle_event("apply_filter", _, socket) do
    %{id: filter_id, selected_items: items} = socket.assigns

    apply_filter(filter_id, items)

    {:noreply,
     socket
     |> assign(show_filter: false)}
  end

  def handle_event("discard_filter", _, socket) do
    %{active_items: active_items} = socket.assigns

    {:noreply,
     socket
     |> assign(show_filter: false)
     |> assign(selected_items: active_items)}
  end

  def handle_event("clear_filter", _, socket) do
    %{onscreen_items: onscreen_items, active_items: active_items} = socket.assigns
    onscreen_items = if length(onscreen_items) > 0, do: onscreen_items, else: active_items

    {:noreply,
     socket
     |> assign(onscreen_items: onscreen_items)
     |> assign(selected_items: [])}
  end

  def handle_event("toggle_filter", _, socket) do
    %{show_filter: show_filter} = socket.assigns

    {:noreply, socket |> assign(show_filter: !show_filter)}
  end

  def handle_event("search_filter_items", %{"search" => %{"search_text" => search_text}}, socket) do
    %{all_items: all_items} = socket.assigns

    {:noreply,
     socket
     |> assign(onscreen_items: all_items |> search_by_labels(search_text))
     |> assign(search_text: search_text)}
  end

  def handle_event("select_filter_item", %{"toggled_item_id" => id}, socket) do
    %{all_items: all_items, selected_items: selected_items} = socket.assigns

    {:noreply, socket
      |> assign(selected_items: id |> update_selected_items(all_items, selected_items))}
  end

  #
  # Helpers
  #
  defp apply_filter(filter_id, items) do
    action = "apply_#{filter_id}" |> String.to_atom()
    self() |> send({:apply_filter, {action, items}})
  end

  def search_by_labels(all_items, search_text) do
    search_text = String.upcase(search_text)

    all_items
    |> Enum.filter(&String.contains?(String.upcase(&1.label), search_text))
  end

  def update_selected_items(selected_value, onscreen_items, selected_items) do
    in_onscreen_items = Enum.find(onscreen_items, &(&1.value == selected_value))
    in_selected_items = Enum.find(selected_items, &(&1.value == selected_value))

    case {in_onscreen_items, in_selected_items} do
      {nil, nil} -> selected_items
      {item, nil} -> [item | selected_items]
      {_, item} -> List.delete(selected_items, item)
    end
  end
end
