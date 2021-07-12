defmodule MoonWeb.Pages.ExamplePages.CustomersPage.CustomersList do
  use MoonWeb, :stateless_component

  alias Moon.Components.Table
  alias Moon.Assets.Logos.LogoBitcasinoShort
  alias Moon.Assets.Logos.LogoSportsbetShort
  alias Moon.Assets.Logos.LogoSlotsShort
  alias Moon.Assets.Logos.LogoAposta10Short
  alias Moon.Autolayouts.LeftToRight

  prop customers, :list

  def render(assigns) do
    ~F"""
    <Table>
      <thead>
        <th>Customer</th>
        <th>Profile ID</th>
        <th>Email</th>
        <th>Country</th>
        <th>Site</th>
        <th>Signup time</th>
      </thead>
      <tbody>
        <tr class={Table.get_row_class(i)} :for.with_index={{customer, i} <- @customers}>
          <td>{customer.username}</td>
          <td>{customer.id}</td>
          <td>{customer.email}</td>
          <td>{customer.country}</td>
          <td>
            <LeftToRight :if={customer.site == "Bitcasino"} class="flex items-center">
              <LogoBitcasinoShort font_size="1rem" />
              Bitcasino
            </LeftToRight>

            <LeftToRight :if={customer.site == "Sportsbet"} class="flex items-center">
              <LogoSportsbetShort font_size="1rem" />
              Sportsbet
            </LeftToRight>

            <LeftToRight :if={customer.site == "Slots"} class="flex items-center">
              <LogoSlotsShort font_size="1rem" />
              Slots
            </LeftToRight>

            <LeftToRight :if={customer.site == "Aposta10"} class="flex items-center">
              <LogoAposta10Short font_size="1rem" />
              Aposta10
            </LeftToRight>
          </td>
          <td>{customer.signup_at |> Timex.format!("%b %d, %Y", :strftime)}</td>
        </tr>
      </tbody>
    </Table>
    """
  end
end
