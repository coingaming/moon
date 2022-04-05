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
     assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page theme_name={@theme_name} active_page={@active_page} breadcrumbs={@breadcrumbs}>
      <TopToDown>
        <Heading size={56} class="mb-4">Currencies</Heading>

        <ExampleAndCode id="currency_1" class="mt-4">
          <:example>
            <Currency name="icon_australian-dollar" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon_australian-dollar" font_size="10rem" />
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
            <Currency name="icon_brazilian-real" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon_brazilian-real" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_4" class="mt-4">
          <:example>
            <Currency name="icon_canadian-dollar" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon_canadian-dollar" font_size="10rem" />
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
            <Currency name="icon_chiliean-peso" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon_chiliean-peso" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_7" class="mt-4">
          <:example>
            <Currency name="icon_chinese-yuan" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon_chinese-yuan" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_8" class="mt-4">
          <:example>
            <Currency name="icon_danish-krone" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon_danish-krone" font_size="10rem" />
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
            <Currency name="icon_gb-pound-sterling" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon_gb-pound-sterling" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_13" class="mt-4">
          <:example>
            <Currency name="icon_hong-kong-dollar" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon_hong-kong-dollar" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_14" class="mt-4">
          <:example>
            <Currency name="icon_icelandic-krona" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon_icelandic-krona" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_15" class="mt-4">
          <:example>
            <Currency name="icon_indian-rupee" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon_indian-rupee" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_16" class="mt-4">
          <:example>
            <Currency name="icon_japanese-yen" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon_japanese-yen" font_size="10rem" />
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
            <Currency name="icon_new-taiwan-dollar" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon_new-taiwan-dollar" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_19" class="mt-4">
          <:example>
            <Currency name="icon_new-zealand-dollar" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon_new-zealand-dollar" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_20" class="mt-4">
          <:example>
            <Currency name="icon_poland-zloty" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon_poland-zloty" font_size="10rem" />
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
            <Currency name="icon_russian-ruble" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon_russian-ruble" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_23" class="mt-4">
          <:example>
            <Currency name="icon_singapore-dollar" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon_singapore-dollar" font_size="10rem" />
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
            <Currency name="icon_south-korean-won" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon_south-korean-won" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_26" class="mt-4">
          <:example>
            <Currency name="icon_swedish-krona" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon_swedish-krona" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_27" class="mt-4">
          <:example>
            <Currency name="icon_swiss-franc" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon_swiss-franc" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_28" class="mt-4">
          <:example>
            <Currency name="icon_thai-baht" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon_thai-baht" font_size="10rem" />
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
            <Currency name="icon_turkish-lira" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon_turkish-lira" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_31" class="mt-4">
          <:example>
            <Currency name="icon_usa-dollar" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon_usa-dollar" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>
      </TopToDown>
    </Page>
    """
  end
end
