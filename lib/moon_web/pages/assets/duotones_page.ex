defmodule MoonWeb.Pages.Assets.DuotonesPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Assets.Duotone
  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.CodePreview
  alias Moon.Components.Heading
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Assets"
      },
      %{
        to: "/assets/duotones",
        name: "Duotones"
      }
    ]
  )

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <TopToDown>
        <Heading size={56} class="mb-4">Duotones</Heading>

        <ExampleAndCode id="duotone_1" class="mt-4">
          <:example>
            <Duotone name="casino_bonus" class="text-[10rem]" color="piccolo" />
          </:example>

          <:code>
            <#CodePreview>
              <Duotone name="casino_bonus" class="text-[10rem]" color="piccolo" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="duotone_2" class="mt-4">
          <:example>
            <Duotone name="claimed_reward" class="text-[10rem]" color="piccolo" />
          </:example>

          <:code>
            <#CodePreview>
              <Duotone name="claimed_reward" class="text-[10rem]" color="piccolo" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="duotone_3" class="mt-4">
          <:example>
            <Duotone name="dynamic_rewards" class="text-[10rem]" color="piccolo" />
          </:example>

          <:code>
            <#CodePreview>
              <Duotone name="dynamic_rewards" class="text-[10rem]" color="piccolo" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="duotone_4" class="mt-4">
          <:example>
            <Duotone name="email_not_verified" class="text-[10rem]" color="piccolo" />
          </:example>

          <:code>
            <#CodePreview>
              <Duotone name="email_not_verified" class="text-[10rem]" color="piccolo" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="duotone_5" class="mt-4">
          <:example>
            <Duotone name="email_verification" class="text-[10rem]" color="piccolo" />
          </:example>

          <:code>
            <#CodePreview>
              <Duotone name="email_verification" class="text-[10rem]" color="piccolo" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="duotone_6" class="mt-4">
          <:example>
            <Duotone name="event_ended" class="text-[10rem]" color="piccolo" />
          </:example>

          <:code>
            <#CodePreview>
              <Duotone name="event_ended" class="text-[10rem]" color="piccolo" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="duotone_7" class="mt-4">
          <:example>
            <Duotone name="gift" class="text-[10rem]" color="piccolo" />
          </:example>

          <:code>
            <#CodePreview>
              <Duotone name="gift" class="text-[10rem]" color="piccolo" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="duotone_8" class="mt-4">
          <:example>
            <Duotone name="hustle_to_top" class="text-[10rem]" color="piccolo" />
          </:example>

          <:code>
            <#CodePreview>
              <Duotone name="hustle_to_top" class="text-[10rem]" color="piccolo" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="duotone_9" class="mt-4">
          <:example>
            <Duotone name="invite_friends" class="text-[10rem]" color="piccolo" />
          </:example>

          <:code>
            <#CodePreview>
              <Duotone name="invite_friends" class="text-[10rem]" color="piccolo" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="duotone_10" class="mt-4">
          <:example>
            <Duotone name="money_back" class="text-[10rem]" color="piccolo" />
          </:example>

          <:code>
            <#CodePreview>
              <Duotone name="money_back" class="text-[10rem]" color="piccolo" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="duotone_11" class="mt-4">
          <:example>
            <Duotone name="no_bets" class="text-[10rem]" color="piccolo" />
          </:example>

          <:code>
            <#CodePreview>
              <Duotone name="no_bets" class="text-[10rem]" color="piccolo" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="duotone_12" class="mt-4">
          <:example>
            <Duotone name="no_casino_games" class="text-[10rem]" color="piccolo" />
          </:example>

          <:code>
            <#CodePreview>
              <Duotone name="no_casino_games" class="text-[10rem]" color="piccolo" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="duotone_13" class="mt-4">
          <:example>
            <Duotone name="no_data" class="text-[10rem]" color="piccolo" />
          </:example>

          <:code>
            <#CodePreview>
              <Duotone name="no_data" class="text-[10rem]" color="piccolo" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="duotone_14" class="mt-4">
          <:example>
            <Duotone name="no_events" class="text-[10rem]" color="piccolo" />
          </:example>

          <:code>
            <#CodePreview>
              <Duotone name="no_events" class="text-[10rem]" color="piccolo" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="duotone_15" class="mt-4">
          <:example>
            <Duotone name="no_favorite" class="text-[10rem]" color="piccolo" />
          </:example>

          <:code>
            <#CodePreview>
              <Duotone name="no_favorite" class="text-[10rem]" color="piccolo" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="duotone_16" class="mt-4">
          <:example>
            <Duotone name="no_free_bet" class="text-[10rem]" color="piccolo" />
          </:example>

          <:code>
            <#CodePreview>
              <Duotone name="no_free_bet" class="text-[10rem]" color="piccolo" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="duotone_17" class="mt-4">
          <:example>
            <Duotone name="no_internet" class="text-[10rem]" color="piccolo" />
          </:example>

          <:code>
            <#CodePreview>
              <Duotone name="no_internet" class="text-[10rem]" color="piccolo" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="duotone_18" class="mt-4">
          <:example>
            <Duotone name="no_markets" class="text-[10rem]" color="piccolo" />
          </:example>

          <:code>
            <#CodePreview>
              <Duotone name="no_markets" class="text-[10rem]" color="piccolo" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="duotone_19" class="mt-4">
          <:example>
            <Duotone name="no_notification" class="text-[10rem]" color="piccolo" />
          </:example>

          <:code>
            <#CodePreview>
              <Duotone name="no_notification" class="text-[10rem]" color="piccolo" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="duotone_20" class="mt-4">
          <:example>
            <Duotone name="no_participations" class="text-[10rem]" color="piccolo" />
          </:example>

          <:code>
            <#CodePreview>
              <Duotone name="no_participations" class="text-[10rem]" color="piccolo" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="duotone_21" class="mt-4">
          <:example>
            <Duotone name="no_reward" class="text-[10rem]" color="piccolo" />
          </:example>

          <:code>
            <#CodePreview>
              <Duotone name="no_reward" class="text-[10rem]" color="piccolo" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="duotone_22" class="mt-4">
          <:example>
            <Duotone name="no_withdrawals" class="text-[10rem]" color="piccolo" />
          </:example>

          <:code>
            <#CodePreview>
              <Duotone name="no_withdrawals" class="text-[10rem]" color="piccolo" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="duotone_23" class="mt-4">
          <:example>
            <Duotone name="price_boost" class="text-[10rem]" color="piccolo" />
          </:example>

          <:code>
            <#CodePreview>
              <Duotone name="price_boost" class="text-[10rem]" color="piccolo" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="duotone_24" class="mt-4">
          <:example>
            <Duotone name="tiers_and_rewards" class="text-[10rem]" color="piccolo" />
          </:example>

          <:code>
            <#CodePreview>
              <Duotone name="tiers_and_rewards" class="text-[10rem]" color="piccolo" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="duotone_25" class="mt-4">
          <:example>
            <Duotone name="track_your_progress" class="text-[10rem]" color="piccolo" />
          </:example>

          <:code>
            <#CodePreview>
              <Duotone name="track_your_progress" class="text-[10rem]" color="piccolo" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="duotone_26" class="mt-4">
          <:example>
            <Duotone name="trophy" class="text-[10rem]" color="piccolo" />
          </:example>

          <:code>
            <#CodePreview>
              <Duotone name="trophy" class="text-[10rem]" color="piccolo" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="duotone_27" class="mt-4">
          <:example>
            <Duotone name="you_play_we_pay" class="text-[10rem]" color="piccolo" />
          </:example>

          <:code>
            <#CodePreview>
              <Duotone name="you_play_we_pay" class="text-[10rem]" color="piccolo" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>
      </TopToDown>
    </Page>
    """
  end
end
