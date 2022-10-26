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

  alias Moon.Autolayouts.ButtonsList
  alias Moon.Autolayouts.LeftToRight
  alias Moon.Components.Button
  alias Moon.Components.Chip
  alias Moon.Components.Datepicker
  alias Moon.Components.Form
  alias Moon.Components.Popover
  alias Moon.Components.Deprecated.TextInput
  alias MoonWeb.Pages.ExamplePages.TransactionsPage.TransactionFilter

  data clicked_name, :string, default: ""
  prop filter_options, :map

  @default_amount_range_value %{min: "", max: ""}
  @default_create_date_values %{
    start_date: Timex.beginning_of_week(Timex.today()),
    end_date: Timex.end_of_week(Timex.today())
  }
  data amount_range_values, :map, default: @default_amount_range_value
  data create_date_values, :map, default: @default_create_date_values
  prop brand_filter_values, :list, default: []
  prop currency_filter_values, :list, default: []
  prop username_filter_values, :list, default: []
  prop country_filter_values, :list, default: []

  def render(assigns) do
    ~F"""
    <ButtonsList>
      <Popover show={@clicked_name == "search"} on_close="close_popover">
        <Chip value="search" left_icon="generic_search">
          Search
        </Chip>
        <:content>
          <div class="p-4 rounded shadow h-80 w-80 bg-gohan-100">
            Yay
          </div>
        </:content>
      </Popover>

      <Datepicker
        id="create_date_filter"
        start_date={@create_date_values.start_date}
        end_date={@create_date_values.end_date}
        start_date_field={:start_date}
        end_date_field={:end_date}
        button_class="font-semibold px-3"
      />

      <TransactionFilter
        name="brand_filter"
        label="Brand"
        options={@filter_options.brand}
        active_options={@brand_filter_values}
      />

      <TransactionFilter
        name="currency_filter"
        label="Currency"
        options={@filter_options.currency}
        active_options={@currency_filter_values}
      />

      <TransactionFilter
        name="username_filter"
        label="User"
        options={@filter_options.customer}
        active_options={@username_filter_values}
      />

      <TransactionFilter
        name="country_filter"
        label="Country"
        options={@filter_options.country}
        active_options={@country_filter_values}
      />

      <Popover show={@clicked_name == "range"} on_close="close_popover" placement="bottom">
        <Chip on_click="open_popover" value="range" right_icon="controls_chevron_down">Range · All</Chip>
        <:content>
          <div class="h-auto">
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
          </div>
        </:content>
      </Popover>

      <Popover show={@clicked_name == "more_filters"} on_close="close_popover" placement="bottom">
        <Chip on_click="open_popover" value="more_filters" right_icon="controls_chevron_down">More filters</Chip>
        <:content>
          <div class="p-4 rounded shadow h-80 w-80 bg-gohan-100">
            Yay
          </div>
        </:content>
      </Popover>

      <Button on_click="save_segment" left_icon="time_clock">Save segment</Button>
      <Button on_click="clear_all_filters">Clear all</Button>
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
    {:noreply, assign(socket, amount_range_values: @default_amount_range_value)}
  end

  def handle_event(
        "handle_amount_range_selection_discard",
        _,
        socket
      ) do
    {:noreply, assign(socket, amount_range_values: @default_amount_range_value)}
  end

  def handle_event(
        "handle_amount_range_apply",
        _,
        socket
      ) do
    filter_ids = socket.assigns.amount_range_values
    send(self(), {:filter, {"amount_range_filter", :apply, filter_ids}})
    {:noreply, socket}
  end

  def handle_event(
        "clear_all_filters",
        _,
        socket
      ) do
    send(self(), {:clear_filter})

    ["brand_filter", "country_filter", "username_filter", "currency_filter"]
    |> Enum.each(fn id -> TransactionFilter.clear(id) end)

    {:noreply,
     assign(
       socket,
       amount_range_values: @default_amount_range_value,
       create_date_values: @default_create_date_values
     )}
  end

  def handle_event("save_segment", _, socket) do
    send(self(), {:save_segment})
    {:noreply, socket}
  end
end