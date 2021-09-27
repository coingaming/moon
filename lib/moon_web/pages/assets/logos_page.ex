defmodule MoonWeb.Pages.Assets.LogosPage do
  use MoonWeb, :live_view

  alias Moon.Assets.Logos
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
        to: "/assets/logos",
        name: "Logos"
      }
    ]

  alias Logos.LogoAposta10Full
  alias Logos.LogoAposta10Short
  alias Logos.LogoBetaddaFull
  alias Logos.LogoBetaddaShort
  alias Logos.LogoBitcasinoFull
  alias Logos.LogoBitcasinoShort
  alias Logos.LogoBombayFull
  alias Logos.LogoBombayShort
  alias Logos.LogoCommsFull
  alias Logos.LogoCommsShort
  alias Logos.LogoDrop
  alias Logos.LogoHub88Full
  alias Logos.LogoHub88Short
  alias Logos.LogoLabFull
  alias Logos.LogoLivecasinoFull
  alias Logos.LogoLivecasinoShort
  alias Logos.LogoLuckyslotsFull
  alias Logos.LogoLuckyslotsShort
  alias Logos.LogoMissions
  alias Logos.LogoMoneyball
  alias Logos.LogoMoonDesignShort
  alias Logos.LogoMoonDesign
  alias Logos.LogoPoweredByHub88
  alias Logos.LogoSlotsFull
  alias Logos.LogoSlotsShort
  alias Logos.LogoSportsbetFull
  alias Logos.LogoSportsbetShort
  alias Logos.LogoSportsbetSponsor
  alias Logos.LogoSportsbet
  alias Logos.LogoUtorg
  alias Logos.MoonPay

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
        <Heading size={56} class="mb-4">Logos</Heading>

        <ExampleAndCode id="logo_1" class="mt-4">
          <:example>
            <LogoAposta10Full font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <LogoAposta10Full font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_2" class="mt-4">
          <:example>
            <LogoAposta10Short font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <LogoAposta10Short font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_3" class="mt-4">
          <:example>
            <LogoBetaddaFull font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <LogoBetaddaFull font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_4" class="mt-4">
          <:example>
            <LogoBetaddaShort font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <LogoBetaddaShort font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_5" class="mt-4">
          <:example>
            <LogoBitcasinoFull font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <LogoBitcasinoFull font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_6" class="mt-4">
          <:example>
            <LogoBitcasinoShort font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <LogoBitcasinoShort font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_7" class="mt-4">
          <:example>
            <LogoBombayFull font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <LogoBombayFull font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_8" class="mt-4">
          <:example>
            <LogoBombayShort font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <LogoBombayShort font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_9" class="mt-4">
          <:example>
            <LogoCommsFull font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <LogoCommsFull font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_10" class="mt-4">
          <:example>
            <LogoCommsShort font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <LogoCommsShort font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_11" class="mt-4">
          <:example>
            <LogoDrop font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <LogoDrop font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_12" class="mt-4">
          <:example>
            <LogoHub88Full font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <LogoHub88Full font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_13" class="mt-4">
          <:example>
            <LogoHub88Short font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <LogoHub88Short font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_14" class="mt-4">
          <:example>
            <LogoLabFull font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <LogoLabFull font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_15" class="mt-4">
          <:example>
            <LogoLivecasinoFull font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <LogoLivecasinoFull font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_16" class="mt-4">
          <:example>
            <LogoLivecasinoShort font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <LogoLivecasinoShort font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_17" class="mt-4">
          <:example>
            <LogoLuckyslotsFull font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <LogoLuckyslotsFull font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_18" class="mt-4">
          <:example>
            <LogoLuckyslotsShort font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <LogoLuckyslotsShort font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_19" class="mt-4">
          <:example>
            <LogoMissions font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <LogoMissions font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_20" class="mt-4">
          <:example>
            <LogoMoneyball font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <LogoMoneyball font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_21" class="mt-4">
          <:example>
            <LogoMoonDesignShort font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <LogoMoonDesignShort font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_22" class="mt-4">
          <:example>
            <LogoMoonDesign font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <LogoMoonDesign font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_23" class="mt-4">
          <:example>
            <LogoPoweredByHub88 font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <LogoPoweredByHub88 font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_24" class="mt-4">
          <:example>
            <LogoSlotsFull font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <LogoSlotsFull font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_25" class="mt-4">
          <:example>
            <LogoSlotsShort font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <LogoSlotsShort font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_26" class="mt-4">
          <:example>
            <LogoSportsbetFull font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <LogoSportsbetFull font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_27" class="mt-4">
          <:example>
            <LogoSportsbetShort font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <LogoSportsbetShort font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_28" class="mt-4">
          <:example>
            <LogoSportsbetSponsor font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <LogoSportsbetSponsor font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_29" class="mt-4">
          <:example>
            <LogoSportsbet font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <LogoSportsbet font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_30" class="mt-4">
          <:example>
            <LogoUtorg font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <LogoUtorg font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_31" class="mt-4">
          <:example>
            <MoonPay font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <MoonPay font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>
      </TopToDown>
    </Page>
    """
  end
end
