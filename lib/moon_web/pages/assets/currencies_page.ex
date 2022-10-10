defmodule MoonWeb.Pages.Assets.CurrenciesPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Assets.Currency
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
        to: "/assets/currencies",
        name: "Currencies"
      }
    ]

  def mount(params, _session, socket) do
    {:ok,
     assign(socket,
       theme_name: params["theme_name"] || "moon-design-light",
       direction: params["direction"] || "ltr",
       active_page: __MODULE__
     )}
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <TopToDown>
        <Heading size={56} class="mb-4">Currencies</Heading>

        <ExampleAndCode id="currency_1" class="mt-4">
          <:example>
            <Currency name="icon_australian_dollar" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon_australian_dollar" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_2" class="mt-4">
          <:example>
            <Currency name="icon_bitcoin" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon_bitcoin" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_3" class="mt-4">
          <:example>
            <Currency name="icon_brazilian_real" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon_brazilian_real" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_4" class="mt-4">
          <:example>
            <Currency name="icon_canadian_dollar" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon_canadian_dollar" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_5" class="mt-4">
          <:example>
            <Currency name="icon_cardano" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon_cardano" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_6" class="mt-4">
          <:example>
            <Currency name="icon_chiliean_peso" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon_chiliean_peso" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_7" class="mt-4">
          <:example>
            <Currency name="icon_chinese_yuan" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon_chinese_yuan" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_8" class="mt-4">
          <:example>
            <Currency name="icon_danish_krone" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon_danish_krone" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_9" class="mt-4">
          <:example>
            <Currency name="icon_dogecoin" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon_dogecoin" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_10" class="mt-4">
          <:example>
            <Currency name="icon_ethereum" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon_ethereum" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_11" class="mt-4">
          <:example>
            <Currency name="icon_euro" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon_euro" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_12" class="mt-4">
          <:example>
            <Currency name="icon_gb_pound_sterling" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon_gb_pound_sterling" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_13" class="mt-4">
          <:example>
            <Currency name="icon_hong_kong_dollar" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon_hong_kong_dollar" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_14" class="mt-4">
          <:example>
            <Currency name="icon_icelandic_krona" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon_icelandic_krona" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_15" class="mt-4">
          <:example>
            <Currency name="icon_indian_rupee" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon_indian_rupee" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_16" class="mt-4">
          <:example>
            <Currency name="icon_japanese_yen" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon_japanese_yen" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_17" class="mt-4">
          <:example>
            <Currency name="icon_litecoin" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon_litecoin" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_18" class="mt-4">
          <:example>
            <Currency name="icon_new_taiwan_dollar" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon_new_taiwan_dollar" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_19" class="mt-4">
          <:example>
            <Currency name="icon_new_zealand_dollar" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon_new_zealand_dollar" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_20" class="mt-4">
          <:example>
            <Currency name="icon_poland_zloty" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon_poland_zloty" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_21" class="mt-4">
          <:example>
            <Currency name="icon_ripple" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon_ripple" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_22" class="mt-4">
          <:example>
            <Currency name="icon_russian_ruble" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon_russian_ruble" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_23" class="mt-4">
          <:example>
            <Currency name="icon_singapore_dollar" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon_singapore_dollar" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_24" class="mt-4">
          <:example>
            <Currency name="icon_soc" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon_soc" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_25" class="mt-4">
          <:example>
            <Currency name="icon_south_korean_won" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon_south_korean_won" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_26" class="mt-4">
          <:example>
            <Currency name="icon_swedish_krona" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon_swedish_krona" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_27" class="mt-4">
          <:example>
            <Currency name="icon_swiss_franc" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon_swiss_franc" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_28" class="mt-4">
          <:example>
            <Currency name="icon_thai_baht" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon_thai_baht" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_29" class="mt-4">
          <:example>
            <Currency name="icon_tron" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon_tron" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_30" class="mt-4">
          <:example>
            <Currency name="icon_turkish_lira" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon_turkish_lira" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_31" class="mt-4">
          <:example>
            <Currency name="icon_usa_dollar" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon_usa_dollar" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>
      </TopToDown>
    </Page>
    """
  end
end
