defmodule MoonWeb.Pages.ExamplePages.TransactionsPage do
  @moduledoc """
  Sample page for transactions based on https://www.figma.com/file/vn8wTPWLxL2Yy936qo3m6k/Master-DEV?node-id=12%3A8036
  Data generated and filtered on liveview, so you need to delete these methods while using this as a template
  if you use;
  ```
    <TransactionsFilters id="transaction_filters" {=@filter_options} />
  ```
  Only required functions is;
  ```
    def handle_info({:apply_filter, selected_option_ids}, socket) do
      ...
    end
    ...
  ```
  because TransactionFilters sends selected filters to liveview, liveview is responsible to filter with cnts & models.
  """

  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Heading

  alias MoonWeb.Pages.ExamplePages.Shared
  alias Shared.TopMenu
  alias Shared.LeftMenu
  alias Shared.Breadcrumbs
  alias __MODULE__.TransactionsFilters
  alias __MODULE__.TransactionsTable
  alias MoonWeb.Pages.ExamplePages.Helpers

  require Logger

  @max_record 100
  @default_page_count 10

  @dropdown_filter_map %{
    brand_filter: :brand_filter_values,
    currency_filter: :currency_filter_values,
    country_filter: :country_filter_values,
    username_filter: :username_filter_values,
    create_date_filter: :create_date_values,
    amount_range_filter: :amount_range_values
  }

  data breadcrumbs, :any,
    default: [%{name: "Transactions", to: "/lab-light/example-pages/transactions"}]

  data filters, :map, default: %{}
  data segments, :list, default: []
  data sort_by, :tuple, default: {nil, nil}
  data page, :integer, default: 1
  data page_count, :integer, default: @default_page_count
  data total_count, :integer, default: 0
  data active_transaction, :map, default: %{id: nil}
  data filter_options, :map, default: %{}
  data transactions, :list, default: []

  def mount(params, _session, socket) do
    socket =
      if socket.transport_pid != nil do
        original_transactions = get_transactions()

        socket =
          assign(socket,
            original_transactions: original_transactions,
            total_count: length(original_transactions)
          )

        %{filters: filters} = assigns = socket.assigns
        transactions = get_filtered_transactions(filters, assigns)
        filter_options = prepare_options(original_transactions)
        assign(socket, filter_options: filter_options, transactions: transactions)
      else
        filter_options = prepare_options([])
        assign(socket, filter_options: filter_options)
      end

    {:ok,
     assign(apply_paging(socket),
       theme_name: params["theme_name"] || "sportsbet-dark",
       active_page: __MODULE__
     ), layout: {MoonWeb.LayoutView, "clean.html"}}
  end

  def render(assigns) do
    ~F"""
    <div id="transactions-page" class={"#{@theme_name}"}>
      <TopMenu id="top-menu" />
      <div class="flex">
        <LeftMenu />

        <div class="px-14 py-6">
          <Breadcrumbs breadcrumbs={@breadcrumbs} class="mb-2" />
          <Heading size={32}>Transactions</Heading>
          <TopToDown class="mt-6">
            <TransactionsFilters id="transaction_filters" {=@filter_options} />
            <TransactionsTable
              id="transaction_list"
              records={@transactions}
              {=@total_count}
              {=@page_count}
              page={@page}
              sort_by={@sort_by}
              active_id={@active_transaction.id}
            />
          </TopToDown>
        </div>
      </div>
    </div>
    """
  end

  def handle_info({:table, table_event}, socket) do
    {refresh_list, socket} =
      case table_event do
        {:paginate, page} ->
          {true, assign(socket, page: page)}

        {:select, transaction} ->
          {false, assign(socket, active_transaction: transaction)}

        {:sort, sort_by} ->
          {true, assign(socket, sort_by: sort_by, page: 1)}

        _ ->
          {false, socket}
      end

    if refresh_list do
      transactions =
        socket.assigns.filters
        |> get_filtered_transactions(socket.assigns)

      {:noreply, socket |> assign(transactions: transactions) |> apply_paging()}
    else
      {:noreply, socket}
    end
  end

  def handle_info({:filters, {filter, values}}, socket) do
    IO.inspect({filter, values}, label: "old version of filter apply message received?")
    {:noreply, socket}
  end

  def handle_info({:filter, {filter_id, :apply, selected_items}}, socket) do
    filters =
      socket.assigns.filters
      |> Map.put(filter_id, selected_items)

    transactions =
      filters
      |> get_filtered_transactions(socket.assigns)

    # only changed filter's event sent is not work sometimes.. therefore I've sent all
    Enum.each(filters, fn {filter, selected_items} ->
      send_update(TransactionsFilters,
        id: "transaction_filters",
        "#{@dropdown_filter_map[filter]}": selected_items
      )
    end)

    {:noreply,
     socket |> assign(transactions: transactions, filters: filters, page: 1) |> apply_paging()}
  end

  def handle_info({:clear_filter}, socket) do
    # need to have defaults here
    filters = %{}

    transactions =
      filters
      |> get_filtered_transactions(socket.assigns)

    {:noreply,
     socket |> assign(transactions: transactions, filters: filters, page: 1) |> apply_paging()}
  end

  def handle_info({:save_segment}, socket) do
    filters = socket.assigns.filters

    new_segment = %{
      id: Faker.random_between(100, 10000),
      name: Faker.Finance.Stock.ticker(),
      filters: filters
    }

    segments = socket.assigns.segments ++ new_segment

    send_update(MoonWeb.Pages.ExamplePages.Shared.LeftMenu, id: "left-menu", segments: segments)

    {:noreply, assign(socket, segments: segments, filters: filters)}
  end

  defp get_filtered_transactions(selected_option_ids, assigns) do
    get_transactions(assigns)
    |> get_filtered_transactions_by(:brand_id, selected_option_ids[:brand_filter])
    |> get_filtered_transactions_by(:currency_id, selected_option_ids[:currency_filter])
    |> get_filtered_transactions_by(:customer_id, selected_option_ids[:username_filter])
    |> get_filtered_transactions_by(:country_id, selected_option_ids[:country_filter])
    |> get_filtered_transactions_by_amount(
      :amount_eur,
      selected_option_ids[:amount_range_filter]
    )
    |> get_filtered_transactions_by_date(:create_time, selected_option_ids[:create_date_filter])
    |> Enum.sort(fn a, b ->
      case assigns.sort_by do
        {field, :asc} -> a[field] < b[field]
        {field, :desc} -> a[field] >= b[field]
        _ -> true
      end
    end)
  end

  defp apply_paging(socket) do
    %{transactions: transactions, page: page} = socket.assigns
    records_len = length(transactions)
    total_paged = page * @default_page_count

    item_count =
      if total_paged > records_len do
        @default_page_count - (total_paged - records_len)
      else
        @default_page_count
      end

    transactions =
      transactions
      |> Enum.take(total_paged)
      |> Enum.take(-1 * item_count)

    assign(socket, transactions: transactions, page_count: item_count, total_count: records_len)
  end

  defp get_filtered_transactions_by([], _, _), do: []
  defp get_filtered_transactions_by(transactions, _, nil), do: transactions
  defp get_filtered_transactions_by(transactions, _, []), do: transactions

  defp get_filtered_transactions_by(transactions, field, selected_ids) do
    transactions
    |> Enum.filter(fn x ->
      Enum.member?(selected_ids, x[field])
    end)
  end

  defp get_filtered_transactions_by_amount([], _, _), do: []
  defp get_filtered_transactions_by_amount(transactions, _, nil), do: transactions

  defp get_filtered_transactions_by_amount(transactions, field, %{min: min, max: max}) do
    min = Helpers.to_integer(min, nil)
    max = Helpers.to_integer(max, nil)

    if min == nil && max == nil do
      transactions
    else
      transactions
      |> Enum.filter(fn x ->
        (min == nil || min <= x[field]) && (x[field] <= max || max == nil)
      end)
    end
  end

  defp get_filtered_transactions_by_date([], _, _), do: []
  defp get_filtered_transactions_by_date(transactions, _, nil), do: transactions

  defp get_filtered_transactions_by_date(transactions, field, %{start_date: min, end_date: max}) do
    transactions
    |> Enum.filter(fn x ->
      date_field = x[field]

      with :lt <- NaiveDateTime.compare(min, date_field),
           :lt <- NaiveDateTime.compare(date_field, max) do
        true
      else
        _ ->
          false
      end
    end)
  end

  defp prepare_options(transactions) do
    transactions
    |> Enum.reduce(
      %{brand: [], currency: [], customer: [], country: []},
      fn %{
           brand_name: brand_name,
           brand_id: brand_id,
           currency_name: currency_name,
           currency_id: currency_id,
           customer_name: customer_name,
           customer_id: customer_id,
           country_name: country_name,
           country_id: country_id
         },
         %{brand: acc_brand, currency: acc_currency, customer: acc_customer, country: acc_country} =
           acc ->
        acc
        |> Map.put(:brand, [%{label: brand_name, value: brand_id} | acc_brand])
        |> Map.put(:currency, [%{label: currency_name, value: currency_id} | acc_currency])
        |> Map.put(:customer, [%{label: customer_name, value: customer_id} | acc_customer])
        |> Map.put(:country, [%{label: country_name, value: country_id} | acc_country])
      end
    )
    |> Enum.map(fn {key, options} ->
      {key, Enum.uniq_by(options, fn %{value: value} -> value end)}
    end)
    |> Keyword.put(:create_date, %{
      start_date: Timex.beginning_of_week(Timex.today()),
      end_date: Timex.end_of_week(Timex.today())
    })
  end

  defp get_transactions(%{original_transactions: transactions}), do: transactions
  defp get_transactions(_), do: get_transactions()

  def get_transactions() do
    Logger.info("Preparing mock data set..!")

    brand_list = [
      "Aposta10",
      "Bitcasino",
      "Slots",
      "Sportsbet"
    ]

    brand_list_len = length(brand_list)

    currency_list = [
      "ada",
      "ars",
      "bdt",
      "bob",
      "brl",
      "btc",
      "cad",
      "clp",
      "cny",
      "crc",
      "eth",
      "eur",
      "gel",
      "hkd",
      "usd",
      "usdt"
    ]

    currency_list_len = length(currency_list)

    country_list = [
      %{id: "1", name: "Estonia"},
      %{id: "2", name: "France"},
      %{id: "3", name: "Germany"},
      %{id: "4", name: "Ukraine"},
      %{id: "5", name: "United Kingdom"}
    ]

    country_list_len = length(country_list)

    user_count = Faker.random_between(1, @max_record)

    0..user_count
    |> Enum.to_list()
    |> Enum.map(fn customer_id ->
      brand_id = Faker.random_between(1, brand_list_len)
      brand_name = Enum.at(brand_list, brand_id - 1)
      currency_id = Faker.random_between(1, currency_list_len)
      currency_name = String.upcase(Enum.at(currency_list, currency_id - 1))

      %{id: country_id, name: country_name} =
        Enum.at(country_list, Faker.random_between(1, country_list_len - 1))

      tag_list = [
        ["VIP"],
        ["VIP", "DISABLE SERVICE"],
        ["CLOSED", "PROMO"],
        ["VIP", "PROMO EXCLUDED", "CLOSED", "MULTI ACCOUNTING"]
      ]

      status_list = ["CONFIRMED", "DECLINED", "PROCESSING"]
      amount = Faker.random_between(59, 59999)
      amount_eur = (amount * (Faker.random_between(1, 199) / 100)) |> Float.round(2)

      %{
        id: customer_id |> Integer.to_string(),
        customer_name: "#{Faker.Person.En.first_name()} #{Faker.Person.En.last_name()}",
        customer_id: customer_id |> Integer.to_string(),
        brand_id: brand_id |> Integer.to_string(),
        brand_name: brand_name,
        brand_logo: "logo_#{brand_name}_short",
        currency_name: currency_name,
        currency_id: currency_id |> Integer.to_string(),
        country_id: country_id,
        country_name: country_name,
        amount: amount,
        amount_eur: amount_eur,
        ending_amount: amount,
        ending_amount_eur: amount_eur,
        create_time: Faker.NaiveDateTime.backward(30),
        process_time: Faker.NaiveDateTime.backward(30),
        status: Enum.random(status_list),
        tags: Enum.random(tag_list),
        description: Faker.Lorem.sentence(4)
      }
    end)
  end
end
