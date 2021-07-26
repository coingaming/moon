defmodule MoonWeb.Pages.ExamplePages.TransactionsPage.TransactionsFilters do
  @moduledoc """
  Generic filter implementations, can be used for any model or any data which required included filters
  respective liveview must provide filter options and must handle `:apply_filter, filters` info message.
  ```
    <TransactionsFilters id="transaction_filters" {=@filter_options} />
  ```
  Liveview must have
  ```
    def handle_info({:apply_filter, {filter_id, selected_options}}, socket) do
      ...
    end
    ...
  ```
  """
  use MoonWeb, :stateful_component

  alias Moon.Components.Button
  alias Moon.Components.Chip
  alias Moon.Components.Popover
  alias Moon.Components.Form
  alias Moon.Components.TextInput
  alias Moon.Components.Datepicker
  alias Moon.Autolayouts.LeftToRight
  alias Moon.Autolayouts.ButtonsList
  alias MoonWeb.Pages.ExamplePages.Shared.Filters.GenericDropdown

  data clicked_name, :string, default: ""
  prop filter_options, :map

  @default_amount_range_value %{min: "", max: ""}
  @default_create_date_values %{
    end_date: DateTime.utc_now(),
    start_date: Timex.shift(DateTime.utc_now(), days: -7)
  }
  data amount_range_values, :map, default: @default_amount_range_value
  data create_date_values, :map, default: @default_create_date_values
  prop selected_brand_option_ids, :list, default: []
  prop selected_user_option_ids, :list, default: []
  prop selected_currency_option_ids, :list, default: []
  prop selected_country_option_ids, :list, default: []

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

      <Form for={:create_date_values} change="handle_create_date_selection_changed">
        <Datepicker
          id="createtime_filter"
          start_date={@filter_options.create_date.start_date}
          end_date={@filter_options.create_date.end_date}
          start_date_field={:start_date}
          end_date_field={:end_date}
          button_class="font-semibold px-3 text-trunks-100 bg-gohan-100"
          on_date_change="update_create_date_filter"
        />
      </Form>

      <GenericDropdown id="brand_filter" label="Brand" all_items={@filter_options.brand} active_items={@selected_brand_option_ids} />

      <GenericDropdown id="currency_filter" label="Currency" all_items={@filter_options.currency} active_items={@selected_currency_option_ids} />

      <GenericDropdown id="username_filter" label="User" all_items={@filter_options.customer} active_items={@selected_user_option_ids} />

      <GenericDropdown id="country_filter" label="Country" all_items={@filter_options.country} active_items={@selected_country_option_ids} />

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
              <Button on_click="handle_amount_range_apply" variant="primary">Apply</Button>
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

      <Button on_click="save_segment" left_icon="icon_timer">Save segment</Button>
      <Button on_click="clear_all_filters">Clear all</Button>
    </ButtonsList>
    """
  end

  def handle_event("handle_create_date_selection_changed", %{"create_date_values" => params}, socket) do
    IO.inspect(params, label: "create_date_values")
    {start_date, end_date} = Datepicker.validate(params["started_at"], params["ended_at"])
    create_date_values = %{end_date: end_date, start_date: start_date}

    IO.inspect(create_date_values, label: "create_date_values")

    send(self(), {:apply_filter, {"create_date_filter", create_date_values}})
    {:noreply, assign(socket, create_date_values: create_date_values)}
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
    send(self(), {:apply_filter, {"amount_range_filter", @default_amount_range_value}})
    {:noreply, assign(socket, :amount_range_values, @default_amount_range_value)}
  end

  def handle_event(
        "handle_amount_range_apply",
        _,
        socket
      ) do
    filter_ids = socket.assigns.amount_range_values
    send(self(), {:apply_filter, {"amount_range_filter", filter_ids}})
    {:noreply, socket}
  end

  def handle_event(
        "clear_all_filters",
        _,
        socket
      ) do
    send(self(), {:clear_filter})

    ["brand_filter", "country_filter", "username_filter", "currency_filter"]
    |> Enum.each(fn id ->
      send_update(GenericDropdown,
        id: id,
        selected_items: []
      )
    end)

    {:noreply, assign(socket, :amount_range_values, @default_amount_range_value)}
  end

  def handle_event("save_segment", _, socket) do
    send(self(), {:save_segment})
    {:noreply, socket}
  end
end
