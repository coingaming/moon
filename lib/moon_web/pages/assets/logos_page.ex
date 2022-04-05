defmodule MoonWeb.Pages.Assets.LogosPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Assets.Logo
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
            <Logo name="logo_aposta10_full" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo_aposta10_full" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_2" class="mt-4">
          <:example>
            <Logo name="logo_aposta10_short" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo_aposta10_short" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_3" class="mt-4">
          <:example>
            <Logo name="logo_betadda_full" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo_betadda_full" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_4" class="mt-4">
          <:example>
            <Logo name="logo_betadda_short" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo_betadda_short" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_5" class="mt-4">
          <:example>
            <Logo name="logo_bitcasino_full" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo_bitcasino_full" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_6" class="mt-4">
          <:example>
            <Logo name="logo_bitcasino_short" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo_bitcasino_short" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_7" class="mt-4">
          <:example>
            <Logo name="logo_bombay_full" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo_bombay_full" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_8" class="mt-4">
          <:example>
            <Logo name="logo_bombay_short" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo_bombay_short" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_9" class="mt-4">
          <:example>
            <Logo name="logo_comms_full" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo_comms_full" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_10" class="mt-4">
          <:example>
            <Logo name="logo_comms_short" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo_comms_short" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_11" class="mt-4">
          <:example>
            <Logo name="logo_drop" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo_drop" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_12" class="mt-4">
          <:example>
            <Logo name="logo_hub88_full" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo_hub88_full" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_13" class="mt-4">
          <:example>
            <Logo name="logo_hub88_short" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo_hub88_short" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_14" class="mt-4">
          <:example>
            <Logo name="logo_lab_full" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo_lab_full" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_15" class="mt-4">
          <:example>
            <Logo name="logo_livecasino_full" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo_livecasino_full" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_16" class="mt-4">
          <:example>
            <Logo name="logo_livecasino_short" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo_livecasino_short" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_17" class="mt-4">
          <:example>
            <Logo name="logo_luckyslots_full" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo_luckyslots_full" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_18" class="mt-4">
          <:example>
            <Logo name="logo_luckyslots_short" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo_luckyslots_short" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_19" class="mt-4">
          <:example>
            <Logo name="logo_missions" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo_missions" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_20" class="mt-4">
          <:example>
            <Logo name="logo_moneyball" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo_moneyball" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_21" class="mt-4">
          <:example>
            <Logo name="logo_moon_design_short" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo_moon_design_short" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_22" class="mt-4">
          <:example>
            <Logo name="logo_moon_design" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo_moon_design" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_23" class="mt-4">
          <:example>
            <Logo name="logo_paxful" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo_paxful" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_24" class="mt-4">
          <:example>
            <Logo name="logo_powered_by_hub88" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo_powered_by_hub88" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_25" class="mt-4">
          <:example>
            <Logo name="logo_slots_full" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo_slots_full" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_26" class="mt-4">
          <:example>
            <Logo name="logo_slots_short" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo_slots_short" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_27" class="mt-4">
          <:example>
            <Logo name="logo_sportsbet_full" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo_sportsbet_full" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_28" class="mt-4">
          <:example>
            <Logo name="logo_sportsbet_short" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo_sportsbet_short" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_29" class="mt-4">
          <:example>
            <Logo name="logo_sportsbet_sponsor" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo_sportsbet_sponsor" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_30" class="mt-4">
          <:example>
            <Logo name="logo_sportsbet" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo_sportsbet" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_31" class="mt-4">
          <:example>
            <Logo name="logo_utorg" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="logo_utorg" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="logo_32" class="mt-4">
          <:example>
            <Logo name="moon_pay" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Logo name="moon_pay" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>
      </TopToDown>
    </Page>
    """
  end
end
