defmodule MoonWeb.Pages.Assets.DuotonesPage do
  use MoonWeb, :live_view

  alias MoonWeb.Components.Breadcrumbs
  alias Moon.Autolayouts.TopToDown
  alias MoonWeb.Components.ExampleAndCode
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

  def mount(params, _session, socket) do
    {:ok,
     assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def render(assigns) do
    ~F"""
    <TopToDown>
      <Breadcrumbs breadcrumbs={@breadcrumbs} class="mb-2" />
      <ExampleAndCode id="duotone_1" class="mt-4">
        <:example>
          <CasinoBonus font_size="10rem" color="piccolo-100" />
        </:example>

        <:code>
          <#CodePreview>
            <CasinoBonus font_size="10rem" color="piccolo-100" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <Breadcrumbs breadcrumbs={@breadcrumbs} class="mb-2" />
      <ExampleAndCode id="duotone_2" class="mt-4">
        <:example>
          <ClaimedReward font_size="10rem" color="piccolo-100" />
        </:example>

        <:code>
          <#CodePreview>
            <ClaimedReward font_size="10rem" color="piccolo-100" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <Breadcrumbs breadcrumbs={@breadcrumbs} class="mb-2" />
      <ExampleAndCode id="duotone_3" class="mt-4">
        <:example>
          <DynamicRewards font_size="10rem" color="piccolo-100" />
        </:example>

        <:code>
          <#CodePreview>
            <DynamicRewards font_size="10rem" color="piccolo-100" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <Breadcrumbs breadcrumbs={@breadcrumbs} class="mb-2" />
      <ExampleAndCode id="duotone_4" class="mt-4">
        <:example>
          <EmailNotVerified font_size="10rem" color="piccolo-100" />
        </:example>

        <:code>
          <#CodePreview>
            <EmailNotVerified font_size="10rem" color="piccolo-100" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <Breadcrumbs breadcrumbs={@breadcrumbs} class="mb-2" />
      <ExampleAndCode id="duotone_5" class="mt-4">
        <:example>
          <EmailVerification font_size="10rem" color="piccolo-100" />
        </:example>

        <:code>
          <#CodePreview>
            <EmailVerification font_size="10rem" color="piccolo-100" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <Breadcrumbs breadcrumbs={@breadcrumbs} class="mb-2" />
      <ExampleAndCode id="duotone_6" class="mt-4">
        <:example>
          <EventEnded font_size="10rem" color="piccolo-100" />
        </:example>

        <:code>
          <#CodePreview>
            <EventEnded font_size="10rem" color="piccolo-100" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <Breadcrumbs breadcrumbs={@breadcrumbs} class="mb-2" />
      <ExampleAndCode id="duotone_7" class="mt-4">
        <:example>
          <Gift font_size="10rem" color="piccolo-100" />
        </:example>

        <:code>
          <#CodePreview>
            <Gift font_size="10rem" color="piccolo-100" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <Breadcrumbs breadcrumbs={@breadcrumbs} class="mb-2" />
      <ExampleAndCode id="duotone_8" class="mt-4">
        <:example>
          <HustleToTop font_size="10rem" color="piccolo-100" />
        </:example>

        <:code>
          <#CodePreview>
            <HustleToTop font_size="10rem" color="piccolo-100" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <Breadcrumbs breadcrumbs={@breadcrumbs} class="mb-2" />
      <ExampleAndCode id="duotone_9" class="mt-4">
        <:example>
          <InviteFriends font_size="10rem" color="piccolo-100" />
        </:example>

        <:code>
          <#CodePreview>
            <InviteFriends font_size="10rem" color="piccolo-100" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <Breadcrumbs breadcrumbs={@breadcrumbs} class="mb-2" />
      <ExampleAndCode id="duotone_10" class="mt-4">
        <:example>
          <MoneyBack font_size="10rem" color="piccolo-100" />
        </:example>

        <:code>
          <#CodePreview>
            <MoneyBack font_size="10rem" color="piccolo-100" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <Breadcrumbs breadcrumbs={@breadcrumbs} class="mb-2" />
      <ExampleAndCode id="duotone_11" class="mt-4">
        <:example>
          <NoBets font_size="10rem" color="piccolo-100" />
        </:example>

        <:code>
          <#CodePreview>
            <NoBets font_size="10rem" color="piccolo-100" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <Breadcrumbs breadcrumbs={@breadcrumbs} class="mb-2" />
      <ExampleAndCode id="duotone_12" class="mt-4">
        <:example>
          <NoCasinoGames font_size="10rem" color="piccolo-100" />
        </:example>

        <:code>
          <#CodePreview>
            <NoCasinoGames font_size="10rem" color="piccolo-100" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <Breadcrumbs breadcrumbs={@breadcrumbs} class="mb-2" />
      <ExampleAndCode id="duotone_13" class="mt-4">
        <:example>
          <NoData font_size="10rem" color="piccolo-100" />
        </:example>

        <:code>
          <#CodePreview>
            <NoData font_size="10rem" color="piccolo-100" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <Breadcrumbs breadcrumbs={@breadcrumbs} class="mb-2" />
      <ExampleAndCode id="duotone_14" class="mt-4">
        <:example>
          <NoEvents font_size="10rem" color="piccolo-100" />
        </:example>

        <:code>
          <#CodePreview>
            <NoEvents font_size="10rem" color="piccolo-100" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <Breadcrumbs breadcrumbs={@breadcrumbs} class="mb-2" />
      <ExampleAndCode id="duotone_15" class="mt-4">
        <:example>
          <NoFavorite font_size="10rem" color="piccolo-100" />
        </:example>

        <:code>
          <#CodePreview>
            <NoFavorite font_size="10rem" color="piccolo-100" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <Breadcrumbs breadcrumbs={@breadcrumbs} class="mb-2" />
      <ExampleAndCode id="duotone_16" class="mt-4">
        <:example>
          <NoFreeBet font_size="10rem" color="piccolo-100" />
        </:example>

        <:code>
          <#CodePreview>
            <NoFreeBet font_size="10rem" color="piccolo-100" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <Breadcrumbs breadcrumbs={@breadcrumbs} class="mb-2" />
      <ExampleAndCode id="duotone_17" class="mt-4">
        <:example>
          <NoInternet font_size="10rem" color="piccolo-100" />
        </:example>

        <:code>
          <#CodePreview>
            <NoInternet font_size="10rem" color="piccolo-100" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <Breadcrumbs breadcrumbs={@breadcrumbs} class="mb-2" />
      <ExampleAndCode id="duotone_18" class="mt-4">
        <:example>
          <NoMarkets font_size="10rem" color="piccolo-100" />
        </:example>

        <:code>
          <#CodePreview>
            <NoMarkets font_size="10rem" color="piccolo-100" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <Breadcrumbs breadcrumbs={@breadcrumbs} class="mb-2" />
      <ExampleAndCode id="duotone_19" class="mt-4">
        <:example>
          <NoNotification font_size="10rem" color="piccolo-100" />
        </:example>

        <:code>
          <#CodePreview>
            <NoNotification font_size="10rem" color="piccolo-100" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <Breadcrumbs breadcrumbs={@breadcrumbs} class="mb-2" />
      <ExampleAndCode id="duotone_20" class="mt-4">
        <:example>
          <NoParticipations font_size="10rem" color="piccolo-100" />
        </:example>

        <:code>
          <#CodePreview>
            <NoParticipations font_size="10rem" color="piccolo-100" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <Breadcrumbs breadcrumbs={@breadcrumbs} class="mb-2" />
      <ExampleAndCode id="duotone_21" class="mt-4">
        <:example>
          <NoReward font_size="10rem" color="piccolo-100" />
        </:example>

        <:code>
          <#CodePreview>
            <NoReward font_size="10rem" color="piccolo-100" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <Breadcrumbs breadcrumbs={@breadcrumbs} class="mb-2" />
      <ExampleAndCode id="duotone_22" class="mt-4">
        <:example>
          <NoWithdrawals font_size="10rem" color="piccolo-100" />
        </:example>

        <:code>
          <#CodePreview>
            <NoWithdrawals font_size="10rem" color="piccolo-100" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <Breadcrumbs breadcrumbs={@breadcrumbs} class="mb-2" />
      <ExampleAndCode id="duotone_23" class="mt-4">
        <:example>
          <PriceBoost font_size="10rem" color="piccolo-100" />
        </:example>

        <:code>
          <#CodePreview>
            <PriceBoost font_size="10rem" color="piccolo-100" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <Breadcrumbs breadcrumbs={@breadcrumbs} class="mb-2" />
      <ExampleAndCode id="duotone_24" class="mt-4">
        <:example>
          <TiersAndRewards font_size="10rem" color="piccolo-100" />
        </:example>

        <:code>
          <#CodePreview>
            <TiersAndRewards font_size="10rem" color="piccolo-100" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <Breadcrumbs breadcrumbs={@breadcrumbs} class="mb-2" />
      <ExampleAndCode id="duotone_25" class="mt-4">
        <:example>
          <TrackYourProgress font_size="10rem" color="piccolo-100" />
        </:example>

        <:code>
          <#CodePreview>
            <TrackYourProgress font_size="10rem" color="piccolo-100" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <Breadcrumbs breadcrumbs={@breadcrumbs} class="mb-2" />
      <ExampleAndCode id="duotone_26" class="mt-4">
        <:example>
          <Trophy font_size="10rem" color="piccolo-100" />
        </:example>

        <:code>
          <#CodePreview>
            <Trophy font_size="10rem" color="piccolo-100" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <Breadcrumbs breadcrumbs={@breadcrumbs} class="mb-2" />
      <ExampleAndCode id="duotone_27" class="mt-4">
        <:example>
          <YouPlayWePay font_size="10rem" color="piccolo-100" />
        </:example>

        <:code>
          <#CodePreview>
            <YouPlayWePay font_size="10rem" color="piccolo-100" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>
    </TopToDown>
    """
  end
end
