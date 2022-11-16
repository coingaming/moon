defmodule MoonWeb.Pages.Assets.CurrenciesPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Assets.Currency
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
        to: "/assets/currencies",
        name: "Currencies"
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
        <Heading size={56} class="mb-4">Currencies</Heading>

        <ExampleAndCode id="currency_1" class="mt-4">
          <:example>
            <Currency name="icon-australian-dollar" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon-australian-dollar" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_2" class="mt-4">
          <:example>
            <Currency name="icon-bitcoin" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon-bitcoin" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_3" class="mt-4">
          <:example>
            <Currency name="icon-bnb" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon-bnb" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_4" class="mt-4">
          <:example>
            <Currency name="icon-brazilian-real" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon-brazilian-real" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_5" class="mt-4">
          <:example>
            <Currency name="icon-busd" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon-busd" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_6" class="mt-4">
          <:example>
            <Currency name="icon-canadian-dollar" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon-canadian-dollar" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_7" class="mt-4">
          <:example>
            <Currency name="icon-cardano" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon-cardano" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_8" class="mt-4">
          <:example>
            <Currency name="icon-chiliean-peso" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon-chiliean-peso" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_9" class="mt-4">
          <:example>
            <Currency name="icon-chinese-yuan" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon-chinese-yuan" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_10" class="mt-4">
          <:example>
            <Currency name="icon-danish-krone" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon-danish-krone" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_11" class="mt-4">
          <:example>
            <Currency name="icon-dogecoin" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon-dogecoin" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_12" class="mt-4">
          <:example>
            <Currency name="icon-ethereum" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon-ethereum" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_13" class="mt-4">
          <:example>
            <Currency name="icon-euro" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon-euro" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_14" class="mt-4">
          <:example>
            <Currency name="icon-gb-pound-sterling" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon-gb-pound-sterling" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_15" class="mt-4">
          <:example>
            <Currency name="icon-hong-kong-dollar" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon-hong-kong-dollar" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_16" class="mt-4">
          <:example>
            <Currency name="icon-icelandic-krona" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon-icelandic-krona" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_17" class="mt-4">
          <:example>
            <Currency name="icon-indian-rupee" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon-indian-rupee" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_18" class="mt-4">
          <:example>
            <Currency name="icon-japanese-yen" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon-japanese-yen" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_19" class="mt-4">
          <:example>
            <Currency name="icon-litecoin" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon-litecoin" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_20" class="mt-4">
          <:example>
            <Currency name="icon-new-taiwan-dollar" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon-new-taiwan-dollar" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_21" class="mt-4">
          <:example>
            <Currency name="icon-new-zealand-dollar" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon-new-zealand-dollar" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_22" class="mt-4">
          <:example>
            <Currency name="icon-poland-zloty" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon-poland-zloty" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_23" class="mt-4">
          <:example>
            <Currency name="icon-ripple" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon-ripple" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_24" class="mt-4">
          <:example>
            <Currency name="icon-russian-ruble" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon-russian-ruble" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_25" class="mt-4">
          <:example>
            <Currency name="icon-singapore-dollar" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon-singapore-dollar" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_26" class="mt-4">
          <:example>
            <Currency name="icon-soc" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon-soc" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_27" class="mt-4">
          <:example>
            <Currency name="icon-south-korean-won" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon-south-korean-won" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_28" class="mt-4">
          <:example>
            <Currency name="icon-swedish-krona" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon-swedish-krona" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_29" class="mt-4">
          <:example>
            <Currency name="icon-swiss-franc" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon-swiss-franc" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_30" class="mt-4">
          <:example>
            <Currency name="icon-thai-baht" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon-thai-baht" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_31" class="mt-4">
          <:example>
            <Currency name="icon-tron" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon-tron" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_32" class="mt-4">
          <:example>
            <Currency name="icon-turkish-lira" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon-turkish-lira" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="currency_33" class="mt-4">
          <:example>
            <Currency name="icon-usa-dollar" class="text-[10rem]" />
          </:example>

          <:code>
            <#CodePreview>
              <Currency name="icon-usa-dollar" class="text-[10rem]" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>
      </TopToDown>
    </Page>
    """
  end
end
