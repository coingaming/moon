defmodule MoonWeb.Pages.ExamplePages.AffiliatesPage.AffiliatesList do
  use MoonWeb, :stateless_component

  alias Moon.Components.Table
  alias Moon.Assets.Logos.LogoBitcasinoShort
  alias Moon.Assets.Logos.LogoSportsbetShort
  alias Moon.Assets.Logos.LogoSlotsShort
  alias Moon.Assets.Logos.LogoAposta10Short
  alias Moon.Autolayouts.LeftToRight

  prop affiliates, :list

  def render(assigns) do
    ~F"""
    <Table>
      <thead>
        <th>Affiliate username</th>
        <th>Affiliate ID</th>
        <th>Email</th>
        <th>Site</th>
        <th>Signup time</th>
        <th>Country</th>
      </thead>
      <tbody>
        <tr class={Table.get_row_class(i)} :for.with_index={{affiliate, i} <- @affiliates}>
          <td>{affiliate.user.username}</td>
          <td>{affiliate.id}</td>
          <td>{affiliate.user.email}</td>
          <td>
            <LeftToRight :if={affiliate.user.site == "Bitcasino"} class="flex items-center">
              <LogoBitcasinoShort font_size="1rem" />
              Bitcasino
            </LeftToRight>

            <LeftToRight :if={affiliate.user.site == "Sportsbet"} class="flex items-center">
              <LogoSportsbetShort font_size="1rem" />
              Sportsbet
            </LeftToRight>

            <LeftToRight :if={affiliate.user.site == "Slots"} class="flex items-center">
              <LogoSlotsShort font_size="1rem" />
              Slots
            </LeftToRight>

            <LeftToRight :if={affiliate.user.site == "Aposta10"} class="flex items-center">
              <LogoAposta10Short font_size="1rem" />
              Aposta10
            </LeftToRight>
          </td>
          <td>{affiliate.signup_at |> Timex.format!("%b %d, %Y", :strftime)}</td>
          <td>{affiliate.user.country}</td>
        </tr>
      </tbody>
    </Table>
    """
  end
end
