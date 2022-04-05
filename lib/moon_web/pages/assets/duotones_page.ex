defmodule MoonWeb.Pages.Assets.DuotonesPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Assets.Duotone
  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.CodePreview
  alias Moon.Components.Heading
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page

  data breadcrumbs, :any,
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

  def mount(params, _session, socket) do
    {:ok,
     assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page theme_name={@theme_name} active_page={@active_page} breadcrumbs={@breadcrumbs}>
      <TopToDown>
        <Heading size={56} class="mb-4">Duotones</Heading>

        <ExampleAndCode id="duotone_1" class="mt-4">
          <:example>
            <Duotone name="casino-bonus" font_size="10rem" color="piccolo-100" />
          </:example>

          <:code>
            <#CodePreview>
              <Duotone name="casino-bonus" font_size="10rem" color="piccolo-100" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="duotone_2" class="mt-4">
          <:example>
            <Duotone name="claimed-reward" font_size="10rem" color="piccolo-100" />
          </:example>

          <:code>
            <#CodePreview>
              <Duotone name="claimed-reward" font_size="10rem" color="piccolo-100" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="duotone_3" class="mt-4">
          <:example>
            <Duotone name="dynamic-rewards" font_size="10rem" color="piccolo-100" />
          </:example>

          <:code>
            <#CodePreview>
              <Duotone name="dynamic-rewards" font_size="10rem" color="piccolo-100" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="duotone_4" class="mt-4">
          <:example>
            <Duotone name="email-not-verified" font_size="10rem" color="piccolo-100" />
          </:example>

          <:code>
            <#CodePreview>
              <Duotone name="email-not-verified" font_size="10rem" color="piccolo-100" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="duotone_5" class="mt-4">
          <:example>
            <Duotone name="email-verification" font_size="10rem" color="piccolo-100" />
          </:example>

          <:code>
            <#CodePreview>
              <Duotone name="email-verification" font_size="10rem" color="piccolo-100" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="duotone_6" class="mt-4">
          <:example>
            <Duotone name="event-ended" font_size="10rem" color="piccolo-100" />
          </:example>

          <:code>
            <#CodePreview>
              <Duotone name="event-ended" font_size="10rem" color="piccolo-100" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="duotone_7" class="mt-4">
          <:example>
            <Duotone name="gift" font_size="10rem" color="piccolo-100" />
          </:example>

          <:code>
            <#CodePreview>
              <Duotone name="gift" font_size="10rem" color="piccolo-100" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="duotone_8" class="mt-4">
          <:example>
            <Duotone name="hustle-to-top" font_size="10rem" color="piccolo-100" />
          </:example>

          <:code>
            <#CodePreview>
              <Duotone name="hustle-to-top" font_size="10rem" color="piccolo-100" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="duotone_9" class="mt-4">
          <:example>
            <Duotone name="invite-friends" font_size="10rem" color="piccolo-100" />
          </:example>

          <:code>
            <#CodePreview>
              <Duotone name="invite-friends" font_size="10rem" color="piccolo-100" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="duotone_10" class="mt-4">
          <:example>
            <Duotone name="money-back" font_size="10rem" color="piccolo-100" />
          </:example>

          <:code>
            <#CodePreview>
              <Duotone name="money-back" font_size="10rem" color="piccolo-100" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="duotone_11" class="mt-4">
          <:example>
            <Duotone name="no-bets" font_size="10rem" color="piccolo-100" />
          </:example>

          <:code>
            <#CodePreview>
              <Duotone name="no-bets" font_size="10rem" color="piccolo-100" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="duotone_12" class="mt-4">
          <:example>
            <Duotone name="no-casino-games" font_size="10rem" color="piccolo-100" />
          </:example>

          <:code>
            <#CodePreview>
              <Duotone name="no-casino-games" font_size="10rem" color="piccolo-100" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="duotone_13" class="mt-4">
          <:example>
            <Duotone name="no-data" font_size="10rem" color="piccolo-100" />
          </:example>

          <:code>
            <#CodePreview>
              <Duotone name="no-data" font_size="10rem" color="piccolo-100" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="duotone_14" class="mt-4">
          <:example>
            <Duotone name="no-events" font_size="10rem" color="piccolo-100" />
          </:example>

          <:code>
            <#CodePreview>
              <Duotone name="no-events" font_size="10rem" color="piccolo-100" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="duotone_15" class="mt-4">
          <:example>
            <Duotone name="no-favorite" font_size="10rem" color="piccolo-100" />
          </:example>

          <:code>
            <#CodePreview>
              <Duotone name="no-favorite" font_size="10rem" color="piccolo-100" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="duotone_16" class="mt-4">
          <:example>
            <Duotone name="no-free-bet" font_size="10rem" color="piccolo-100" />
          </:example>

          <:code>
            <#CodePreview>
              <Duotone name="no-free-bet" font_size="10rem" color="piccolo-100" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="duotone_17" class="mt-4">
          <:example>
            <Duotone name="no-internet" font_size="10rem" color="piccolo-100" />
          </:example>

          <:code>
            <#CodePreview>
              <Duotone name="no-internet" font_size="10rem" color="piccolo-100" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="duotone_18" class="mt-4">
          <:example>
            <Duotone name="no-markets" font_size="10rem" color="piccolo-100" />
          </:example>

          <:code>
            <#CodePreview>
              <Duotone name="no-markets" font_size="10rem" color="piccolo-100" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="duotone_19" class="mt-4">
          <:example>
            <Duotone name="no-notification" font_size="10rem" color="piccolo-100" />
          </:example>

          <:code>
            <#CodePreview>
              <Duotone name="no-notification" font_size="10rem" color="piccolo-100" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="duotone_20" class="mt-4">
          <:example>
            <Duotone name="no-participations" font_size="10rem" color="piccolo-100" />
          </:example>

          <:code>
            <#CodePreview>
              <Duotone name="no-participations" font_size="10rem" color="piccolo-100" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="duotone_21" class="mt-4">
          <:example>
            <Duotone name="no-reward" font_size="10rem" color="piccolo-100" />
          </:example>

          <:code>
            <#CodePreview>
              <Duotone name="no-reward" font_size="10rem" color="piccolo-100" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="duotone_22" class="mt-4">
          <:example>
            <Duotone name="no-withdrawals" font_size="10rem" color="piccolo-100" />
          </:example>

          <:code>
            <#CodePreview>
              <Duotone name="no-withdrawals" font_size="10rem" color="piccolo-100" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="duotone_23" class="mt-4">
          <:example>
            <Duotone name="price-boost" font_size="10rem" color="piccolo-100" />
          </:example>

          <:code>
            <#CodePreview>
              <Duotone name="price-boost" font_size="10rem" color="piccolo-100" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="duotone_24" class="mt-4">
          <:example>
            <Duotone name="tiers-and-rewards" font_size="10rem" color="piccolo-100" />
          </:example>

          <:code>
            <#CodePreview>
              <Duotone name="tiers-and-rewards" font_size="10rem" color="piccolo-100" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="duotone_25" class="mt-4">
          <:example>
            <Duotone name="track-your-progress" font_size="10rem" color="piccolo-100" />
          </:example>

          <:code>
            <#CodePreview>
              <Duotone name="track-your-progress" font_size="10rem" color="piccolo-100" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="duotone_26" class="mt-4">
          <:example>
            <Duotone name="trophy" font_size="10rem" color="piccolo-100" />
          </:example>

          <:code>
            <#CodePreview>
              <Duotone name="trophy" font_size="10rem" color="piccolo-100" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="duotone_27" class="mt-4">
          <:example>
            <Duotone name="you-play-we-pay" font_size="10rem" color="piccolo-100" />
          </:example>

          <:code>
            <#CodePreview>
              <Duotone name="you-play-we-pay" font_size="10rem" color="piccolo-100" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>
      </TopToDown>
    </Page>
    """
  end
end
