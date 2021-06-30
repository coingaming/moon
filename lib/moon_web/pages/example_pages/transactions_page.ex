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

  def mount(params, _session, socket) do
    {:ok,
     assign(socket,
       theme_name: params["theme_name"] || "sportsbet-dark",
       active_page: __MODULE__
     ), layout: {MoonWeb.LayoutView, "clean.html"}}
  end

  def render(assigns) do
    ~F"""
    <div class={"#{@theme_name}"}>
      <TopMenu id="top-menu" />
      <div class="flex">
        <LeftMenu id="left-menu" />
        <div class="p-4 pt-8">
          <Breadcrumbs breadcrumbs={@breadcrumbs} />
          <Heading size={32} class="pt-4 pb-8">Transactions</Heading>
          <TopToDown>
            <TransactionsFilters id="transaction_filters" />
            <TransactionsList id="transactions" />
          </TopToDown>
        </div>
      </div>
    </div>
    """
  end
end
