defmodule MoonWeb.Pages.Assets.IconsPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Assets.Icon
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
        to: "/assets/icons",
        name: "Icons"
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
        <Heading size={56} class="mb-4">Icons</Heading>

        <ExampleAndCode id="icon_1" class="mt-4">
          <:example>
            <Icon name="Icon-about" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="Icon-about" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_2" class="mt-4">
          <:example>
            <Icon name="icon-add" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-add" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_3" class="mt-4">
          <:example>
            <Icon name="icon-alert-circle" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-alert-circle" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_4" class="mt-4">
          <:example>
            <Icon name="icon-align-left" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-align-left" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_5" class="mt-4">
          <:example>
            <Icon name="icon-all-sports" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-all-sports" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_6" class="mt-4">
          <:example>
            <Icon name="icon-arrow-diagonal-down-left" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-arrow-diagonal-down-left" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_7" class="mt-4">
          <:example>
            <Icon name="icon-arrow-diagonal-up-right" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-arrow-diagonal-up-right" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_8" class="mt-4">
          <:example>
            <Icon name="icon-arrow-diagonals" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-arrow-diagonals" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_9" class="mt-4">
          <:example>
            <Icon name="icon-arrow-down" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-arrow-down" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_10" class="mt-4">
          <:example>
            <Icon name="icon-arrow-l-down" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-arrow-l-down" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_11" class="mt-4">
          <:example>
            <Icon name="icon-arrow-l-up" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-arrow-l-up" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_12" class="mt-4">
          <:example>
            <Icon name="icon-arrow-left-right" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-arrow-left-right" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_13" class="mt-4">
          <:example>
            <Icon name="icon-arrow-left" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-arrow-left" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_14" class="mt-4">
          <:example>
            <Icon name="icon-arrow-right" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-arrow-right" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_15" class="mt-4">
          <:example>
            <Icon name="icon-arrow-top-right" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-arrow-top-right" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_16" class="mt-4">
          <:example>
            <Icon name="icon-arrow-up-down" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-arrow-up-down" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_17" class="mt-4">
          <:example>
            <Icon name="icon-arrow-up" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-arrow-up" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_18" class="mt-4">
          <:example>
            <Icon name="icon-asian-view" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-asian-view" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_19" class="mt-4">
          <:example>
            <Icon name="icon-attache" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-attache" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_20" class="mt-4">
          <:example>
            <Icon name="icon-award" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-award" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_21" class="mt-4">
          <:example>
            <Icon name="icon-banner-info" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-banner-info" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_22" class="mt-4">
          <:example>
            <Icon name="icon-bell" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-bell" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_23" class="mt-4">
          <:example>
            <Icon name="icon-bitcoin-talk" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-bitcoin-talk" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_24" class="mt-4">
          <:example>
            <Icon name="icon-bombay-club" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-bombay-club" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_25" class="mt-4">
          <:example>
            <Icon name="icon-btc" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-btc" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_26" class="mt-4">
          <:example>
            <Icon name="icon-burger" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-burger" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_27" class="mt-4">
          <:example>
            <Icon name="icon-calendar-empty" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-calendar-empty" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_28" class="mt-4">
          <:example>
            <Icon name="icon-calendar" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-calendar" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_29" class="mt-4">
          <:example>
            <Icon name="icon-card" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-card" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_30" class="mt-4">
          <:example>
            <Icon name="icon-case" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-case" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_31" class="mt-4">
          <:example>
            <Icon name="icon-cash-out" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-cash-out" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_32" class="mt-4">
          <:example>
            <Icon name="icon-casino-bell" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-casino-bell" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_33" class="mt-4">
          <:example>
            <Icon name="icon-casino" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-casino" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_34" class="mt-4">
          <:example>
            <Icon name="icon-chart-area" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-chart-area" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_35" class="mt-4">
          <:example>
            <Icon name="icon-chart-bar" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-chart-bar" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_36" class="mt-4">
          <:example>
            <Icon name="icon-chart-pies" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-chart-pies" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_37" class="mt-4">
          <:example>
            <Icon name="icon-chart-round" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-chart-round" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_38" class="mt-4">
          <:example>
            <Icon name="icon-chart-segment" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-chart-segment" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_39" class="mt-4">
          <:example>
            <Icon name="icon-chevron-down-rounded" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-chevron-down-rounded" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_40" class="mt-4">
          <:example>
            <Icon name="icon-chevron-down" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-chevron-down" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_41" class="mt-4">
          <:example>
            <Icon name="icon-chevron-left-rounded" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-chevron-left-rounded" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_42" class="mt-4">
          <:example>
            <Icon name="icon-chevron-left" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-chevron-left" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_43" class="mt-4">
          <:example>
            <Icon name="icon-chevron-right-rounded" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-chevron-right-rounded" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_44" class="mt-4">
          <:example>
            <Icon name="icon-chevron-right" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-chevron-right" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_45" class="mt-4">
          <:example>
            <Icon name="icon-chevron-up-down" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-chevron-up-down" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_46" class="mt-4">
          <:example>
            <Icon name="icon-chevron-up-rounded" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-chevron-up-rounded" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_47" class="mt-4">
          <:example>
            <Icon name="icon-chevron-up" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-chevron-up" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_48" class="mt-4">
          <:example>
            <Icon name="icon-circle" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-circle" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_49" class="mt-4">
          <:example>
            <Icon name="icon-claps" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-claps" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_50" class="mt-4">
          <:example>
            <Icon name="icon-clock" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-clock" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_51" class="mt-4">
          <:example>
            <Icon name="icon-close-rounded" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-close-rounded" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_52" class="mt-4">
          <:example>
            <Icon name="icon-close-small" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-close-small" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_53" class="mt-4">
          <:example>
            <Icon name="icon-close" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-close" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_54" class="mt-4">
          <:example>
            <Icon name="icon-code" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-code" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_55" class="mt-4">
          <:example>
            <Icon name="icon-collapse" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-collapse" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_56" class="mt-4">
          <:example>
            <Icon name="icon-copy" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-copy" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_57" class="mt-4">
          <:example>
            <Icon name="icon-credit" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-credit" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_58" class="mt-4">
          <:example>
            <Icon name="icon-crypto" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-crypto" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_59" class="mt-4">
          <:example>
            <Icon name="icon-currency-ADA" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-currency-ADA" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_60" class="mt-4">
          <:example>
            <Icon name="icon-currency-ARS" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-currency-ARS" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_61" class="mt-4">
          <:example>
            <Icon name="icon-currency-BDT" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-currency-BDT" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_62" class="mt-4">
          <:example>
            <Icon name="icon-currency-BOB" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-currency-BOB" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_63" class="mt-4">
          <:example>
            <Icon name="icon-currency-BRL" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-currency-BRL" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_64" class="mt-4">
          <:example>
            <Icon name="icon-currency-BTC" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-currency-BTC" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_65" class="mt-4">
          <:example>
            <Icon name="icon-currency-CAD" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-currency-CAD" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_66" class="mt-4">
          <:example>
            <Icon name="icon-currency-CLP" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-currency-CLP" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_67" class="mt-4">
          <:example>
            <Icon name="icon-currency-CNY" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-currency-CNY" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_68" class="mt-4">
          <:example>
            <Icon name="icon-currency-CRC" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-currency-CRC" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_69" class="mt-4">
          <:example>
            <Icon name="icon-currency-ETH" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-currency-ETH" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_70" class="mt-4">
          <:example>
            <Icon name="icon-currency-EUR" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-currency-EUR" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_71" class="mt-4">
          <:example>
            <Icon name="icon-currency-GEL" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-currency-GEL" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_72" class="mt-4">
          <:example>
            <Icon name="icon-currency-HKD" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-currency-HKD" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_73" class="mt-4">
          <:example>
            <Icon name="icon-currency-IDR" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-currency-IDR" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_74" class="mt-4">
          <:example>
            <Icon name="icon-currency-INR" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-currency-INR" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_75" class="mt-4">
          <:example>
            <Icon name="icon-currency-IQD" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-currency-IQD" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_76" class="mt-4">
          <:example>
            <Icon name="icon-currency-JPY" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-currency-JPY" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_77" class="mt-4">
          <:example>
            <Icon name="icon-currency-KRW" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-currency-KRW" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_78" class="mt-4">
          <:example>
            <Icon name="icon-currency-LTC" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-currency-LTC" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_79" class="mt-4">
          <:example>
            <Icon name="icon-currency-MXN" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-currency-MXN" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_80" class="mt-4">
          <:example>
            <Icon name="icon-currency-MYR" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-currency-MYR" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_81" class="mt-4">
          <:example>
            <Icon name="icon-currency-PEN" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-currency-PEN" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_82" class="mt-4">
          <:example>
            <Icon name="icon-currency-PKR" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-currency-PKR" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_83" class="mt-4">
          <:example>
            <Icon name="icon-currency-RUB" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-currency-RUB" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_84" class="mt-4">
          <:example>
            <Icon name="icon-currency-SOC" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-currency-SOC" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_85" class="mt-4">
          <:example>
            <Icon name="icon-currency-THB" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-currency-THB" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_86" class="mt-4">
          <:example>
            <Icon name="icon-currency-TRX" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-currency-TRX" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_87" class="mt-4">
          <:example>
            <Icon name="icon-currency-TRY" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-currency-TRY" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_88" class="mt-4">
          <:example>
            <Icon name="icon-currency-UAH" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-currency-UAH" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_89" class="mt-4">
          <:example>
            <Icon name="icon-currency-USD" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-currency-USD" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_90" class="mt-4">
          <:example>
            <Icon name="icon-currency-USDT" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-currency-USDT" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_91" class="mt-4">
          <:example>
            <Icon name="icon-currency-VES" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-currency-VES" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_92" class="mt-4">
          <:example>
            <Icon name="icon-currency-VND" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-currency-VND" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_93" class="mt-4">
          <:example>
            <Icon name="icon-currency-XRP" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-currency-XRP" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_94" class="mt-4">
          <:example>
            <Icon name="icon-cursor" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-cursor" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_95" class="mt-4">
          <:example>
            <Icon name="icon-data" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-data" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_96" class="mt-4">
          <:example>
            <Icon name="icon-debit-cards" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-debit-cards" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_97" class="mt-4">
          <:example>
            <Icon name="icon-delete" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-delete" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_98" class="mt-4">
          <:example>
            <Icon name="icon-desktop" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-desktop" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_99" class="mt-4">
          <:example>
            <Icon name="icon-details" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-details" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_100" class="mt-4">
          <:example>
            <Icon name="icon-double" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-double" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_101" class="mt-4">
          <:example>
            <Icon name="icon-download" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-download" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_102" class="mt-4">
          <:example>
            <Icon name="icon-duotone-arrows" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-duotone-arrows" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_103" class="mt-4">
          <:example>
            <Icon name="icon-duotone-chat" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-duotone-chat" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_104" class="mt-4">
          <:example>
            <Icon name="icon-duotone-coins" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-duotone-coins" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_105" class="mt-4">
          <:example>
            <Icon name="icon-duotone-mail" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-duotone-mail" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_106" class="mt-4">
          <:example>
            <Icon name="icon-e-sports-call-of-duty" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-e-sports-call-of-duty" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_107" class="mt-4">
          <:example>
            <Icon name="icon-e-sports-counter-strike" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-e-sports-counter-strike" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_108" class="mt-4">
          <:example>
            <Icon name="icon-e-sports-dota2" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-e-sports-dota2" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_109" class="mt-4">
          <:example>
            <Icon name="icon-e-sports-e-nba" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-e-sports-e-nba" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_110" class="mt-4">
          <:example>
            <Icon name="icon-e-sports-e-sport" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-e-sports-e-sport" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_111" class="mt-4">
          <:example>
            <Icon name="icon-e-sports-football" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-e-sports-football" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_112" class="mt-4">
          <:example>
            <Icon name="icon-e-sports-hearthstone" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-e-sports-hearthstone" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_113" class="mt-4">
          <:example>
            <Icon name="icon-e-sports-league-of-legends" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-e-sports-league-of-legends" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_114" class="mt-4">
          <:example>
            <Icon name="icon-e-sports-overwatch" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-e-sports-overwatch" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_115" class="mt-4">
          <:example>
            <Icon name="icon-e-sports-rainbow" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-e-sports-rainbow" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_116" class="mt-4">
          <:example>
            <Icon name="icon-e-sports-rocket-league" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-e-sports-rocket-league" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_117" class="mt-4">
          <:example>
            <Icon name="icon-e-sports-star-craft" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-e-sports-star-craft" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_118" class="mt-4">
          <:example>
            <Icon name="icon-edit" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-edit" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_119" class="mt-4">
          <:example>
            <Icon name="icon-error-circle" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-error-circle" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_120" class="mt-4">
          <:example>
            <Icon name="icon-expand" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-expand" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_121" class="mt-4">
          <:example>
            <Icon name="icon-eye-closed" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-eye-closed" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_122" class="mt-4">
          <:example>
            <Icon name="icon-eye" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-eye" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_123" class="mt-4">
          <:example>
            <Icon name="icon-facebook" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-facebook" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_124" class="mt-4">
          <:example>
            <Icon name="icon-filter" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-filter" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_125" class="mt-4">
          <:example>
            <Icon name="icon-forward" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-forward" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_126" class="mt-4">
          <:example>
            <Icon name="icon-freebet" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-freebet" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_127" class="mt-4">
          <:example>
            <Icon name="icon-full-screen" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-full-screen" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_128" class="mt-4">
          <:example>
            <Icon name="icon-gamepad" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-gamepad" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_129" class="mt-4">
          <:example>
            <Icon name="icon-gift" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-gift" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_130" class="mt-4">
          <:example>
            <Icon name="icon-glasses" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-glasses" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_131" class="mt-4">
          <:example>
            <Icon name="icon-globe" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-globe" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_132" class="mt-4">
          <:example>
            <Icon name="icon-google" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-google" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_133" class="mt-4">
          <:example>
            <Icon name="icon-hamburger" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-hamburger" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_134" class="mt-4">
          <:example>
            <Icon name="icon-help" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-help" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_135" class="mt-4">
          <:example>
            <Icon name="icon-history" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-history" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_136" class="mt-4">
          <:example>
            <Icon name="icon-home" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-home" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_137" class="mt-4">
          <:example>
            <Icon name="icon-hub88" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-hub88" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_138" class="mt-4">
          <:example>
            <Icon name="icon-hyperlink" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-hyperlink" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_139" class="mt-4">
          <:example>
            <Icon name="icon-in-play" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-in-play" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_140" class="mt-4">
          <:example>
            <Icon name="icon-info-circle" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-info-circle" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_141" class="mt-4">
          <:example>
            <Icon name="icon-info" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-info" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_142" class="mt-4">
          <:example>
            <Icon name="icon-instagram" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-instagram" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_143" class="mt-4">
          <:example>
            <Icon name="icon-left-arrow-curve-right" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-left-arrow-curve-right" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_144" class="mt-4">
          <:example>
            <Icon name="icon-life-ring" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-life-ring" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_145" class="mt-4">
          <:example>
            <Icon name="icon-lightbulb" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-lightbulb" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_146" class="mt-4">
          <:example>
            <Icon name="icon-limit" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-limit" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_147" class="mt-4">
          <:example>
            <Icon name="icon-line" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-line" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_148" class="mt-4">
          <:example>
            <Icon name="icon-link" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-link" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_149" class="mt-4">
          <:example>
            <Icon name="icon-list-numbered" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-list-numbered" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_150" class="mt-4">
          <:example>
            <Icon name="icon-live-chat" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-live-chat" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_151" class="mt-4">
          <:example>
            <Icon name="icon-live-stream" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-live-stream" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_152" class="mt-4">
          <:example>
            <Icon name="icon-login" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-login" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_153" class="mt-4">
          <:example>
            <Icon name="icon-logo-plain" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-logo-plain" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_154" class="mt-4">
          <:example>
            <Icon name="icon-logout" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-logout" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_155" class="mt-4">
          <:example>
            <Icon name="icon-loyalty-0" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-loyalty-0" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_156" class="mt-4">
          <:example>
            <Icon name="icon-mail" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-mail" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_157" class="mt-4">
          <:example>
            <Icon name="icon-menu-home" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-menu-home" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_158" class="mt-4">
          <:example>
            <Icon name="icon-menu" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-menu" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_159" class="mt-4">
          <:example>
            <Icon name="icon-minus" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-minus" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_160" class="mt-4">
          <:example>
            <Icon name="icon-mobile" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-mobile" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_161" class="mt-4">
          <:example>
            <Icon name="icon-money" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-money" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_162" class="mt-4">
          <:example>
            <Icon name="icon-moneybag" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-moneybag" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_163" class="mt-4">
          <:example>
            <Icon name="icon-moon" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-moon" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_164" class="mt-4">
          <:example>
            <Icon name="icon-more" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-more" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_165" class="mt-4">
          <:example>
            <Icon name="icon-news" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-news" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_166" class="mt-4">
          <:example>
            <Icon name="icon-notification-unread" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-notification-unread" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_167" class="mt-4">
          <:example>
            <Icon name="icon-notification" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-notification" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_168" class="mt-4">
          <:example>
            <Icon name="icon-padlock" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-padlock" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_169" class="mt-4">
          <:example>
            <Icon name="icon-pencil" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-pencil" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_170" class="mt-4">
          <:example>
            <Icon name="icon-photo" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-photo" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_171" class="mt-4">
          <:example>
            <Icon name="icon-picture" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-picture" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_172" class="mt-4">
          <:example>
            <Icon name="icon-pin" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-pin" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_173" class="mt-4">
          <:example>
            <Icon name="icon-play" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-play" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_174" class="mt-4">
          <:example>
            <Icon name="icon-plus" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-plus" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_175" class="mt-4">
          <:example>
            <Icon name="icon-price-boost" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-price-boost" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_176" class="mt-4">
          <:example>
            <Icon name="icon-print" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-print" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_177" class="mt-4">
          <:example>
            <Icon name="icon-profile" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-profile" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_178" class="mt-4">
          <:example>
            <Icon name="icon-promotions" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-promotions" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_179" class="mt-4">
          <:example>
            <Icon name="icon-refresh" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-refresh" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_180" class="mt-4">
          <:example>
            <Icon name="icon-reward" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-reward" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_181" class="mt-4">
          <:example>
            <Icon name="icon-row" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-row" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_182" class="mt-4">
          <:example>
            <Icon name="icon-sb-shield" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-sb-shield" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_183" class="mt-4">
          <:example>
            <Icon name="icon-search" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-search" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_184" class="mt-4">
          <:example>
            <Icon name="icon-settings" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-settings" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_185" class="mt-4">
          <:example>
            <Icon name="icon-share" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-share" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_186" class="mt-4">
          <:example>
            <Icon name="icon-sliders" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-sliders" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_187" class="mt-4">
          <:example>
            <Icon name="icon-slots" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-slots" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_188" class="mt-4">
          <:example>
            <Icon name="icon-snackbar-success" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-snackbar-success" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_189" class="mt-4">
          <:example>
            <Icon name="icon-sport-widget" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-sport-widget" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_190" class="mt-4">
          <:example>
            <Icon name="icon-sports-afl" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-sports-afl" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_191" class="mt-4">
          <:example>
            <Icon name="icon-sports-american-foot-ball" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-sports-american-foot-ball" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_192" class="mt-4">
          <:example>
            <Icon name="icon-sports-badminton" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-sports-badminton" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_193" class="mt-4">
          <:example>
            <Icon name="icon-sports-base-ball" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-sports-base-ball" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_194" class="mt-4">
          <:example>
            <Icon name="icon-sports-basket-ball" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-sports-basket-ball" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_195" class="mt-4">
          <:example>
            <Icon name="icon-sports-biathlon" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-sports-biathlon" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_196" class="mt-4">
          <:example>
            <Icon name="icon-sports-boxing" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-sports-boxing" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_197" class="mt-4">
          <:example>
            <Icon name="icon-sports-center" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-sports-center" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_198" class="mt-4">
          <:example>
            <Icon name="icon-sports-cricket" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-sports-cricket" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_199" class="mt-4">
          <:example>
            <Icon name="icon-sports-cycling" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-sports-cycling" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_200" class="mt-4">
          <:example>
            <Icon name="icon-sports-darts" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-sports-darts" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_201" class="mt-4">
          <:example>
            <Icon name="icon-sports-e-sports" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-sports-e-sports" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_202" class="mt-4">
          <:example>
            <Icon name="icon-sports-fantasy" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-sports-fantasy" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_203" class="mt-4">
          <:example>
            <Icon name="icon-sports-featured" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-sports-featured" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_204" class="mt-4">
          <:example>
            <Icon name="icon-sports-foot-ball" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-sports-foot-ball" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_205" class="mt-4">
          <:example>
            <Icon name="icon-sports-golf" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-sports-golf" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_206" class="mt-4">
          <:example>
            <Icon name="icon-sports-hand-ball" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-sports-hand-ball" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_207" class="mt-4">
          <:example>
            <Icon name="icon-sports-horse-racing" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-sports-horse-racing" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_208" class="mt-4">
          <:example>
            <Icon name="icon-sports-ice-hockey" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-sports-ice-hockey" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_209" class="mt-4">
          <:example>
            <Icon name="icon-sports-mma" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-sports-mma" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_210" class="mt-4">
          <:example>
            <Icon name="icon-sports-motor-sports" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-sports-motor-sports" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_211" class="mt-4">
          <:example>
            <Icon name="icon-sports-poker" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-sports-poker" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_212" class="mt-4">
          <:example>
            <Icon name="icon-sports-politics" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-sports-politics" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_213" class="mt-4">
          <:example>
            <Icon name="icon-sports-pool" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-sports-pool" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_214" class="mt-4">
          <:example>
            <Icon name="icon-sports-popular" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-sports-popular" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_215" class="mt-4">
          <:example>
            <Icon name="icon-sports-rugby" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-sports-rugby" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_216" class="mt-4">
          <:example>
            <Icon name="icon-sports-ski" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-sports-ski" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_217" class="mt-4">
          <:example>
            <Icon name="icon-sports-snooker" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-sports-snooker" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_218" class="mt-4">
          <:example>
            <Icon name="icon-sports-special" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-sports-special" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_219" class="mt-4">
          <:example>
            <Icon name="icon-sports-squash" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-sports-squash" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_220" class="mt-4">
          <:example>
            <Icon name="icon-sports-table-tennis" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-sports-table-tennis" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_221" class="mt-4">
          <:example>
            <Icon name="icon-sports-tennis" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-sports-tennis" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_222" class="mt-4">
          <:example>
            <Icon name="icon-sports-volley-ball" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-sports-volley-ball" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_223" class="mt-4">
          <:example>
            <Icon name="icon-sports-water-polo" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-sports-water-polo" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_224" class="mt-4">
          <:example>
            <Icon name="icon-star-empty" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-star-empty" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_225" class="mt-4">
          <:example>
            <Icon name="icon-star-filled" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-star-filled" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_226" class="mt-4">
          <:example>
            <Icon name="icon-star-flag" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-star-flag" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_227" class="mt-4">
          <:example>
            <Icon name="icon-stars" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-stars" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_228" class="mt-4">
          <:example>
            <Icon name="icon-start" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-start" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_229" class="mt-4">
          <:example>
            <Icon name="icon-stats" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-stats" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_230" class="mt-4">
          <:example>
            <Icon name="icon-stop" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-stop" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_231" class="mt-4">
          <:example>
            <Icon name="icon-stopwatch" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-stopwatch" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_232" class="mt-4">
          <:example>
            <Icon name="icon-success-circle" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-success-circle" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_233" class="mt-4">
          <:example>
            <Icon name="icon-sun" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-sun" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_234" class="mt-4">
          <:example>
            <Icon name="icon-support" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-support" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_235" class="mt-4">
          <:example>
            <Icon name="icon-table" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-table" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_236" class="mt-4">
          <:example>
            <Icon name="icon-tag" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-tag" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_237" class="mt-4">
          <:example>
            <Icon name="icon-telegram" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-telegram" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_238" class="mt-4">
          <:example>
            <Icon name="icon-text" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-text" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_239" class="mt-4">
          <:example>
            <Icon name="icon-timer" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-timer" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_240" class="mt-4">
          <:example>
            <Icon name="icon-twitter" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-twitter" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_241" class="mt-4">
          <:example>
            <Icon name="icon-upload" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-upload" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_242" class="mt-4">
          <:example>
            <Icon name="icon-user" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-user" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_243" class="mt-4">
          <:example>
            <Icon name="icon-users" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-users" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_244" class="mt-4">
          <:example>
            <Icon name="icon-virtual-sports" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-virtual-sports" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_245" class="mt-4">
          <:example>
            <Icon name="icon-vkontakte" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-vkontakte" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_246" class="mt-4">
          <:example>
            <Icon name="icon-volatility" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-volatility" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_247" class="mt-4">
          <:example>
            <Icon name="icon-wallet-rounded" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-wallet-rounded" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_248" class="mt-4">
          <:example>
            <Icon name="icon-wallet" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-wallet" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_249" class="mt-4">
          <:example>
            <Icon name="icon-wand" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-wand" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_250" class="mt-4">
          <:example>
            <Icon name="icon-warning" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-warning" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_251" class="mt-4">
          <:example>
            <Icon name="icon-whatsapp" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-whatsapp" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_252" class="mt-4">
          <:example>
            <Icon name="icon-youtube" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-youtube" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_253" class="mt-4">
          <:example>
            <Icon name="icon-zoom" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon-zoom" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_254" class="mt-4">
          <:example>
            <Icon name="icon_error" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon_error" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_255" class="mt-4">
          <:example>
            <Icon name="icon_general_info" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon_general_info" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_256" class="mt-4">
          <:example>
            <Icon name="icon_google_auth" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon_google_auth" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_257" class="mt-4">
          <:example>
            <Icon name="icon_live_casino" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon_live_casino" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_258" class="mt-4">
          <:example>
            <Icon name="icon_lock" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon_lock" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_259" class="mt-4">
          <:example>
            <Icon name="icon_sports_greyhound" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon_sports_greyhound" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_260" class="mt-4">
          <:example>
            <Icon name="icon_sports_harness" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon_sports_harness" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_261" class="mt-4">
          <:example>
            <Icon name="icon_sports_horse" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon_sports_horse" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_262" class="mt-4">
          <:example>
            <Icon name="icon_verify" font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Icon name="icon_verify" font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>
      </TopToDown>
    </Page>
    """
  end
end
