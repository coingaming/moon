defmodule MoonWeb.Pages.ExamplePages.AffiliatesPage.AffiliatesList do
  use MoonWeb, :stateless_component

  alias Moon.Components.Table

  prop affiliates, :list

  def render(assigns) do
    ~F"""
    <Table>
      <thead>
        <th>Affiliate username</th>
        <th>Affiliate ID</th>
        <th>Email</th>
        <th>Country</th>
      </thead>
      <tbody>
        <tr class={Table.get_row_class(i)} :for.with_index={{affiliate, i} <- @affiliates}>
          <td>{affiliate.user.username}</td>
          <td>{affiliate.id}</td>
          <td>{affiliate.user.email}</td>
          <td>{affiliate.user.country}</td>
        </tr>
      </tbody>
    </Table>
    """
  end
end
