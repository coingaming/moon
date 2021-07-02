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

  def get_brand_options do
    [
      %{label: "Bitcasino", value: "1"},
      %{label: "Sportsbet", value: "2"}
    ]
  end

  def get_currency_options do
    [
      %{label: "Currency 1", value: "1"},
      %{label: "Currency 2", value: "2"},
      %{label: "Currency 3", value: "3"},
      %{label: "Currency 4", value: "4"},
      %{label: "Currency 5", value: "5"}
    ]
  end

  def mount(params, _session, socket) do
    {:ok,
     assign(socket,
       theme_name: params["theme_name"] || "sportsbet-dark",
       active_page: __MODULE__,
       transactions: get_transactions(),
       brand_options: get_brand_options(),
       currency_options: get_currency_options(),
       selected_brand_ids: [],
       selected_currency_ids: [],
       brand_search: %{value: ""},
       currency_search: %{value: ""}
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
            <TransactionsFilters id="transaction_filters" {=@selected_currency_ids} {=@selected_brand_ids} {=@brand_options} {=@currency_options} />
            <TransactionsList transactions={@transactions} />
          </TopToDown>
        </div>
      </div>
    </div>
    """
  end

  def handle_info({:upsert_filter, filter_value}, socket) do
    {:noreply,
     assign(socket, filters: [filter_value], transactions: [List.first(get_transactions())])}
  end

  def handle_info(:remove_filters, socket) do
    {:noreply, assign(socket, filters: [], transactions: get_transactions())}
  end

  def toggle_id_in_list(list_ids, toggled_item_id) do
    enabled = Enum.member?(list_ids, toggled_item_id)

    if enabled do
      Enum.filter(list_ids, fn x -> x != toggled_item_id end)
    else
      list_ids ++ [toggled_item_id]
    end
  end

  def handle_event(
        "handle_brand_search_changed",
        %{"brand_search" => %{"value" => value}},
        socket
      ) do
    {:noreply,
     assign(
       socket,
       brand_search: %{value: value}
     )}
  end

  def handle_event(
        "handle_brand_selection_changed",
        %{"toggled_item_id" => toggled_item_id},
        socket
      ) do
    new_ids = toggle_id_in_list(socket.assigns.selected_brand_ids, toggled_item_id)

    {:noreply, assign(socket, selected_brand_ids: new_ids)}
  end

  def handle_event(
        "handle_brand_selection_cleared",
        _,
        socket
      ) do
    {:noreply, assign(socket, selected_brand_ids: [])}
  end

  def handle_event(
        "handle_brand_selection_apply",
        _,
        socket
      ) do
    {:noreply, assign(socket, transactions: Enum.filter(get_transactions(), fn x ->
      Enum.member?(socket.assigns.selected_brand_ids, x.brand_id)
    end))}
  end

  def handle_event(
        "handle_currency_search_changed",
        %{"currency_search" => %{"value" => value}},
        socket
      ) do
    {:noreply,
     assign(
       socket,
       currency_search: %{value: value}
     )}
  end

  def handle_event(
        "handle_currency_selection_changed",
        %{"toggled_item_id" => toggled_item_id},
        socket
      ) do
    new_ids = toggle_id_in_list(socket.assigns.selected_currency_ids, toggled_item_id)

    {:noreply, assign(socket, selected_currency_ids: new_ids)}
  end

  def handle_event(
        "handle_currency_selection_cleared",
        _,
        socket
      ) do
    {:noreply, assign(socket, selected_currency_ids: [])}
  end

  defp prepare_filters(_transactions) do
    [
      %{label: "Bitcasino", value: "1"},
      %{label: "Sportsbet", value: "2"}
    ]
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
        create_time: "May 14, 2020, 12:45:57",
        process_time: "May 14, 2020, 12:45:57",
        status: "Confirmed",
        tags: ["Asia", "Tag 2"]
      },
      %{
        aff_username: "123456",
        aff_id: "123",
        brand_logo: "logo_bitcasino_short",
        brand: "Bitcasino",
        brand_id: "1",
        currency: "EUR",
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
        create_time: "May 14, 2020, 12:45:57",
        process_time: "May 14, 2020, 12:45:57",
        status: "Confirmed",
        tags: ["Asia"]
      }
    ]
  end
end
