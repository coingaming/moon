defmodule Moon.Assets.Duotones do
  use Moon.StatelessComponent

  alias Moon.Assets.Duotones

  property name, :string
  property color, :string
  property background_color, :string

  def icon_name_to_module(icon_name) do
    %{
      casino_bonus: Duotones.CasinoBonus,
      claimed_reward: Duotones.ClaimedReward,
      dynamic_rewards: Duotones.DynamicRewards,
      email_not_verified: Duotones.EmailNotVerified,
      email_verification: Duotones.EmailVerification,
      event_ended: Duotones.EventEnded,
      gift: Duotones.Gift,
      hustle_to_top: Duotones.HustleToTop,
      invite_friends: Duotones.InviteFriends,
      money_back: Duotones.MoneyBack,
      no_bets: Duotones.NoBets,
      no_casino_games: Duotones.NoCasinoGames,
      no_data: Duotones.NoData,
      no_events: Duotones.NoEvents,
      no_favorite: Duotones.NoFavorite,
      no_free_bet: Duotones.NoFreeBet,
      no_internet: Duotones.NoInternet,
      no_markets: Duotones.NoMarkets,
      no_notification: Duotones.NoNotification,
      no_participations: Duotones.NoParticipations,
      no_reward: Duotones.NoReward,
      no_withdrawals: Duotones.NoWithdrawals,
      price_boost: Duotones.PriceBoost,
      tiers_and_rewards: Duotones.TiersAndRewards,
      track_your_progress: Duotones.TrackYourProgress,
      trophy: Duotones.Trophy,
      you_play_we_pay: Duotones.YouPlayWePay
    }[:"#{icon_name}"]
  end

  def render(assigns) do
    ~H"""
    {{ @name && live_component(@socket, icon_name_to_module(@name), color: @color, background_color: @background_color) }}
    """
  end
end
