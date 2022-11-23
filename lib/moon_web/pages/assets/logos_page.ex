defmodule MoonWeb.Pages.Assets.LogosPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Assets.Logo
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
        to: "/assets/logos",
        name: "Logos"
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
        <Heading size={56} class="mb-4">Logos</Heading>

        <ExampleAndCode id="logo_1" class="mt-4">
          <:example>
            <Logo name="logo-aposta10-full" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo-aposta10-full" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_2" class="mt-4">
          <:example>
            <Logo name="logo-aposta10-short" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo-aposta10-short" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_3" class="mt-4">
          <:example>
            <Logo name="logo-betadda-full" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo-betadda-full" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_4" class="mt-4">
          <:example>
            <Logo name="logo-betadda-short" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo-betadda-short" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_5" class="mt-4">
          <:example>
            <Logo name="logo-bitcasino-full" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo-bitcasino-full" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_6" class="mt-4">
          <:example>
            <Logo name="logo-bitcasino-short" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo-bitcasino-short" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_7" class="mt-4">
          <:example>
            <Logo name="logo-bombay-full" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo-bombay-full" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_8" class="mt-4">
          <:example>
            <Logo name="logo-bombay-short" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo-bombay-short" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_9" class="mt-4">
          <:example>
            <Logo name="logo-coingaming-short" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo-coingaming-short" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_10" class="mt-4">
          <:example>
            <Logo name="logo-coins-short" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo-coins-short" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_11" class="mt-4">
          <:example>
            <Logo name="logo-comms-short" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo-comms-short" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_12" class="mt-4">
          <:example>
            <Logo name="logo-hub88-full" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo-hub88-full" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_13" class="mt-4">
          <:example>
            <Logo name="logo-hub88-short" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo-hub88-short" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_14" class="mt-4">
          <:example>
            <Logo name="logo-lab-short" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo-lab-short" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_15" class="mt-4">
          <:example>
            <Logo name="logo-livecasino-full" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo-livecasino-full" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_16" class="mt-4">
          <:example>
            <Logo name="logo-livecasino-short" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo-livecasino-short" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_17" class="mt-4">
          <:example>
            <Logo name="logo-luckyslots-full" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo-luckyslots-full" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_18" class="mt-4">
          <:example>
            <Logo name="logo-luckyslots-short" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo-luckyslots-short" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_19" class="mt-4">
          <:example>
            <Logo name="logo-moneyball-full" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo-moneyball-full" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_20" class="mt-4">
          <:example>
            <Logo name="logo-moneyball-short" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo-moneyball-short" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_21" class="mt-4">
          <:example>
            <Logo name="logo-theme-moon-short" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo-theme-moon-short" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_22" class="mt-4">
          <:example>
            <Logo name="logo-partners-short" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo-partners-short" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_23" class="mt-4">
          <:example>
            <Logo name="logo-sb-full" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo-sb-full" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_24" class="mt-4">
          <:example>
            <Logo name="logo-slots-full" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo-slots-full" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_25" class="mt-4">
          <:example>
            <Logo name="logo-slots-short" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo-slots-short" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_26" class="mt-4">
          <:example>
            <Logo name="logo-sportsbet-full" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo-sportsbet-full" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_27" class="mt-4">
          <:example>
            <Logo name="logo-sportsbet-full-new" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo-sportsbet-full-new" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_28" class="mt-4">
          <:example>
            <Logo name="logo-sportsbet-short" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo-sportsbet-short" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_29" class="mt-4">
          <:example>
            <Logo name="logo-sportsbetcanada-full" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo-sportsbetcanada-full" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_30" class="mt-4">
          <:example>
            <Logo name="logo-sportsbetmx-full" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo-sportsbetmx-full" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_31" class="mt-4">
          <:example>
            <Logo name="logo-utorg" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo-utorg" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_32" class="mt-4">
          <:example>
            <Logo name="moon-pay" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="moon-pay" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>
      </TopToDown>
    </Page>
    """
  end
end
