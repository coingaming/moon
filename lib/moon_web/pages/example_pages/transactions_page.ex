defmodule MoonWeb.Pages.ExamplePages.TransactionsPage do
  use MoonWeb, :live_view

  alias Moon.Components.Form
  alias Moon.Components.TextInput
  alias Moon.Components.Heading
  alias Moon.Components.Button
  alias Moon.Assets.Icons.IconSettings
  alias Moon.Assets.Icons.IconBell
  alias Moon.Assets.Icons.IconLiveChat
  alias Moon.Assets.Icons.IconChevronRightRounded

  alias __MODULE__.MenuButton
  alias __MODULE__.SearchResults
  alias __MODULE__.TransactionsList
  alias __MODULE__.LeftMenu

  require Logger

  @default_search_map %{search_text: ""}

  def mount(params, _session, socket) do
    {:ok,
     assign(socket,
       search_active: false,
       search_map: @default_search_map,
       theme_name: params["theme_name"] || "sportsbet-dark",
       active_page: __MODULE__
     ), layout: {MoonWeb.LayoutView, "clean.html"}}
  end

  def render(assigns) do
    ~H"""
    <div class="sportsbet-dark">
      <div class="flex gap-2 items-center p-4 bg-gohan-100">
        <div>LAB</div>
        <div class="w-full relative z-20">
          <Form for={{ :search_map }} change="update_search_map" submit="close_search" autocomplete="off" class="max-w-md relative">
            <TextInput
              left_icon="icon_zoom"
              right_icon={{ should_show_close_search(@search_map) && "icon_close_rounded" }}
              right_icon_click="clear_search"
              placeholder="Search for dashboard, segments and more"
              field={{ :search_text }}
              value={{ @search_map.search_text }}
              on_focus="activate_search"
              on_blur="deactivate_search"
              class="bg-goku-100"
            />
            <SearchResults id="search" search_text={{ @search_map.search_text }} :if={{ @search_active }} />
          </Form>
        </div>
        <div class="flex gap-2 items-center">
          <MenuButton><IconSettings /></MenuButton>
          <MenuButton><IconLiveChat /></MenuButton>
          <MenuButton><IconBell /></MenuButton>
        </div>
      </div>
      <div class="flex">
        <LeftMenu id="left-menu"/>
        <div>
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

  def should_show_close_search(search_map) do
    String.length(search_map.search_text) > 0
  end

  def handle_event(
        "update_search_map",
        %{"search_map" => %{"search_text" => search_text}},
        socket
      ) do
    {:noreply, assign(socket, search_active: true, search_map: %{search_text: search_text})}
  end

  def handle_event(
        "activate_search",
        _,
        socket
      ) do
    {:noreply, assign(socket, search_active: true)}
  end

  def handle_event(
        "deactivate_search",
        _,
        socket
      ) do
    Logger.error("deactived search")
    {:noreply, assign(socket, search_active: false)}
  end

  def handle_event("clear_search", _, socket) do
    {:noreply, assign(socket, search_map: @default_search_map)}
  end
end
