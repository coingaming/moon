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
  prop brand_options, :list
  prop currency_options, :list
  prop selected_brand_ids, :list
  prop selected_currency_ids, :list
  prop users_options, :list
  data selected_users_ids, :list, default: []
  data users_search, :map, default: %{ value: ""}

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
        <Chip on_click="open_popover" value="brand" right_icon="icon_chevron_down_rounded">Brand · All</Chip>
        <Popover close="close_popover" placement="under" :if={@clicked_name == "brand"}>
          <Dropdown
            on_search_change={"handle_brand_search_changed", target: :live_view}
            search_placeholder="Search for a brand ..."
            search_name={:brand_search}
          >
            <CheckboxMultiselect
              on_change={"handle_brand_selection_changed", target: :live_view}
              class="max-h-32"
              value={@selected_brand_ids}
              options={@brand_options}
            />
          </Dropdown>
          <Button on_click={"handle_brand_selection_cleared", target: :live_view}>Clear</Button>
          <Button on_click={"handle_brand_selection_apply", target: :live_view}>Apply</Button>
        </Popover>
      </Popover.Outer>

      <Popover.Outer>
        <Chip on_click="open_popover" value="currency" right_icon="icon_chevron_down_rounded">Currency · All</Chip>
        <Popover close="close_popover" placement="under" :if={@clicked_name == "currency"}>
          <Dropdown
            on_search_change={"handle_currency_search_changed", target: :live_view}
            search_placeholder="Search for a currency ..."
            search_name={:currency_search}
          >
            <CheckboxMultiselect
              on_change={"handle_currency_selection_changed", target: :live_view}
              class="max-h-32"
              value={@selected_currency_ids}
              options={@currency_options}
            />
          </Dropdown>
          <Button on_click={"handle_currency_selection_cleared", target: :live_view}>Clear</Button>
          <Button on_click={"handle_currency_selection_apply", target: :live_view}>Apply</Button>
        </Popover>
      </Popover.Outer>

      <Popover.Outer>
        <Chip on_click="open_popover" value="users" right_icon="icon_chevron_down_rounded">
          Users ·
          {#if @selected_users_ids == []}
            All
          {#else}
            {length(@selected_users_ids)}
          {/if}
        </Chip>
        <Popover close="close_popover" placement="under" :if={@clicked_name == "users"}>
          <Dropdown
            on_search_change="handle_users_search_changed"
            search_placeholder="Search for a users ..."
            search_name={:users_search}
          >
            <CheckboxMultiselect
              on_change="handle_users_selection_changed"
              class="max-h-32"
              value={@selected_users_ids}
              options={@users_options |> handle_search(@users_search.value) }
            />
            <LeftToRight class="justify-between p-2">
              <Button variant="danger" size="xsmall" class="rounded" on_click="handle_users_selection_cleared">
                Clear
              </Button>
              <LeftToRight>
                <Button variant="danger" size="xsmall" class="rounded border-beerus-100" on_click="handle_users_selection_discard">
                  Discard
                </Button>
                <Button variant="primary" size="xsmall" class="rounded" on_click="handle_users_selection_apply">
                  Apply
                </Button>
              </LeftToRight>
            </LeftToRight>
          </Dropdown>
        </Popover>
      </Popover.Outer>

      <Popover.Outer>
        <Chip on_click="open_popover" value="country" right_icon="icon_chevron_down_rounded">Country · All</Chip>
        <Popover close="close_popover" placement="under" :if={@clicked_name == "country"}>
          Yay
        </Popover>
      </Popover.Outer>

      <Popover.Outer>
        <Chip on_click="open_popover" value="range" right_icon="icon_chevron_down_rounded">Range · All</Chip>
        <Popover close="close_popover" placement="under" :if={@clicked_name == "range"}>
          Yay
        </Popover>
      </Popover.Outer>

      <Popover.Outer>
        <Chip on_click="open_popover" value="status" right_icon="icon_chevron_down_rounded">Status · All</Chip>
        <Popover close="close_popover" placement="under" :if={@clicked_name == "status"}>
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
    |> Enum.filter(&(String.contains?(String.upcase(&1.label), search_text)))
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
        "handle_users_search_changed",
        %{"users_search" => %{"value" => value}},
        socket
      ) do

    {:noreply,
     assign(
       socket,
       users_search: %{value: value}
     )}
  end

  def handle_event(
        "handle_users_selection_changed",
        assigns,
        socket
      ) do
    %{"toggled_item_id" => toggled_item_id} = assigns
    new_ids = toggle_id_in_list(socket.assigns.selected_users_ids, toggled_item_id)

    {:noreply, assign(socket, selected_users_ids: new_ids)}
  end

  def handle_event(
        "handle_users_selection_cleared",
        _,
        socket
      ) do
    {:noreply, assign(socket, selected_users_ids: [])}
  end

  def handle_event(
    "handle_users_selection_discard",
    _,
    socket
  ) do
    send(self(), {:apply_filter, %{ selected_users_ids: [] }})
    {:noreply, assign(socket, selected_users_ids: [])}
  end

  def handle_event(
        "handle_users_selection_apply",
        _,
        socket
      ) do
    send(self(), {:apply_filter, %{ selected_users_ids: socket.assigns.selected_users_ids }})
    {:noreply, socket}
  end

end
