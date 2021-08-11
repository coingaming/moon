defmodule MoonWeb.Pages.ExamplePages.MarketingPage do
  use MoonWeb, :live_view

  alias Moon.Components.Heading

  alias MoonWeb.Pages.ExamplePages.Shared
  alias Shared.TopMenu
  alias Shared.LeftMenu
  alias Shared.Breadcrumbs

  data breadcrumbs, :any,
    default: [%{name: "Marketing", to: "/lab-light/example-pages/marketing"}]

  def mount(params, _session, socket) do
    {:ok,
     assign(socket,
       theme_name: params["theme_name"] || "sportsbet-dark",
       active_page: __MODULE__,
       transactions: MoonWeb.Pages.ExamplePages.TransactionsPage.get_transactions()
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
          <Heading size={32} class="pt-4 pb-8">Marketing</Heading>
          <!-- <TransactionsList transactions={@transactions} /> -->
        </div>
      </div>
    </div>
    """
  end
end
