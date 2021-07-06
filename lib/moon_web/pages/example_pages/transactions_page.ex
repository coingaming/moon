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

  data breadcrumbs, :any,
    default: [%{name: "Transactions", to: "/lab-light/example-pages/transactions"}]

  defp prepare_options(transactions) do
    %{}
    |> get_brand_options(transactions)
    |> get_currency_options(transactions)
    |> get_user_options(transactions)
  end

  defp get_brand_options(options, transactions) do
    transaction_options = transactions
    |> Enum.reduce([], fn %{ brand: label, brand_id: value }, acc ->
      [%{ label: label, value: value } | acc]
    end)
    |> Enum.uniq_by(fn %{value: value} -> value end)

    Map.put(options, :brand, transaction_options)
  end

  defp get_currency_options(options, transactions) do
    transaction_options = transactions
    |> Enum.reduce([], fn %{ currency: label, currency_id: value }, acc ->
      [%{ label: label, value: value } | acc]
    end)
    |> Enum.uniq_by(fn %{value: value} -> value end)

    Map.put(options, :currency, transaction_options)
  end

  defp get_user_options(options, transactions) do
    transaction_options = transactions
    |> Enum.reduce([], fn %{ aff_username: label, aff_id: value }, acc ->
      [%{ label: label, value: value } | acc]
    end)
    |> Enum.uniq_by(fn %{value: value} -> value end)

    Map.put(options, :user, transaction_options)
  end

  def get_filtered_transactions(selected_option_ids) do
    get_transactions()
    |> get_filtered_transactions_by_brand(selected_option_ids.brand)
    |> get_filtered_transactions_by_currency(selected_option_ids.currency)
    |> get_filtered_transactions_by_users(selected_option_ids.user)
  end

  defp get_filtered_transactions_by_users([], _), do: []
  defp get_filtered_transactions_by_users(transactions, nil),  do: transactions
  defp get_filtered_transactions_by_users(transactions, []),  do: transactions
  defp get_filtered_transactions_by_users(transactions, selected_users_ids) do
    transactions
    |> Enum.filter(fn x ->
      Enum.member?(selected_users_ids, x.aff_id)
    end)
  end

  def get_filtered_transactions_by_brand(transactions, selected_brand_ids) do
    case selected_brand_ids do
      [] ->
        transactions
      _ ->
        Enum.filter(transactions, fn x ->
          Enum.member?(selected_brand_ids, x.brand_id)
        end)
    end
  end

  def get_filtered_transactions_by_currency(transactions, selected_currency_ids) do
    case selected_currency_ids do
      [] ->
        transactions
      _ ->
        Enum.filter(transactions, fn x ->
          Enum.member?(selected_currency_ids, x.currency_id)
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
       filter_options: filter_options,
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

  def toggle_id_in_list(list_ids, toggled_item_id) do
    enabled = Enum.member?(list_ids, toggled_item_id)

    if enabled do
      Enum.filter(list_ids, fn x -> x != toggled_item_id end)
    else
      list_ids ++ [toggled_item_id]
    end
  end

  def handle_info(
    {:apply_filter, selected_option_ids},
    socket
  ) do
    transactions = selected_option_ids
      |> get_filtered_transactions()

    # It's possible to change filter_options values based on transactions
    {:noreply, assign(socket, transactions: transactions)}
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
        create_time: "May 14, 2020, 12:45:57",
        process_time: "May 14, 2020, 12:45:57",
        status: "Confirmed",
        tags: ["Asia"]
      }
    ]
  end
end
