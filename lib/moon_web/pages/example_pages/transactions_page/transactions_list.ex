defmodule MoonWeb.Pages.ExamplePages.TransactionsPage.TransactionsList do
  use MoonWeb, :stateful_component

  alias Moon.Components.Badge
  alias Moon.Assets.Logo
  alias Moon.Components.Button
  alias Moon.Components.Chip
  alias Moon.Components.Table
  alias Moon.Components.Popover
  alias Moon.Autolayouts.ButtonsList
  alias Moon.Autolayouts.TopToDown
  alias Moon.Autolayouts.LeftToRight
  alias Moon.Autolayouts.ButtonsList

  data transactions, :any
  data clicked_name, :string, default: ""

  def mount(assigns) do
    {:ok, assign(assigns, transactions: get_transactions())}
  end

  def render(assigns) do
    ~H"""
    <TopToDown>
      <ButtonsList>
        <Popover.Outer>
          <Chip value="search" left_icon="icon_zoom">
            Search
          </Chip>
          <Popover close="close_popover" placement="under" :if={{ @clicked_name == "search" }}>
            Yay
          </Popover>
        </Popover.Outer>

        <Popover.Outer>
          <Chip on_click="open_popover" value="timeframe" right_icon="icon_chevron_down_rounded">
            Last 7 days
          </Chip>
          <Popover close="close_popover" placement="under" :if={{ @clicked_name == "timeframe" }}>
            Yay
          </Popover>
        </Popover.Outer>

        <Popover.Outer>
          <Chip on_click="open_popover" value="brand" right_icon="icon_chevron_down_rounded">Brand · All</Chip>
          <Popover close="close_popover" placement="under" :if={{ @clicked_name == "brand" }}>
            Yay
          </Popover>
        </Popover.Outer>

        <Popover.Outer>
          <Chip on_click="open_popover" value="users" right_icon="icon_chevron_down_rounded">Users · 1</Chip>
          <Popover close="close_popover" placement="under" :if={{ @clicked_name == "users" }}>
            Yay
          </Popover>
        </Popover.Outer>

        <Popover.Outer>
          <Chip on_click="open_popover" value="country" right_icon="icon_chevron_down_rounded">Country · All</Chip>
          <Popover close="close_popover" placement="under" :if={{ @clicked_name == "country" }}>
            Yay
          </Popover>
        </Popover.Outer>

        <Popover.Outer>
          <Chip on_click="open_popover" value="range" right_icon="icon_chevron_down_rounded">Range · All</Chip>
          <Popover close="close_popover" placement="under" :if={{ @clicked_name == "range" }}>
            Yay
          </Popover>
        </Popover.Outer>

        <Popover.Outer>
          <Chip on_click="open_popover" value="status" right_icon="icon_chevron_down_rounded">Status · All</Chip>
          <Popover close="close_popover" placement="under" :if={{ @clicked_name == "status" }}>
            Yay
          </Popover>
        </Popover.Outer>

        <Popover.Outer>
          <Chip on_click="open_popover" value="more_filters" right_icon="icon_chevron_down_rounded">More filters</Chip>
          <Popover close="close_popover" placement="under" :if={{ @clicked_name == "more_filters" }}>
            Yay
          </Popover>
        </Popover.Outer>

        <Button left_icon="icon_timer">Save segment</Button>
        <Button>Clear all</Button>
      </ButtonsList>

      <Table>
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
              <LeftToRight>
                <Logo name={{ transaction.brand_logo }} />
                <div>{{ transaction.brand }}</div>
              </LeftToRight>
            </td>
            <td>{{ transaction.create_time }}</td>
            <td>{{ transaction.process_time }}</td>
            <td><Badge background_color={{ bg_color(transaction.status) }} color={{ color(transaction.status) }}>{{ transaction.status }}</Badge></td>
            <td><LeftToRight><Badge background_color={{ bg_color(tag) }} color={{ color(tag) }} :for={{ tag <- transaction.tags }}>{{ tag }}</Badge></LeftToRight></td>
          </tr>
        </tbody>
      </Table>
    </TopToDown>
    """
  end

  def bg_color(str) do
    "roshi-10"
  end

  def color(str) do
    "roshi-100"
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
        tags: ["Asia", "Tag 2"]
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
