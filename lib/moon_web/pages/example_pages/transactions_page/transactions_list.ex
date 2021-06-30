defmodule MoonWeb.Pages.ExamplePages.TransactionsPage.TransactionsList do
  use MoonWeb, :stateful_component

  alias Moon.Components.Badge
  alias Moon.Assets.Logo
  alias Moon.Components.Table
  alias Moon.Autolayouts.LeftToRight

  data transactions, :any
  data filters, :list, default: []

  def mount(assigns) do
    {:ok, assign(assigns, transactions: get_transactions())}
  end

  def render(assigns) do
    ~F"""
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
        <tr class={Table.get_row_class(i)} :for.with_index={{transaction, i} <- @transactions}>
          <td>{transaction.aff_username}</td>
          <td>{transaction.aff_id}</td>
          <td>
            <LeftToRight>
              <Logo name={transaction.brand_logo} />
              <div>{transaction.brand}</div>
            </LeftToRight>
          </td>
          <td>{transaction.create_time}</td>
          <td>{transaction.process_time}</td>
          <td><Badge background_color={bg_color(transaction.status)} color={color(transaction.status)}>{transaction.status}</Badge></td>
          <td><LeftToRight><Badge background_color={bg_color(tag)} color={color(tag)} :for={tag <- transaction.tags}>{tag}</Badge></LeftToRight></td>
        </tr>
      </tbody>
    </Table>
    """
  end

  def bg_color(_str) do
    "roshi-10"
  end

  def color(_str) do
    "roshi-100"
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
