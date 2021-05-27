defmodule MoonWeb.Pages.ExamplePages.TransactionsPage.TransactionsList do
  use MoonWeb, :stateful_component

  alias Moon.Components.Badge
  alias Moon.Assets.Logo
  alias Moon.Components.Button
  alias Moon.Components.Chip
  alias Moon.Components.Table
  alias Moon.Components.Popover

  data transactions, :any
  data clicked_name, :string, default: "brand"

  def mount(assigns) do
    {:ok, assign(assigns, transactions: get_transactions())}
  end

  def render(assigns) do
    ~H"""
    <div>
      <div class="flex gap-2 relative z-10 max-w-full flex-wrap">

        <div class="relative">
          <Chip on_click="open_popover" value="search" left_icon="icon_zoom">Search</Chip>
          <Popover close="close_popover" placement="under" :if={{ @clicked_name == "search" }}>
            Yay
          </Popover>
        </div>

        <div class="relative">
          <Chip on_click="open_popover" value="timeframe" right_icon="icon_chevron_down_rounded">
            Last 7 days
          </Chip>
          <Popover close="close_popover" placement="under" :if={{ @clicked_name == "timeframe" }}>
            Yay
          </Popover>
        </div>

        <div class="relative">
          <Chip on_click="open_popover" value="brand" right_icon="icon_chevron_down_rounded">Brand · All</Chip>
          <Popover close="close_popover" placement="under" :if={{ @clicked_name == "brand" }}>
            Yay
          </Popover>
        </div>

        <div class="relative">
          <Chip on_click="open_popover" value="users" right_icon="icon_chevron_down_rounded">Users · 1</Chip>
          <Popover close="close_popover" placement="under" :if={{ @clicked_name == "users" }}>
            Yay
          </Popover>
        </div>

        <div class="relative">
          <Chip on_click="open_popover" value="country" right_icon="icon_chevron_down_rounded">Country · All</Chip>
          <Popover close="close_popover" placement="under" :if={{ @clicked_name == "country" }}>
            Yay
          </Popover>
        </div>

        <div class="relative">
          <Chip on_click="open_popover" value="range" right_icon="icon_chevron_down_rounded">Range · All</Chip>
          <Popover close="close_popover" placement="under" :if={{ @clicked_name == "range" }}>
            Yay
          </Popover>
        </div>

        <div class="relative">
          <Chip on_click="open_popover" value="status" right_icon="icon_chevron_down_rounded">Status · All</Chip>
          <Popover close="close_popover" placement="under" :if={{ @clicked_name == "status" }}>
            Yay
          </Popover>
        </div>

        <div class="relative">
          <Chip on_click="open_popover" value="more_filters" right_icon="icon_chevron_down_rounded">More filters</Chip>
          <Popover close="close_popover" placement="under" :if={{ @clicked_name == "more_filters" }}>
            Yay
          </Popover>
        </div>

        <Button left_icon="icon_timer">Save segment</Button>
        <Button>Clear all</Button>
      </div>
      <Table class="mt-8">
        <thead>
          <th>Aff username</th>
          <th>Aff id</th>
          <th>Brand</th>
          <th>Create time</th>
          <th>Process time</th>
          <th>Status</th>
          <th>Tags</th>
        </thead>
        <tbody>
          <tr class={{ Table.get_row_class(i) }} :for.with_index={{ {transaction, i} <- @transactions }}>
            <td>{{ transaction.aff_username }}</td>
            <td>{{ transaction.aff_id }}</td>
            <td>
              <div class="flex gap-2">
                <Logo name={{ transaction.brand_logo }} />
                <div>{{ transaction.brand }}</div>
              </div>
            </td>
            <td>{{ transaction.create_time }}</td>
            <td>{{ transaction.process_time }}</td>
            <td><Badge background_color="krillin-100">{{ transaction.status }}</Badge></td>
            <td><Badge background_color="krillin-100">{{ transaction.tags }}</Badge></td>
          </tr>
        </tbody>
      </Table>
    </div>
    """
  end

  def handle_event(
        "open_popover",
        %{"click_value" => click_value},
        socket
      ) do
    {:noreply, assign(socket, clicked_name: click_value)}
  end

  def handle_event(
    "close_popover",
    _,
    socket
  ) do
    {:noreply, assign(socket, clicked_name: nil)}
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
        tags: ["Asia"]
      },
      %{
        aff_username: "123456",
        aff_id: "123",
        brand_logo: "logo_bitcasino_short",
        brand: "Bitcasino",
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
        create_time: "May 14, 2020, 12:45:57",
        process_time: "May 14, 2020, 12:45:57",
        status: "Confirmed",
        tags: ["Asia"]
      }
    ]
  end
end
