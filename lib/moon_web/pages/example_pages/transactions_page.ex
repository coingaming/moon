defmodule MoonWeb.Pages.ExamplePages.TransactionsPage do
  use MoonWeb, :live_view

  alias Moon.Components.Form
  alias Moon.Components.TextInput
  alias Moon.Assets.Icons.IconSettings
  alias Moon.Assets.Icons.IconBell
  alias Moon.Assets.Icons.IconLiveChat

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
      <div class="flex space-x-4 p-4 content-center">
        <div>LAB</div>
        <Form for={{ :search_map }} change="update_search_map" submit="close_search" autocomplete="off" class="w-full relative">
          <TextInput
            left_icon="icon_zoom"
            right_icon={{ should_show_close_search(@search_map) && "icon_close_rounded" }}
            right_icon_click="clear_search"
            placeholder="Search for dashboard, segments and more"
            field={{ :search_text }}
            value={{ @search_map.search_text }}
            on_focus="activate_search"
            on_blur="deactivate_search"
          />
          <SearchResults id="search" search_text={{ @search_map.search_text }} :if={{ @search_active }} />
        </Form>
        <div class="flex">
          <MenuButton><IconSettings /></MenuButton>
          <MenuButton><IconLiveChat /></MenuButton>
          <MenuButton><IconBell /></MenuButton>
        </div>
      </div>
      <div class="flex">
        <LeftMenu id="left-menu"/>
        <TransactionsList id="transactions" />
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
