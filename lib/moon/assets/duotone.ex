defmodule Moon.Assets.Duotone do
  @moduledoc false

  use Moon.StatelessComponent
  import Moon.Helpers.Assets, only: [asset_name_to_filename: 1]

  prop name, :string
  prop color, :string, values: Moon.colors()
  prop height, :string
  prop width, :string
  prop font_size, :string
  prop vertical_align, :string
  prop click, :event
  prop class, :string

  # @assets_map %{
  #   casino_bonus: Duotones.CasinoBonus,
  #   claimed_reward: Duotones.ClaimedReward,
  #   dynamic_rewards: Duotones.DynamicRewards,
  #   email_not_verified: Duotones.EmailNotVerified,
  #   email_verification: Duotones.EmailVerification,
  #   event_ended: Duotones.EventEnded,
  #   gift: Duotones.Gift,
  #   hustle_to_top: Duotones.HustleToTop,
  #   invite_friends: Duotones.InviteFriends,
  #   money_back: Duotones.MoneyBack,
  #   no_bets: Duotones.NoBets,
  #   no_casino_games: Duotones.NoCasinoGames,
  #   no_data: Duotones.NoData,
  #   no_events: Duotones.NoEvents,
  #   no_favorite: Duotones.NoFavorite,
  #   no_free_bet: Duotones.NoFreeBet,
  #   no_internet: Duotones.NoInternet,
  #   no_markets: Duotones.NoMarkets,
  #   no_notification: Duotones.NoNotification,
  #   no_participations: Duotones.NoParticipations,
  #   no_reward: Duotones.NoReward,
  #   no_withdrawals: Duotones.NoWithdrawals,
  #   price_boost: Duotones.PriceBoost,
  #   tiers_and_rewards: Duotones.TiersAndRewards,
  #   track_your_progress: Duotones.TrackYourProgress,
  #   trophy: Duotones.Trophy,
  #   you_play_we_pay: Duotones.YouPlayWePay
  # }

  def render(assigns) do
    ~F"""
    <svg
      class={"moon-duotone #{@class} #{@click && "cursor-pointer"}"}
      :on-click={@click}
      style={get_style(
        color: @color,
        height: @height,
        width: @width,
        font_size: @font_size,
        vertical_align: @vertical_align
      )}
    >
      <use href={"/moon/assets/svgs/duotones/#{asset_name_to_filename(@name)}.svg#item"} />
    </svg>
    """
  end
end
