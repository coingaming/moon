
defmodule MoonWeb.Pages.Assets.DuotonesPage do
  use MoonWeb, :live_view

  alias Moon.Components.Inline
  alias Moon.Components.CodePreview

  alias Moon.Assets.Duotones
  alias Duotones.CasinoBonus
  alias Duotones.ClaimedReward
  alias Duotones.DynamicRewards
  alias Duotones.EmailNotVerified
  alias Duotones.EmailVerification
  alias Duotones.EventEnded
  alias Duotones.Gift
  alias Duotones.HustleToTop
  alias Duotones.InviteFriends
  alias Duotones.MoneyBack
  alias Duotones.NoBets
  alias Duotones.NoCasinoGames
  alias Duotones.NoData
  alias Duotones.NoEvents
  alias Duotones.NoFavorite
  alias Duotones.NoFreeBet
  alias Duotones.NoInternet
  alias Duotones.NoMarkets
  alias Duotones.NoNotification
  alias Duotones.NoParticipations
  alias Duotones.NoReward
  alias Duotones.NoWithdrawals
  alias Duotones.PriceBoost
  alias Duotones.TiersAndRewards
  alias Duotones.TrackYourProgress
  alias Duotones.Trophy
  alias Duotones.YouPlayWePay

  def mount(%{"theme_name" => theme_name}, _session, socket) do
    {:ok, assign(socket, theme_name: theme_name, active_page: __MODULE__)}
  end

  def render(assigns) do
    ~H"""
    <Inline>
      <CasinoBonus font_size="10rem" color="piccolo-100" />
      <ClaimedReward font_size="10rem" color="piccolo-100" />
      <DynamicRewards font_size="10rem" color="piccolo-100" />
      <EmailNotVerified font_size="10rem" color="piccolo-100" />
      <EmailVerification font_size="10rem" color="piccolo-100" />
      <EventEnded font_size="10rem" color="piccolo-100" />
      <Gift font_size="10rem" color="piccolo-100" />
      <HustleToTop font_size="10rem" color="piccolo-100" />
      <InviteFriends font_size="10rem" color="piccolo-100" />
      <MoneyBack font_size="10rem" color="piccolo-100" />
      <NoBets font_size="10rem" color="piccolo-100" />
      <NoCasinoGames font_size="10rem" color="piccolo-100" />
      <NoData font_size="10rem" color="piccolo-100" />
      <NoEvents font_size="10rem" color="piccolo-100" />
      <NoFavorite font_size="10rem" color="piccolo-100" />
      <NoFreeBet font_size="10rem" color="piccolo-100" />
      <NoInternet font_size="10rem" color="piccolo-100" />
      <NoMarkets font_size="10rem" color="piccolo-100" />
      <NoNotification font_size="10rem" color="piccolo-100" />
      <NoParticipations font_size="10rem" color="piccolo-100" />
      <NoReward font_size="10rem" color="piccolo-100" />
      <NoWithdrawals font_size="10rem" color="piccolo-100" />
      <PriceBoost font_size="10rem" color="piccolo-100" />
      <TiersAndRewards font_size="10rem" color="piccolo-100" />
      <TrackYourProgress font_size="10rem" color="piccolo-100" />
      <Trophy font_size="10rem" color="piccolo-100" />
      <YouPlayWePay font_size="10rem" color="piccolo-100" />
    </Inline>
    <#CodePreview>
      <Inline>
        <CasinoBonus font_size="10rem" color="piccolo-100" />
        <ClaimedReward font_size="10rem" color="piccolo-100" />
        <DynamicRewards font_size="10rem" color="piccolo-100" />
        <EmailNotVerified font_size="10rem" color="piccolo-100" />
        <EmailVerification font_size="10rem" color="piccolo-100" />
        <EventEnded font_size="10rem" color="piccolo-100" />
        <Gift font_size="10rem" color="piccolo-100" />
        <HustleToTop font_size="10rem" color="piccolo-100" />
        <InviteFriends font_size="10rem" color="piccolo-100" />
        <MoneyBack font_size="10rem" color="piccolo-100" />
        <NoBets font_size="10rem" color="piccolo-100" />
        <NoCasinoGames font_size="10rem" color="piccolo-100" />
        <NoData font_size="10rem" color="piccolo-100" />
        <NoEvents font_size="10rem" color="piccolo-100" />
        <NoFavorite font_size="10rem" color="piccolo-100" />
        <NoFreeBet font_size="10rem" color="piccolo-100" />
        <NoInternet font_size="10rem" color="piccolo-100" />
        <NoMarkets font_size="10rem" color="piccolo-100" />
        <NoNotification font_size="10rem" color="piccolo-100" />
        <NoParticipations font_size="10rem" color="piccolo-100" />
        <NoReward font_size="10rem" color="piccolo-100" />
        <NoWithdrawals font_size="10rem" color="piccolo-100" />
        <PriceBoost font_size="10rem" color="piccolo-100" />
        <TiersAndRewards font_size="10rem" color="piccolo-100" />
        <TrackYourProgress font_size="10rem" color="piccolo-100" />
        <Trophy font_size="10rem" color="piccolo-100" />
        <YouPlayWePay font_size="10rem" color="piccolo-100" />
      </Inline>
    </#CodePreview>
    """
  end
end
    