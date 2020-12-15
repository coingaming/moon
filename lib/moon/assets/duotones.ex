defmodule Moon.Assets.Duotone do
  use Moon.StatelessComponent
  alias Moon.Assets.Duotone

  prop(name, :string)

  prop(color, :string, values: Moon.colors())
  prop(height, :string)
  prop(width, :string)
  prop(font_size, :string)
  prop(vertical_align, :string)

  @assets_map %{
    casino_bonus: Duotone.CasinoBonus,
    claimed_reward: Duotone.ClaimedReward,
    dynamic_rewards: Duotone.DynamicRewards,
    email_not_verified: Duotone.EmailNotVerified,
    email_verification: Duotone.EmailVerification,
    event_ended: Duotone.EventEnded,
    gift: Duotone.Gift,
    hustle_to_top: Duotone.HustleToTop,
    invite_friends: Duotone.InviteFriends,
    money_back: Duotone.MoneyBack,
    no_bets: Duotone.NoBets,
    no_casino_games: Duotone.NoCasinoGames,
    no_data: Duotone.NoData,
    no_events: Duotone.NoEvents,
    no_favorite: Duotone.NoFavorite,
    no_free_bet: Duotone.NoFreeBet,
    no_internet: Duotone.NoInternet,
    no_markets: Duotone.NoMarkets,
    no_notification: Duotone.NoNotification,
    no_participations: Duotone.NoParticipations,
    no_reward: Duotone.NoReward,
    no_withdrawals: Duotone.NoWithdrawals,
    price_boost: Duotone.PriceBoost,
    tiers_and_rewards: Duotone.TiersAndRewards,
    track_your_progress: Duotone.TrackYourProgress,
    trophy: Duotone.Trophy,
    you_play_we_pay: Duotone.YouPlayWePay
  }
  def icon_name_to_module(icon_name) do
    @assets_map[:"#{icon_name}"]
  end

  def render(assigns) do
    ~H"""
    {{ @name && icon_name_to_module(@name) && live_component(@socket, icon_name_to_module(@name), color: @color, height: @height, width: @width, font_size: @font_size, vertical_align: @vertical_align) }}
    """
  end
end
