defmodule MoonWeb.Pages.ExamplePages.MarketingPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Components.Heading
  alias MoonWeb.Components.Breadcrumbs
  alias MoonWeb.Pages.ExamplePages
  alias MoonWeb.Pages.ExamplePages.Shared
  alias Shared.LeftMenu
  alias Shared.TopMenu

  data breadcrumbs, :any, default: [%{name: "Marketing", to: "/example-pages/marketing"}]

  def mount(_params, _session, socket) do
    {:ok,
     assign(socket,
       transactions: ExamplePages.TransactionsPage.get_transactions()
     ), layout: {MoonWeb.LayoutView, "clean.html"}}
  end

  def render(assigns) do
    ~F"""
    <div class={"#{@theme_name}"}>
      <TopMenu id="top-menu" />
      <div class="flex">
        <LeftMenu id="left-menu" />
        <div class="p-4 pt-8">
          <Breadcrumbs theme_name={@theme_name} breadcrumbs={@breadcrumbs} />
          <Heading size={32} class="pt-4 pb-8">Marketing</Heading>
          <!-- <TransactionsList transactions={@transactions} /> -->
        </div>
      </div>
    </div>
    """
  end
end
