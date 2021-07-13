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
  alias __MODULE__.TransactionsList
  alias MoonWeb.Pages.ExamplePages.Helpers

  require Logger

  @max_record 100

  data breadcrumbs, :any,
    default: [%{name: "Transactions", to: "/lab-light/example-pages/transactions"}]

  defp get_filtered_transactions(selected_option_ids, assigns) do
    get_transactions(assigns)
    |> get_filtered_transactions_by(:brand_id, selected_option_ids.brand)
    |> get_filtered_transactions_by(:currency_id, selected_option_ids.currency)
    |> get_filtered_transactions_by(:aff_id, selected_option_ids.user)
    |> get_filtered_transactions_by(:country_id, selected_option_ids.country)
    |> get_filtered_transactions_by_amount(selected_option_ids.amount_range)
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

  defp get_filtered_transactions_by_amount([], _), do: []
  defp get_filtered_transactions_by_amount(transactions, nil), do: transactions

  defp get_filtered_transactions_by_amount(transactions, %{min: min, max: max}) do
    min = Helpers.to_integer(min, nil)
    max = Helpers.to_integer(max, nil)

    if min == nil && max == nil do
      transactions
    else
      transactions
      |> Enum.filter(fn x ->
        min <= x.amount && x.amount <= max
      end)
    end
  end

  def mount(params, _session, socket) do
    transactions = if socket.transport_pid != nil do
      get_transactions(socket.assigns)
    else
      []
    end
    filter_options = prepare_options(transactions)

    {:ok,
     assign(socket,
       theme_name: params["theme_name"] || "sportsbet-dark",
       active_page: __MODULE__,
       transactions: transactions,
       original_transactions: transactions,
       filter_options: filter_options
     ), layout: {MoonWeb.LayoutView, "clean.html"}}
  end

  def render(assigns) do
    ~F"""
    <div id="transactions-page" class={"#{@theme_name}"}>
      <TopMenu id="top-menu" />
      <div class="flex">
        <LeftMenu id="left-menu" />

        <div class="px-14 py-6">
          <Breadcrumbs breadcrumbs={@breadcrumbs} class="mb-2" />
          <Heading size={32}>Transactions</Heading>
          <TopToDown class="mt-6">
            <TransactionsFilters id="transaction_filters" {=@filter_options} />
            <TransactionsList transactions={@transactions} />
          </TopToDown>
        </div>
      </div>
    </div>
    """
  end

  def handle_info({:apply_filter, selected_option_ids}, socket) do
    transactions =
      selected_option_ids
      |> get_filtered_transactions(socket.assigns)

    # It's possible to change filter_options values based on transactions
    {:noreply, assign(socket, transactions: transactions)}
  end

  defp prepare_options(transactions) do
    transactions
    |> Enum.reduce(
      %{brand: [], currency: [], user: [], country: []},
      fn %{
           brand: brand,
           brand_id: brand_id,
           currency: currency,
           currency_id: currency_id,
           aff_username: user_name,
           aff_id: user_id,
           country: country,
           country_id: country_id
         },
         %{brand: acc_brand, currency: acc_currency, user: acc_user, country: acc_country} = acc ->
        acc
        |> Map.put(:brand, [%{label: brand, value: brand_id} | acc_brand])
        |> Map.put(:currency, [%{label: currency, value: currency_id} | acc_currency])
        |> Map.put(:user, [%{label: user_name, value: user_id} | acc_user])
        |> Map.put(:country, [%{label: country, value: country_id} | acc_country])
      end
    )
    |> Enum.map(fn {key, options} ->
      {key, Enum.uniq_by(options, fn %{value: value} -> value end)}
    end)
  end

  defp get_transactions(%{ original_transactions: transactions }), do: transactions
  defp get_transactions(_), do: get_transactions()
  def get_transactions() do
    Logger.info("Preparing mock data set..!")
    brand_list = ["aposta10", "bitcasino", "bombay", "comms", "hub88", "luckyslots", "moon_design", "slots", "sportsbet"]
    brand_list_len = length(brand_list)
    currency_list = ["ada", "ars", "bdt", "bob", "brl", "btc", "cad", "clp", "cny", "crc", "eth", "eur", "gel", "hkd", "usd", "usdt"]
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

    (1..user_count)
    |> Enum.to_list()
    |> Enum.map(fn x ->
      brand_id = Faker.random_between(1, brand_list_len)
      brand_name = Enum.at(brand_list, brand_id-1)
      currency_id = Faker.random_between(1, currency_list_len)
      currency_name = String.upcase(Enum.at(currency_list, currency_id-1))
      %{id: country_id, name: country_name} = Enum.at(country_list, Faker.random_between(1, country_list_len-1))
      tag_list = [["Asia"], ["Asia", "Tag 1"], ["Asia", "Tag 2", "Tag 3"], ["Asia", "Tag 2", "Tag 3", "Tag 4"]]

      %{
        aff_username: "#{Faker.Person.En.first_name()} #{Faker.Person.En.last_name()}",
        aff_id: x |> Integer.to_string(),
        brand_id: brand_id |> Integer.to_string(),
        brand: brand_name,
        brand_logo: "logo_#{brand_name}_short",
        currency: currency_name,
        currency_id: currency_id |> Integer.to_string(),
        country_id: country_id,
        country: country_name,
        amount: Faker.random_between(200, 1000),
        create_time: Faker.DateTime.backward(100),
        process_time: Faker.DateTime.backward(100),
        status: "Confirmed",
        tags: Enum.random(tag_list)
      }
    end)
  end
end
