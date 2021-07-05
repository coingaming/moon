defmodule MoonWeb.Pages.ExamplePages.TransactionsPage.TransactionsFilters do
  use MoonWeb, :stateful_component

  alias Moon.Components.Button
  alias Moon.Components.Chip
  alias Moon.Components.Popover
  alias Moon.Components.Dropdown
  alias Moon.Components.CheckboxMultiselect
  alias Moon.Autolayouts.ButtonsList

  data clicked_name, :string, default: ""
  prop brand_options, :list
  prop currency_options, :list
  prop selected_brand_ids, :list
  prop selected_currency_ids, :list

  data(brand_search, :string, default: %{value: ""})

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
        <Chip on_click="open_popover" value="users" right_icon="icon_chevron_down_rounded">Users · 1</Chip>
        <Popover close="close_popover" placement="under" :if={@clicked_name == "users"}>
          Yay
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
end
