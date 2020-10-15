defmodule Moon.Sites.MoonDocs.Pages.Assets.DuotonesPage do
  use Moon.LiveView
  use Moon.Components.Context

  alias Moon.Sites.MoonDocs.Layouts.DefaultLayout
  alias Moon.Themed
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

  def render(assigns) do
    ~H"""
    <Themed theme={{ Moon.Themes.SportsbetLight.get_config }}>
      <DefaultLayout id="moondocs" user_token={{ "user_token" }}>
        <Inline>
          
          <CasinoBonus color="piccolo_100" height="1rem" width="1rem" />
            <ClaimedReward color="piccolo_100" height="1rem" width="1rem" />
            <DynamicRewards color="piccolo_100" height="1rem" width="1rem" />
            <EmailNotVerified color="piccolo_100" height="1rem" width="1rem" />
            <EmailVerification color="piccolo_100" height="1rem" width="1rem" />
            <EventEnded color="piccolo_100" height="1rem" width="1rem" />
            <Gift color="piccolo_100" height="1rem" width="1rem" />
            <HustleToTop color="piccolo_100" height="1rem" width="1rem" />
            <InviteFriends color="piccolo_100" height="1rem" width="1rem" />
            <MoneyBack color="piccolo_100" height="1rem" width="1rem" />
            <NoBets color="piccolo_100" height="1rem" width="1rem" />
            <NoCasinoGames color="piccolo_100" height="1rem" width="1rem" />
            <NoData color="piccolo_100" height="1rem" width="1rem" />
            <NoEvents color="piccolo_100" height="1rem" width="1rem" />
            <NoFavorite color="piccolo_100" height="1rem" width="1rem" />
            <NoFreeBet color="piccolo_100" height="1rem" width="1rem" />
            <NoInternet color="piccolo_100" height="1rem" width="1rem" />
            <NoMarkets color="piccolo_100" height="1rem" width="1rem" />
            <NoNotification color="piccolo_100" height="1rem" width="1rem" />
            <NoParticipations color="piccolo_100" height="1rem" width="1rem" />
            <NoReward color="piccolo_100" height="1rem" width="1rem" />
            <NoWithdrawals color="piccolo_100" height="1rem" width="1rem" />
            <PriceBoost color="piccolo_100" height="1rem" width="1rem" />
            <TiersAndRewards color="piccolo_100" height="1rem" width="1rem" />
            <TrackYourProgress color="piccolo_100" height="1rem" width="1rem" />
            <Trophy color="piccolo_100" height="1rem" width="1rem" />
            <YouPlayWePay color="piccolo_100" height="1rem" width="1rem" />
        </Inline>
        <#CodePreview>
          <Inline>
            
            <CasinoBonus color="piccolo_100" height="1rem" width="1rem" />
            <ClaimedReward color="piccolo_100" height="1rem" width="1rem" />
            <DynamicRewards color="piccolo_100" height="1rem" width="1rem" />
            <EmailNotVerified color="piccolo_100" height="1rem" width="1rem" />
            <EmailVerification color="piccolo_100" height="1rem" width="1rem" />
            <EventEnded color="piccolo_100" height="1rem" width="1rem" />
            <Gift color="piccolo_100" height="1rem" width="1rem" />
            <HustleToTop color="piccolo_100" height="1rem" width="1rem" />
            <InviteFriends color="piccolo_100" height="1rem" width="1rem" />
            <MoneyBack color="piccolo_100" height="1rem" width="1rem" />
            <NoBets color="piccolo_100" height="1rem" width="1rem" />
            <NoCasinoGames color="piccolo_100" height="1rem" width="1rem" />
            <NoData color="piccolo_100" height="1rem" width="1rem" />
            <NoEvents color="piccolo_100" height="1rem" width="1rem" />
            <NoFavorite color="piccolo_100" height="1rem" width="1rem" />
            <NoFreeBet color="piccolo_100" height="1rem" width="1rem" />
            <NoInternet color="piccolo_100" height="1rem" width="1rem" />
            <NoMarkets color="piccolo_100" height="1rem" width="1rem" />
            <NoNotification color="piccolo_100" height="1rem" width="1rem" />
            <NoParticipations color="piccolo_100" height="1rem" width="1rem" />
            <NoReward color="piccolo_100" height="1rem" width="1rem" />
            <NoWithdrawals color="piccolo_100" height="1rem" width="1rem" />
            <PriceBoost color="piccolo_100" height="1rem" width="1rem" />
            <TiersAndRewards color="piccolo_100" height="1rem" width="1rem" />
            <TrackYourProgress color="piccolo_100" height="1rem" width="1rem" />
            <Trophy color="piccolo_100" height="1rem" width="1rem" />
            <YouPlayWePay color="piccolo_100" height="1rem" width="1rem" />
          </Inline>
        </#CodePreview>
      </DefaultLayout>
    </Themed>
    """
  end
end
