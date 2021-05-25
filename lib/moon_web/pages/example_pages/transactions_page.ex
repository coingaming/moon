defmodule MoonWeb.Pages.ExamplePages.TransactionsPage do
  use MoonWeb, :live_view

  alias Moon.Components.Heading
  alias Moon.Components.Button
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
    <div class="sportsbet-dark">
      <div class="flex gap-2 items-center p-4 bg-gohan-100">
        <div class="p-2">LAB</div>
        <Search id="search" />
        <div class="flex gap-2 items-center">
          <MenuButton><IconSettings /></MenuButton>
          <MenuButton><IconLiveChat /></MenuButton>
          <MenuButton><IconBell /></MenuButton>
        </div>
      </div>
      <div class="flex">
        <LeftMenu id="left-menu"/>
        <div class="p-4">
          <div class="flex gap-2">
            <div>Home</div>
            <div><IconChevronRightRounded /></div>
            <div>Transactions</div>
          </div>
          <Heading size=32 class="pt-4 pb-8">Transactions</Heading>
          <div class="flex gap-2 relative z-10">
            <Button left_icon="icon_zoom" class="bg-gohan-100">Search</Button>
            <Button right_icon="icon_chevron_down_rounded" class="bg-gohan-100">Last 7 days</Button>
            <Button right_icon="icon_chevron_down_rounded" class="bg-gohan-100">Brand · All</Button>
            <Button right_icon="icon_chevron_down_rounded" class="bg-gohan-100">Users · 1</Button>
            <Button right_icon="icon_chevron_down_rounded" class="bg-gohan-100">Country · All</Button>
            <Button right_icon="icon_chevron_down_rounded" class="bg-gohan-100">Range · All</Button>
            <Button right_icon="icon_chevron_down_rounded" class="bg-gohan-100">Status · All</Button>
            <Button right_icon="icon_chevron_down_rounded" class="bg-gohan-100">More filters</Button>
          </div>
          <TransactionsList id="transactions" />
        </div>
      </div>
    </div>
    """
  end
end
