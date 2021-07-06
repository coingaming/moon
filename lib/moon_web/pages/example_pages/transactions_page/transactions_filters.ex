defmodule MoonWeb.Pages.ExamplePages.TransactionsPage.TransactionsFilters do
  use MoonWeb, :stateful_component

  alias Moon.Components.Button
  alias Moon.Components.Chip
  alias Moon.Components.Popover
  alias Moon.Components.Dropdown
  alias Moon.Components.CheckboxMultiselect
  alias Moon.Autolayouts.LeftToRight
  alias Moon.Autolayouts.ButtonsList

  data clicked_name, :string, default: ""
  prop filter_options, :map

  data selected_option_ids, :map,
    default: %{
      brand: [],
      user: [],
      currency: [],
      country: []
    }

  data user_search, :map, default: %{value: ""}
  data brand_search, :map, default: %{value: ""}
  data currency_search, :map, default: %{value: ""}
  data country_search, :map, default: %{value: ""}

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
          {#if @selected_option_ids.brand == []}
            All
          {#else}
            {length(@selected_option_ids.brand)}
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
              class="max-h-32"
              value={@selected_option_ids.brand}
              options={@filter_options.brand |> handle_search(@brand_search.value)}
            />
          </Dropdown>
          <LeftToRight class="justify-between p-2">
          <Button on_click="handle_brand_selection_cleared">Clear</Button>
          <LeftToRight>
            <Button on_click="handle_brand_selection_discard">Discard</Button>
            <Button on_click="handle_filter_apply">Apply</Button>
          </LeftToRight>
        </LeftToRight>
        </Popover>
      </Popover.Outer>

      <Popover.Outer>
        <Chip on_click="open_popover" value="currency" right_icon="icon_chevron_down_rounded">
          Currency ·
          {#if @selected_option_ids.currency == []}
            All
          {#else}
            {length(@selected_option_ids.currency)}
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
              class="max-h-32"
              value={@selected_option_ids.currency}
              options={@filter_options.currency |> handle_search(@currency_search.value)}
            />
          </Dropdown>
          <LeftToRight class="justify-between p-2">
          <Button on_click="handle_currency_selection_cleared">Clear</Button>
          <LeftToRight>
            <Button on_click="handle_currency_selection_discard">Discard</Button>
            <Button on_click="handle_filter_apply">Apply</Button>
          </LeftToRight>
        </LeftToRight>
        </Popover>
      </Popover.Outer>

      <Popover.Outer>
        <Chip on_click="open_popover" value="users" right_icon="icon_chevron_down_rounded">
          Users ·
          {#if @selected_option_ids.user == []}
            All
          {#else}
            {length(@selected_option_ids.user)}
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
              class="max-h-32"
              value={@selected_option_ids.user}
              options={@filter_options.user |> handle_search(@user_search.value) }
            />
            <LeftToRight class="justify-between p-2">
              <Button on_click="handle_user_selection_cleared">Clear</Button>
              <LeftToRight>
                <Button on_click="handle_user_selection_discard">Discard</Button>
                <Button on_click="handle_filter_apply">Apply</Button>
              </LeftToRight>
            </LeftToRight>
          </Dropdown>
        </Popover>
      </Popover.Outer>

      <Popover.Outer>
        <Chip on_click="open_popover" value="country" right_icon="icon_chevron_down_rounded">
          Country ·
          {#if @selected_option_ids.country == []}
            All
          {#else}
            {length(@selected_option_ids.country)}
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
              class="max-h-32"
              value={@selected_option_ids.country}
              options={@filter_options.country |> handle_search(@country_search.value) }
            />
            <LeftToRight class="justify-between p-2">
              <Button on_click="handle_country_selection_cleared">Clear</Button>
              <LeftToRight>
                <Button on_click="handle_country_selection_discard">Discard</Button>
                <Button on_click="handle_filter_apply">Apply</Button>
              </LeftToRight>
            </LeftToRight>
          </Dropdown>
        </Popover>
      </Popover.Outer>

      <Popover.Outer>
        <Chip on_click="open_popover" value="range" right_icon="icon_chevron_down_rounded">Range · All</Chip>
        <Popover close="close_popover" placement="under" :if={@clicked_name == "range"}>
          Yay
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
        assigns,
        socket
      ) do
    %{"toggled_item_id" => toggled_item_id} = assigns
    selected_option_ids = socket.assigns.selected_option_ids
    new_ids = toggle_id_in_list(selected_option_ids.user, toggled_item_id)

    {:noreply, assign(socket, selected_option_ids: Map.put(selected_option_ids, :user, new_ids))}
  end

  def handle_event(
        "handle_user_selection_cleared",
        _,
        socket
      ) do
    selected_option_ids = socket.assigns.selected_option_ids
    {:noreply, assign(socket, selected_option_ids: Map.put(selected_option_ids, :user, []))}
  end

  def handle_event(
        "handle_user_selection_discard",
        _,
        socket
      ) do
    selected_option_ids = socket.assigns.selected_option_ids
    selected_option_ids = Map.put(selected_option_ids, :user, [])
    send(self(), {:apply_filter, selected_option_ids})
    {:noreply, assign(socket, selected_option_ids: selected_option_ids)}
  end

  def handle_event(
        "handle_brand_selection_changed",
        assigns,
        socket
      ) do
    %{"toggled_item_id" => toggled_item_id} = assigns
    selected_option_ids = socket.assigns.selected_option_ids
    new_ids = toggle_id_in_list(selected_option_ids.brand, toggled_item_id)

    {:noreply, assign(socket, selected_option_ids: Map.put(selected_option_ids, :brand, new_ids))}
  end

  def handle_event(
        "handle_brand_selection_cleared",
        _,
        socket
      ) do
    selected_option_ids = socket.assigns.selected_option_ids
    {:noreply, assign(socket, selected_option_ids: Map.put(selected_option_ids, :brand, []))}
  end

  def handle_event(
        "handle_brand_selection_discard",
        _,
        socket
      ) do
    selected_option_ids = socket.assigns.selected_option_ids
    selected_option_ids = Map.put(selected_option_ids, :brand, [])
    send(self(), {:apply_filter, selected_option_ids})
    {:noreply, assign(socket, selected_option_ids: selected_option_ids)}
  end

  def handle_event(
        "handle_currency_selection_changed",
        assigns,
        socket
      ) do
    %{"toggled_item_id" => toggled_item_id} = assigns
    selected_option_ids = socket.assigns.selected_option_ids
    new_ids = toggle_id_in_list(selected_option_ids.currency, toggled_item_id)

    {:noreply,
     assign(socket, selected_option_ids: Map.put(selected_option_ids, :currency, new_ids))}
  end

  def handle_event(
        "handle_currency_selection_cleared",
        _,
        socket
      ) do
    selected_option_ids = socket.assigns.selected_option_ids
    {:noreply, assign(socket, selected_option_ids: Map.put(selected_option_ids, :currency, []))}
  end

  def handle_event(
        "handle_currency_selection_discard",
        _,
        socket
      ) do
    selected_option_ids = socket.assigns.selected_option_ids
    selected_option_ids = Map.put(selected_option_ids, :currency, [])
    send(self(), {:apply_filter, selected_option_ids})
    {:noreply, assign(socket, selected_option_ids: selected_option_ids)}
  end

  def handle_event(
        "handle_country_selection_changed",
        assigns,
        socket
      ) do
    %{"toggled_item_id" => toggled_item_id} = assigns
    selected_option_ids = socket.assigns.selected_option_ids
    new_ids = toggle_id_in_list(selected_option_ids.country, toggled_item_id)

    {:noreply,
     assign(socket, selected_option_ids: Map.put(selected_option_ids, :country, new_ids))}
  end

  def handle_event(
        "handle_country_selection_cleared",
        _,
        socket
      ) do
    selected_option_ids = socket.assigns.selected_option_ids
    {:noreply, assign(socket, selected_option_ids: Map.put(selected_option_ids, :country, []))}
  end

  def handle_event(
        "handle_country_selection_discard",
        _,
        socket
      ) do
    selected_option_ids = socket.assigns.selected_option_ids
    selected_option_ids = Map.put(selected_option_ids, :country, [])
    send(self(), {:apply_filter, selected_option_ids})
    {:noreply, assign(socket, selected_option_ids: selected_option_ids)}
  end

  def handle_event(
        "handle_filter_apply",
        _,
        socket
      ) do
    selected_option_ids = socket.assigns.selected_option_ids
    send(self(), {:apply_filter, selected_option_ids})
    {:noreply, socket}
  end
end
