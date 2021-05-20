defmodule MoonWeb.Pages.ExamplePages.TransactionsPage.MenuButton do
  use MoonWeb, :stateless_component

  slot default

  def render(assigns) do
    ~H"""
    <div class="p-4"><slot /></div>
    """
  end
end

defmodule MoonWeb.Pages.ExamplePages.TransactionsPage.SearchResults do
  use MoonWeb, :stateful_component

  alias Moon.Assets.Icon

  prop search_text, :string
  data search_results, :any

  def mount(assigns) do
    {:ok, assign(assigns, search_results: get_search_results(""))}
  end

  def render(assigns) do
    ~H"""
    <div class="p-4 bg-gohan-100 shadow rounded absolute w-full mt-4">
      <div class="p-4" :for={{ section <- @search_results }}>
        <div class="pb-4">{{ section.title }}</div>
        <div class="pb-4" :for={{ child <- section.children }}>
          <Icon name={{ child.icon }} class="mr-4" />
          {{ child.text }}
        </div>
      </div>
    </div>
    """
  end

  def get_search_results(search_text) do
    [
      %{
        title: "Transactions",
        children: [
          %{icon: "icon_arrow_diagonals", text: "Pending withdrawal"},
          %{icon: "icon_arrow_diagonals", text: "Pending deposits"}
        ]
      },
      %{
        title: "Marketing",
        children: [
          %{icon: "icon_forward", text: "Rewards"},
          %{icon: "icon_forward", text: "Freebet offers"},
          %{icon: "icon_forward", text: "Reward instances"},
          %{icon: "icon_forward", text: "Bonuses"},
          %{icon: "icon_forward", text: "Bonus groups"}
        ]
      },
      %{
        title: "Sites",
        children: []
      },
      %{
        title: "Log audits",
        children: [
          %{icon: "icon_forward", text: "Records list"}
        ]
      }
    ]
  end
end

defmodule MoonWeb.Pages.ExamplePages.TransactionsPage.TransactionsList do
  use MoonWeb, :stateful_component

  alias Moon.Assets.Icon

  data transactions, :any

  def mount(assigns) do
    {:ok, assign(assigns, transactions: get_transactions())}
  end

  def render(assigns) do
    ~H"""
    <table class="table-auto">
      <thead>
        <th class="p-4">Aff username</th>
        <th class="p-4">Aff id</th>
        <th class="p-4">Brand</th>
        <th class="p-4">Create time</th>
        <th class="p-4">Process time</th>
        <th class="p-4">Status</th>
        <th class="p-4">Tags</th>
      </thead>
      <tbody>
        <tr class={{ get_row_class(i) }} :for.with_index={{ {transaction, i} <- @transactions }}>
          <td class="p-4">{{ transaction.aff_username }}</td>
          <td class="p-4">{{ transaction.aff_id }}</td>
          <td class="p-4">{{ transaction.brand }}</td>
          <td class="p-4">{{ transaction.create_time }}</td>
          <td class="p-4">{{ transaction.process_time }}</td>
          <td class="p-4">{{ transaction.status }}</td>
          <td class="p-4">{{ transaction.tags }}</td>
        </tr>
      </tbody>
    </table>
    """
  end

  def get_row_class(i) do
    rem(i, 2) == 0 && "bg-gohan-100"
  end

  def get_transactions() do
    [
      %{
        aff_username: "123456",
        aff_id: "123",
        brand_logo: "logo_bitcasino_short",
        brand: "Bitcasino",
        create_time: "May 14, 2020, 12:45:57",
        process_time: "May 14, 2020, 12:45:57",
        status: "Confirmed",
        tags: "Asia"
      },
      %{
        aff_username: "123456",
        aff_id: "123",
        brand_logo: "logo_bitcasino_short",
        brand: "Bitcasino",
        create_time: "May 14, 2020, 12:45:57",
        process_time: "May 14, 2020, 12:45:57",
        status: "Confirmed",
        tags: "Asia"
      },
      %{
        aff_username: "123456",
        aff_id: "123",
        brand_logo: "logo_bitcasino_short",
        brand: "Bitcasino",
        create_time: "May 14, 2020, 12:45:57",
        process_time: "May 14, 2020, 12:45:57",
        status: "Confirmed",
        tags: "Asia"
      }
    ]
  end
end

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
      <TransactionsList id="transactions" />
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
