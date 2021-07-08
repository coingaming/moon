defmodule MoonWeb.Pages.ExamplePages.TransactionsPage do
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
    |> get_filtered_transactions_by_brand(selected_option_ids.brand)
    |> get_filtered_transactions_by_currency(selected_option_ids.currency)
    |> get_filtered_transactions_by_users(selected_option_ids.user)
    |> get_filtered_transactions_by_country(selected_option_ids.country)
    |> get_filtered_transactions_by_amount(selected_option_ids.amount_range)
  end

  defp get_filtered_transactions_by_users([], _), do: []
  defp get_filtered_transactions_by_users(transactions, nil), do: transactions
  defp get_filtered_transactions_by_users(transactions, []), do: transactions

  defp get_filtered_transactions_by_users(transactions, selected_users_ids) do
    transactions
    |> Enum.filter(fn x ->
      Enum.member?(selected_users_ids, x.aff_id)
    end)
  end

  defp get_filtered_transactions_by_brand([], _), do: []
  defp get_filtered_transactions_by_brand(transactions, nil), do: transactions
  defp get_filtered_transactions_by_brand(transactions, []), do: transactions

  defp get_filtered_transactions_by_brand(transactions, selected_brand_ids) do
    transactions
    |> Enum.filter(fn x ->
      Enum.member?(selected_brand_ids, x.brand_id)
    end)
  end

  defp get_filtered_transactions_by_currency([], _), do: []
  defp get_filtered_transactions_by_currency(transactions, nil), do: transactions
  defp get_filtered_transactions_by_currency(transactions, []), do: transactions

  defp get_filtered_transactions_by_currency(transactions, selected_currency_ids) do
    transactions
    |> Enum.filter(fn x ->
      Enum.member?(selected_currency_ids, x.currency_id)
    end)
  end

  defp get_filtered_transactions_by_country([], _), do: []
  defp get_filtered_transactions_by_country(transactions, nil), do: transactions
  defp get_filtered_transactions_by_country(transactions, []), do: transactions

  defp get_filtered_transactions_by_country(transactions, selected_country_ids) do
    transactions
    |> Enum.filter(fn x ->
      Enum.member?(selected_country_ids, x.country_id)
    end)
  end

  defp get_filtered_transactions_by_amount([], _), do: []
  defp get_filtered_transactions_by_amount(transactions, nil), do: transactions
  defp get_filtered_transactions_by_amount(transactions, %{min: 0, max: 0}), do: transactions
  defp get_filtered_transactions_by_amount(transactions, %{min: "0", max: "0"}), do: transactions
  defp get_filtered_transactions_by_amount(transactions, %{min: "", max: ""}), do: transactions

  defp get_filtered_transactions_by_amount(transactions, %{min: min, max: max}) do
    min = Helpers.to_integer(min, nil)
    max = Helpers.to_integer(max, nil)

    transactions
    |> Enum.filter(fn x ->
      (min == nil || min <= x.amount) && (max == nil || x.amount <= max)
    end)
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

  def handle_info(
        {:apply_filter, selected_option_ids},
        socket
      ) do
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
