defmodule MoonWeb.Pages.ExamplePages.TransactionsPage.TransactionsFilters do
  @moduledoc """
  Generic filter implementations, can be used for any model or any data which required included filters
  respective liveview must provide filter options and must handle `:apply_filter, filters` info message.
  ```
    <TransactionsFilters id="transaction_filters" {=@filter_options} />
  ```
  Liveview must have
  ```
    def handle_info({:apply_filter, selected_option_ids}, socket) do
      ...
    end
    ...
  ```
  """
  use MoonWeb, :stateful_component

  alias Moon.Components.Button
  alias Moon.Components.Chip
  alias Moon.Components.Popover
  alias Moon.Components.Dropdown
  alias Moon.Components.CheckboxMultiselect
  alias Moon.Components.Form
  alias Moon.Components.TextInput
  alias Moon.Autolayouts.LeftToRight
  alias Moon.Autolayouts.ButtonsList

  data clicked_name, :string, default: ""
  prop filter_options, :map

  data user_search, :map, default: %{value: ""}
  data brand_search, :map, default: %{value: ""}
  data currency_search, :map, default: %{value: ""}
  data country_search, :map, default: %{value: ""}

  @default_amount_range_value %{min: "", max: ""}
  data amount_range_values, :map, default: @default_amount_range_value
  data selected_brand_option_ids, :list, default: []
  data selected_user_option_ids, :list, default: []
  data selected_currency_option_ids, :list, default: []
  data selected_country_option_ids, :list, default: []

  def render(assigns) do
    ~F"""
    <ButtonsList>
      <Popover.Outer>
        <Chip value="search" left_icon="icon_zoom">
          Search
        </Chip>
        <Popover close="close_popover" placement="under" :if={@clicked_name == "search"}>
          Yay
        </Popover>
      </Popover.Outer>

      <Popover.Outer>
        <Chip on_click="open_popover" value="timeframe" right_icon="icon_chevron_down_rounded">
          Last 7 days
        </Chip>
        <Popover close="close_popover" placement="under" :if={@clicked_name == "timeframe"}>
          Yay
        </Popover>
      </Popover.Outer>

      <Popover.Outer>
        <Chip on_click="open_popover" value="brand" right_icon="icon_chevron_down_rounded">
          Brand ·
          {#if @selected_brand_option_ids == []}
            All
          {#else}
            {length(@selected_brand_option_ids)}
          {/if}
        </Chip>
        <Popover close="close_popover" placement="under" :if={@clicked_name == "brand"}>
          <Dropdown
            on_search_change={"handle_search_changed"}
            search_placeholder="Search for a brand ..."
            search_name={:brand_search}
          >
            <CheckboxMultiselect
              on_change={"handle_brand_selection_changed"}
              class="h-48"
              value={@selected_brand_option_ids}
              options={@filter_options.brand |> handle_search(@brand_search.value)}
            />
          </Dropdown>
          <LeftToRight class="justify-between p-2">
            <Button on_click="handle_brand_selection_cleared">Clear</Button>
            <LeftToRight>
              <Button on_click="handle_brand_selection_discard" variant="tertiary">Discard</Button>
              <Button on_click="handle_filter_apply" variant="primary">Apply</Button>
            </LeftToRight>
          </LeftToRight>
        </Popover>
      </Popover.Outer>

      <Popover.Outer>
        <Chip on_click="open_popover" value="currency" right_icon="icon_chevron_down_rounded">
          Currency ·
          {#if @selected_currency_option_ids == []}
            All
          {#else}
            {length(@selected_currency_option_ids)}
          {/if}
        </Chip>
        <Popover close="close_popover" placement="under" :if={@clicked_name == "currency"}>
          <Dropdown
            on_search_change={"handle_search_changed"}
            search_placeholder="Search for a currency ..."
            search_name={:currency_search}
          >
            <CheckboxMultiselect
              on_change={"handle_currency_selection_changed"}
              class="h-48"
              value={@selected_currency_option_ids}
              options={@filter_options.currency |> handle_search(@currency_search.value)}
            />
          </Dropdown>
          <LeftToRight class="justify-between p-2">
            <Button on_click="handle_currency_selection_cleared">Clear</Button>
            <LeftToRight>
              <Button on_click="handle_currency_selection_discard" variant="tertiary">Discard</Button>
              <Button on_click="handle_filter_apply" variant="primary">Apply</Button>
            </LeftToRight>
          </LeftToRight>
        </Popover>
      </Popover.Outer>

      <Popover.Outer>
        <Chip on_click="open_popover" value="users" right_icon="icon_chevron_down_rounded">
          Users ·
          {#if @selected_user_option_ids == []}
            All
          {#else}
            {length(@selected_user_option_ids)}
          {/if}
        </Chip>
        <Popover close="close_popover" placement="under" :if={@clicked_name == "users"}>
          <Dropdown
            on_search_change="handle_search_changed"
            search_placeholder="Search for a users ..."
            search_name={:user_search}
          >
            <CheckboxMultiselect
              on_change="handle_user_selection_changed"
              class="h-48"
              value={@selected_user_option_ids}
              options={@filter_options.user |> handle_search(@user_search.value) }
            />
            <LeftToRight class="justify-between p-2">
              <Button on_click="handle_user_selection_cleared">Clear</Button>
              <LeftToRight>
                <Button on_click="handle_user_selection_discard" variant="tertiary">Discard</Button>
                <Button on_click="handle_filter_apply" variant="primary">Apply</Button>
              </LeftToRight>
            </LeftToRight>
          </Dropdown>
        </Popover>
      </Popover.Outer>

      <Popover.Outer>
        <Chip on_click="open_popover" value="country" right_icon="icon_chevron_down_rounded">
          Country ·
          {#if @selected_country_option_ids == []}
            All
          {#else}
            {length(@selected_country_option_ids)}
          {/if}
        </Chip>
        <Popover close="close_popover" placement="under" :if={@clicked_name == "country"}>
          <Dropdown
            on_search_change="handle_search_changed"
            search_placeholder="Search for a users ..."
            search_name={:country_search}
          >
            <CheckboxMultiselect
              on_change="handle_country_selection_changed"
              class="h-48"
              value={@selected_country_option_ids}
              options={@filter_options.country |> handle_search(@country_search.value) }
            />
            <LeftToRight class="justify-between p-2">
              <Button on_click="handle_country_selection_cleared">Clear</Button>
              <LeftToRight>
                <Button on_click="handle_country_selection_discard" variant="tertiary">Discard</Button>
                <Button on_click="handle_filter_apply" variant="primary">Apply</Button>
              </LeftToRight>
            </LeftToRight>
          </Dropdown>
        </Popover>
      </Popover.Outer>

      <Popover.Outer>
        <Chip on_click="open_popover" value="range" right_icon="icon_chevron_down_rounded">Range · All</Chip>
        <Popover close="close_popover" class="h-auto" placement="under" :if={@clicked_name == "range"}>
          <Form for={:amount_range_values} change="handle_amount_range_selection_changed">
            <LeftToRight class="justify-between p-2">
              <TextInput type="number" field={:min} placeholder="Min" value={@amount_range_values.min} />
              <TextInput type="number" field={:max} placeholder="Max" value={@amount_range_values.max} />
            </LeftToRight>
          </Form>
          <LeftToRight class="justify-between p-2">
            <Button on_click="handle_amount_range_selection_cleared">Clear</Button>
            <LeftToRight>
              <Button on_click="handle_amount_range_selection_discard" variant="tertiary">Discard</Button>
              <Button on_click="handle_filter_apply" variant="primary">Apply</Button>
            </LeftToRight>
          </LeftToRight>
        </Popover>
      </Popover.Outer>

      <Popover.Outer>
        <Chip on_click="open_popover" value="more_filters" right_icon="icon_chevron_down_rounded">More filters</Chip>
        <Popover close="close_popover" placement="under" :if={@clicked_name == "more_filters"}>
          Yay
        </Popover>
      </Popover.Outer>

      <Button left_icon="icon_timer">Save segment</Button>
      <Button>Clear all</Button>
    </ButtonsList>
    """
  end

  defp toggle_id_in_list(list_ids, toggled_item_id) do
    enabled = Enum.member?(list_ids, toggled_item_id)

    if enabled do
      Enum.filter(list_ids, fn x -> x != toggled_item_id end)
    else
      list_ids ++ [toggled_item_id]
    end
  end

  # if option in the selected_users_ids, we should not filter out based on search
  defp handle_search(all_items, search_text) do
    search_text = String.upcase(search_text)

    all_items
    |> Enum.filter(&String.contains?(String.upcase(&1.label), search_text))
  end

  def handle_event(
        "open_popover",
        %{"click_value" => click_value},
        socket
      ) do
    {:noreply, assign(socket, clicked_name: click_value)}
  end

  def handle_event(
        "close_popover",
        _,
        socket
      ) do
    {:noreply, assign(socket, clicked_name: nil)}
  end

  def handle_event(
        "handle_search_changed",
        %{"_target" => [key, value]} = payload,
        socket
      ) do
    search_value = get_in(payload, [key, value])

    search_value = [
      {String.to_existing_atom(key), %{String.to_existing_atom(value) => search_value}}
    ]

    {:noreply, assign(socket, search_value)}
  end

  def handle_event(
        "handle_user_selection_changed",
        %{"toggled_item_id" => toggled_item_id},
        socket
      ) do
    new_ids = toggle_id_in_list(socket.assigns.selected_user_option_ids, toggled_item_id)
    {:noreply, assign(socket, selected_user_option_ids: new_ids)}
  end

  def handle_event(
        "handle_user_selection_cleared",
        _,
        socket
      ) do
    {:noreply, assign(socket, :selected_user_option_ids, [])}
  end

  def handle_event(
        "handle_user_selection_discard",
        _,
        socket
      ) do
    filter_ids =
      socket.assigns
      |> prepare_selected_filters()
      |> Map.put(:user, [])

    send(self(), {:apply_filter, filter_ids})
    {:noreply, assign(socket, selected_user_option_ids: [])}
  end

  def handle_event(
        "handle_brand_selection_changed",
        %{"toggled_item_id" => toggled_item_id},
        socket
      ) do
    new_ids = toggle_id_in_list(socket.assigns.selected_brand_option_ids, toggled_item_id)
    {:noreply, assign(socket, selected_brand_option_ids: new_ids)}
  end

  def handle_event(
        "handle_brand_selection_cleared",
        _,
        socket
      ) do
    {:noreply, assign(socket, :selected_brand_option_ids, [])}
  end

  def handle_event(
        "handle_brand_selection_discard",
        _,
        socket
      ) do
    filter_ids =
      socket.assigns
      |> prepare_selected_filters()
      |> Map.put(:brand, [])

    send(self(), {:apply_filter, filter_ids})
    {:noreply, assign(socket, selected_brand_option_ids: [])}
  end

  def handle_event(
        "handle_currency_selection_changed",
        %{"toggled_item_id" => toggled_item_id},
        socket
      ) do
    new_ids = toggle_id_in_list(socket.assigns.selected_currency_option_ids, toggled_item_id)
    {:noreply, assign(socket, selected_currency_option_ids: new_ids)}
  end

  def handle_event(
        "handle_currency_selection_cleared",
        _,
        socket
      ) do
    {:noreply, assign(socket, :selected_currency_option_ids, [])}
  end

  def handle_event(
        "handle_currency_selection_discard",
        _,
        socket
      ) do
    filter_ids =
      socket.assigns
      |> prepare_selected_filters()
      |> Map.put(:currency, [])

    send(self(), {:apply_filter, filter_ids})
    {:noreply, assign(socket, selected_currency_option_ids: [])}
  end

  def handle_event(
        "handle_country_selection_changed",
        %{"toggled_item_id" => toggled_item_id},
        socket
      ) do
    new_ids = toggle_id_in_list(socket.assigns.selected_country_option_ids, toggled_item_id)
    {:noreply, assign(socket, selected_country_option_ids: new_ids)}
  end

  def handle_event(
        "handle_country_selection_cleared",
        _,
        socket
      ) do
    {:noreply, assign(socket, :selected_country_option_ids, [])}
  end

  def handle_event(
        "handle_country_selection_discard",
        _,
        socket
      ) do
    filter_ids =
      socket.assigns
      |> prepare_selected_filters()
      |> Map.put(:country, [])

    send(self(), {:apply_filter, filter_ids})
    {:noreply, assign(socket, selected_country_option_ids: [])}
  end

  def handle_event(
        "handle_amount_range_selection_changed",
        %{"amount_range_values" => %{"min" => min, "max" => max}},
        socket
      ) do
    {:noreply, assign(socket, amount_range_values: %{min: min, max: max})}
  end

  def handle_event(
        "handle_amount_range_selection_cleared",
        _,
        socket
      ) do
    {:noreply, assign(socket, :amount_range_values, @default_amount_range_value)}
  end

  def handle_event(
        "handle_amount_range_selection_discard",
        _,
        socket
      ) do
    filter_ids =
      socket.assigns
      |> prepare_selected_filters()
      |> Map.put(:amount_range, @default_amount_range_value)

    send(self(), {:apply_filter, filter_ids})
    {:noreply, assign(socket, :amount_range_values, @default_amount_range_value)}
  end

  def handle_event(
        "handle_filter_apply",
        _,
        socket
      ) do
    filter_ids = prepare_selected_filters(socket.assigns)
    send(self(), {:apply_filter, filter_ids})
    {:noreply, socket}
  end

  defp prepare_selected_filters(assigns) do
    %{
      brand: assigns.selected_brand_option_ids,
      currency: assigns.selected_currency_option_ids,
      country: assigns.selected_country_option_ids,
      user: assigns.selected_user_option_ids,
      amount_range: assigns.amount_range_values
    }
  end
end
