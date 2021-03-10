defmodule MoonWeb.Pages.Assets.DuotonesPage do
  use MoonWeb, :live_view

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
    ~H"""

    <ExampleAndCode class="mt-4">
      <template slot="example">
        <CasinoBonus font_size="10rem" color="piccolo-100" />
      </template>

      <template slot="code">
        <#CodePreview>
        <CasinoBonus font_size="10rem" color="piccolo-100" />
        </#CodePreview>
      </template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <template slot="example">
        <ClaimedReward font_size="10rem" color="piccolo-100" />
      </template>

      <template slot="code">
        <#CodePreview>
        <ClaimedReward font_size="10rem" color="piccolo-100" />
        </#CodePreview>
      </template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <template slot="example">
        <DynamicRewards font_size="10rem" color="piccolo-100" />
      </template>

      <template slot="code">
        <#CodePreview>
        <DynamicRewards font_size="10rem" color="piccolo-100" />
        </#CodePreview>
      </template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <template slot="example">
        <EmailNotVerified font_size="10rem" color="piccolo-100" />
      </template>

      <template slot="code">
        <#CodePreview>
        <EmailNotVerified font_size="10rem" color="piccolo-100" />
        </#CodePreview>
      </template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <template slot="example">
        <EmailVerification font_size="10rem" color="piccolo-100" />
      </template>

      <template slot="code">
        <#CodePreview>
        <EmailVerification font_size="10rem" color="piccolo-100" />
        </#CodePreview>
      </template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <template slot="example">
        <EventEnded font_size="10rem" color="piccolo-100" />
      </template>

      <template slot="code">
        <#CodePreview>
        <EventEnded font_size="10rem" color="piccolo-100" />
        </#CodePreview>
      </template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <template slot="example">
        <Gift font_size="10rem" color="piccolo-100" />
      </template>

      <template slot="code">
        <#CodePreview>
        <Gift font_size="10rem" color="piccolo-100" />
        </#CodePreview>
      </template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <template slot="example">
        <HustleToTop font_size="10rem" color="piccolo-100" />
      </template>

      <template slot="code">
        <#CodePreview>
        <HustleToTop font_size="10rem" color="piccolo-100" />
        </#CodePreview>
      </template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <template slot="example">
        <InviteFriends font_size="10rem" color="piccolo-100" />
      </template>

      <template slot="code">
        <#CodePreview>
        <InviteFriends font_size="10rem" color="piccolo-100" />
        </#CodePreview>
      </template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <template slot="example">
        <MoneyBack font_size="10rem" color="piccolo-100" />
      </template>

      <template slot="code">
        <#CodePreview>
        <MoneyBack font_size="10rem" color="piccolo-100" />
        </#CodePreview>
      </template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <template slot="example">
        <NoBets font_size="10rem" color="piccolo-100" />
      </template>

      <template slot="code">
        <#CodePreview>
        <NoBets font_size="10rem" color="piccolo-100" />
        </#CodePreview>
      </template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <template slot="example">
        <NoCasinoGames font_size="10rem" color="piccolo-100" />
      </template>

      <template slot="code">
        <#CodePreview>
        <NoCasinoGames font_size="10rem" color="piccolo-100" />
        </#CodePreview>
      </template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <template slot="example">
        <NoData font_size="10rem" color="piccolo-100" />
      </template>

      <template slot="code">
        <#CodePreview>
        <NoData font_size="10rem" color="piccolo-100" />
        </#CodePreview>
      </template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <template slot="example">
        <NoEvents font_size="10rem" color="piccolo-100" />
      </template>

      <template slot="code">
        <#CodePreview>
        <NoEvents font_size="10rem" color="piccolo-100" />
        </#CodePreview>
      </template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <template slot="example">
        <NoFavorite font_size="10rem" color="piccolo-100" />
      </template>

      <template slot="code">
        <#CodePreview>
        <NoFavorite font_size="10rem" color="piccolo-100" />
        </#CodePreview>
      </template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <template slot="example">
        <NoFreeBet font_size="10rem" color="piccolo-100" />
      </template>

      <template slot="code">
        <#CodePreview>
        <NoFreeBet font_size="10rem" color="piccolo-100" />
        </#CodePreview>
      </template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <template slot="example">
        <NoInternet font_size="10rem" color="piccolo-100" />
      </template>

      <template slot="code">
        <#CodePreview>
        <NoInternet font_size="10rem" color="piccolo-100" />
        </#CodePreview>
      </template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <template slot="example">
        <NoMarkets font_size="10rem" color="piccolo-100" />
      </template>

      <template slot="code">
        <#CodePreview>
        <NoMarkets font_size="10rem" color="piccolo-100" />
        </#CodePreview>
      </template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <template slot="example">
        <NoNotification font_size="10rem" color="piccolo-100" />
      </template>

      <template slot="code">
        <#CodePreview>
        <NoNotification font_size="10rem" color="piccolo-100" />
        </#CodePreview>
      </template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <template slot="example">
        <NoParticipations font_size="10rem" color="piccolo-100" />
      </template>

      <template slot="code">
        <#CodePreview>
        <NoParticipations font_size="10rem" color="piccolo-100" />
        </#CodePreview>
      </template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <template slot="example">
        <NoReward font_size="10rem" color="piccolo-100" />
      </template>

      <template slot="code">
        <#CodePreview>
        <NoReward font_size="10rem" color="piccolo-100" />
        </#CodePreview>
      </template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <template slot="example">
        <NoWithdrawals font_size="10rem" color="piccolo-100" />
      </template>

      <template slot="code">
        <#CodePreview>
        <NoWithdrawals font_size="10rem" color="piccolo-100" />
        </#CodePreview>
      </template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <template slot="example">
        <PriceBoost font_size="10rem" color="piccolo-100" />
      </template>

      <template slot="code">
        <#CodePreview>
        <PriceBoost font_size="10rem" color="piccolo-100" />
        </#CodePreview>
      </template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <template slot="example">
        <TiersAndRewards font_size="10rem" color="piccolo-100" />
      </template>

      <template slot="code">
        <#CodePreview>
        <TiersAndRewards font_size="10rem" color="piccolo-100" />
        </#CodePreview>
      </template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <template slot="example">
        <TrackYourProgress font_size="10rem" color="piccolo-100" />
      </template>

      <template slot="code">
        <#CodePreview>
        <TrackYourProgress font_size="10rem" color="piccolo-100" />
        </#CodePreview>
      </template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <template slot="example">
        <Trophy font_size="10rem" color="piccolo-100" />
      </template>

      <template slot="code">
        <#CodePreview>
        <Trophy font_size="10rem" color="piccolo-100" />
        </#CodePreview>
      </template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <template slot="example">
        <YouPlayWePay font_size="10rem" color="piccolo-100" />
      </template>

      <template slot="code">
        <#CodePreview>
        <YouPlayWePay font_size="10rem" color="piccolo-100" />
        </#CodePreview>
      </template>
    </ExampleAndCode>

    """
  end
end
