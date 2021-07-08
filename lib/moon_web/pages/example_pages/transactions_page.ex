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

  data breadcrumbs, :any,
    default: [%{name: "Transactions", to: "/lab-light/example-pages/transactions"}]

  defp get_filtered_transactions(selected_option_ids) do
    get_transactions()
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
    transactions = get_transactions()
    filter_options = prepare_options(transactions)

    {:ok,
     assign(socket,
       theme_name: params["theme_name"] || "sportsbet-dark",
       active_page: __MODULE__,
       transactions: get_transactions(),
       filter_options: filter_options
     ), layout: {MoonWeb.LayoutView, "clean.html"}}
  end

  def render(assigns) do
    ~F"""
    <div id="transactions-page" class={"#{@theme_name}"}>
      <TopMenu id="top-menu" />
      <div class="flex">
        <LeftMenu id="left-menu" />
        <div class="p-4 pt-8">
          <Breadcrumbs breadcrumbs={@breadcrumbs} />
          <Heading size={32} class="pt-4 pb-8">Transactions</Heading>
          <TopToDown>
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
      |> get_filtered_transactions()

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

  def get_transactions() do
    [
      %{
        aff_username: "123456",
        aff_id: "123",
        brand_logo: "logo_bitcasino_short",
        brand: "Bitcasino",
        brand_id: "1",
        currency: "EUR",
        currency_id: "1",
        country: "Japan",
        country_id: "101",
        amount: 100,
        create_time: "May 14, 2020, 12:45:57",
        process_time: "May 14, 2020, 12:45:57",
        status: "Confirmed",
        tags: ["Asia", "Tag 2"]
      },
      %{
        aff_username: "abcdefg",
        aff_id: "124",
        brand_logo: "logo_bitcasino_short",
        brand: "Bitcasino",
        brand_id: "1",
        currency: "EUR",
        currency_id: "1",
        country: "Estonia",
        country_id: "100",
        amount: 200,
        create_time: "May 14, 2020, 12:45:57",
        process_time: "May 14, 2020, 12:45:57",
        status: "Confirmed",
        tags: ["Asia"]
      },
      %{
        aff_username: "123456",
        aff_id: "123",
        brand_logo: "logo_sportsbet_short",
        brand: "Sportsbet",
        brand_id: "2",
        currency: "BTC",
        currency_id: "2",
        country: "Japan",
        country_id: "101",
        amount: 400,
        create_time: "May 14, 2020, 12:45:57",
        process_time: "May 14, 2020, 12:45:57",
        status: "Confirmed",
        tags: ["Asia"]
      },
      %{
        aff_username: "123456",
        aff_id: "123",
        brand_logo: "logo_bitcasino_short",
        brand: "Bitcasino",
        brand_id: "1",
        currency: "EUR",
        currency_id: "1",
        country: "Japan",
        country_id: "101",
        amount: 800,
        create_time: "May 14, 2020, 12:45:57",
        process_time: "May 14, 2020, 12:45:57",
        status: "Confirmed",
        tags: ["Asia"]
      }
    ]
  end
end
