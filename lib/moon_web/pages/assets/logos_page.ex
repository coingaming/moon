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
            <Logo name="LogoAposta10Full" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="LogoAposta10Full" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_2" class="mt-4">
          <:example>
            <Logo name="LogoAposta10Short" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="LogoAposta10Short" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_3" class="mt-4">
          <:example>
            <Logo name="LogoBetaddaFull" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="LogoBetaddaFull" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_4" class="mt-4">
          <:example>
            <Logo name="LogoBetaddaShort" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="LogoBetaddaShort" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_5" class="mt-4">
          <:example>
            <Logo name="LogoBitcasinoFull" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="LogoBitcasinoFull" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_6" class="mt-4">
          <:example>
            <Logo name="LogoBitcasinoShort" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="LogoBitcasinoShort" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_7" class="mt-4">
          <:example>
            <Logo name="LogoBombayFull" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="LogoBombayFull" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_8" class="mt-4">
          <:example>
            <Logo name="LogoBombayShort" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="LogoBombayShort" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_9" class="mt-4">
          <:example>
            <Logo name="LogoCoingamingShort" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="LogoCoingamingShort" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_10" class="mt-4">
          <:example>
            <Logo name="LogoCoinsShort" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="LogoCoinsShort" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_11" class="mt-4">
          <:example>
            <Logo name="LogoCommsShort" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="LogoCommsShort" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_12" class="mt-4">
          <:example>
            <Logo name="LogoHub88Full" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="LogoHub88Full" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_13" class="mt-4">
          <:example>
            <Logo name="LogoHub88Short" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="LogoHub88Short" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_14" class="mt-4">
          <:example>
            <Logo name="LogoLabShort" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="LogoLabShort" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_15" class="mt-4">
          <:example>
            <Logo name="LogoLivecasinoFull" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="LogoLivecasinoFull" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_16" class="mt-4">
          <:example>
            <Logo name="LogoLivecasinoShort" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="LogoLivecasinoShort" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_17" class="mt-4">
          <:example>
            <Logo name="LogoLuckyslotsFull" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="LogoLuckyslotsFull" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_18" class="mt-4">
          <:example>
            <Logo name="LogoLuckyslotsShort" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="LogoLuckyslotsShort" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_19" class="mt-4">
          <:example>
            <Logo name="LogoMoneyballFull" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="LogoMoneyballFull" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_20" class="mt-4">
          <:example>
            <Logo name="LogoMoneyballShort" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="LogoMoneyballShort" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_21" class="mt-4">
          <:example>
            <Logo name="LogoMoonDesignShort" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="LogoMoonDesignShort" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_22" class="mt-4">
          <:example>
            <Logo name="LogoPartnersShort" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="LogoPartnersShort" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_23" class="mt-4">
          <:example>
            <Logo name="LogoSbFull" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="LogoSbFull" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_24" class="mt-4">
          <:example>
            <Logo name="LogoSlotsFull" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="LogoSlotsFull" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_25" class="mt-4">
          <:example>
            <Logo name="LogoSlotsShort" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="LogoSlotsShort" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_26" class="mt-4">
          <:example>
            <Logo name="LogoSportsbetFull" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="LogoSportsbetFull" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_27" class="mt-4">
          <:example>
            <Logo name="LogoSportsbetFullNew" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="LogoSportsbetFullNew" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_28" class="mt-4">
          <:example>
            <Logo name="LogoSportsbetShort" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="LogoSportsbetShort" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_29" class="mt-4">
          <:example>
            <Logo name="LogoSportsbetcanadaFull" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="LogoSportsbetcanadaFull" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_30" class="mt-4">
          <:example>
            <Logo name="LogoSportsbetmxFull" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="LogoSportsbetmxFull" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_31" class="mt-4">
          <:example>
            <Logo name="LogoUtorg" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="LogoUtorg" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_32" class="mt-4">
          <:example>
            <Logo name="MoonPay" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="MoonPay" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>
      </TopToDown>
    </Page>
    """
  end
end
