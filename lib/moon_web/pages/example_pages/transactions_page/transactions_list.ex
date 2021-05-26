defmodule MoonWeb.Pages.ExamplePages.TransactionsPage.TransactionsList do
  use MoonWeb, :stateful_component

  alias Moon.Components.Badge
  alias Moon.Assets.Logo
  alias Moon.Components.Button

  data transactions, :any

  def mount(assigns) do
    {:ok, assign(assigns, transactions: get_transactions())}
  end

  def render(assigns) do
    ~H"""
    <div>
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
            <td class="p-4">
              <div class="flex gap-2">
                <Logo name={{ transaction.brand_logo }} />
                <div>{{ transaction.brand }}</div>
              </div>
            </td>
            <td class="p-4">{{ transaction.create_time }}</td>
            <td class="p-4">{{ transaction.process_time }}</td>
            <td class="p-4"><Badge background_color="krillin-100">{{ transaction.status }}</Badge></td>
            <td class="p-4"><Badge background_color="krillin-100">{{ transaction.tags }}</Badge></td>
          </tr>
        </tbody>
      </table>
    </div>
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
