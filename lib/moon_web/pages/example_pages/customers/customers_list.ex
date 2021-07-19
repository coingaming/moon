defmodule MoonWeb.Pages.ExamplePages.CustomersPage.CustomersList do
  use MoonWeb, :stateful_component

  alias Moon.Components.Table
  alias Moon.Assets.Logos.LogoBitcasinoShort
  alias Moon.Assets.Logos.LogoSportsbetShort
  alias Moon.Assets.Logos.LogoSlotsShort
  alias Moon.Assets.Logos.LogoAposta10Short
  alias Moon.Autolayouts.LeftToRight

  prop customers, :list
  prop active_customer_id, :integer

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
        <tr
          :for.with_index={{customer, i} <- @customers}
          :on-click={"select_customer:#{customer.id}"}
          class={"cursor-pointer rounded #{Table.get_row_class(i)} #{
            if @active_customer_id != customer.id do
              "hover:bg-beerus-100"
            else
              "border border-hit-120 bg-beerus-100 border-collapse"
            end
          }"}
        >
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

  def handle_event(event, _, socket) do
    case String.split(event, ":") do
      ["select_customer", customer_id_str] ->
        {customer_id, _} = customer_id_str |> Integer.parse()
        customer = socket.assigns.customers |> Enum.find(nil, &(&1.id == customer_id))

        if customer != nil, do: send(self(), {:select_customer, customer})
        {:noreply, socket}

      _ ->
        {:noreply, socket}
    end
  end
end
