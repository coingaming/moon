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
