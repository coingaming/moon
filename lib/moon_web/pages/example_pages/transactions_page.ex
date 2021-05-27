defmodule MoonWeb.Pages.ExamplePages.TransactionsPage do
  use MoonWeb, :live_view

  alias Moon.Components.Heading
  alias Moon.Assets.Icons.IconSettings
  alias Moon.Assets.Icons.IconBell
  alias Moon.Assets.Icons.IconLiveChat
  alias Moon.Assets.Icons.IconChevronRightRounded

  alias __MODULE__.MenuButton
  alias __MODULE__.TransactionsList
  alias __MODULE__.LeftMenu
  alias __MODULE__.Search

  def mount(params, _session, socket) do
    {:ok,
     assign(socket,
       theme_name: params["theme_name"] || "sportsbet-dark",
       active_page: __MODULE__
     ), layout: {MoonWeb.LayoutView, "clean.html"}}
  end

  def render(assigns) do
    ~H"""
    <div class="{{ @theme_name }}">
      <div class="flex gap-2 items-center p-4 bg-gohan-100">
        <div class="p-2">LAB</div>
        <Search id="search" />
        <div class="flex gap-2 items-center">
          <MenuButton><IconSettings /></MenuButton>
          <MenuButton><IconLiveChat /></MenuButton>
          <MenuButton><IconBell /></MenuButton>
          <MenuButton class="bg-piccolo-100 text-gohan-100 relative">
            DN
            <div class="absolute right-0 bottom-0 w-3 h-3 border-2 rounded-full" style="background-color: #0CD664;"></div>
          </MenuButton>
        </div>
      </div>
      <div class="flex">
        <LeftMenu id="left-menu"/>
        <div class="p-4 pt-8">
          <div class="flex gap-2 text-sm">
            <div>Home</div>
            <div><IconChevronRightRounded /></div>
            <div>Transactions</div>
          </div>
          <Heading size=32 class="pt-4 pb-8">Transactions</Heading>
          <TransactionsList id="transactions" />
        </div>
      </div>
    </div>
    """
  end
end
