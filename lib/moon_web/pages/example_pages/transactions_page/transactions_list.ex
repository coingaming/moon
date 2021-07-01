defmodule MoonWeb.Pages.ExamplePages.TransactionsPage.TransactionsList do
  use MoonWeb, :stateful_component

  alias Moon.Components.Badge
  alias Moon.Assets.Logo
  alias Moon.Components.Table
  alias Moon.Autolayouts.LeftToRight

  prop transactions, :list, required: true

  def mount(assigns) do
    {:ok, assigns}
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
end
