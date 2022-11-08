
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

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <TopToDown>
      <Heading size={56} class="mb-4">Currencies</Heading>
      
        <ExampleAndCode id="currency_1" class="mt-4">
          <#template slot="example">
            <Currency name="IconAustralianDollar" font_size="10rem" />
          </#template>

          <#template slot="code">
            <#CodePreview>
              <Currency name="IconAustralianDollar" font_size="10rem" />
            </#CodePreview>
          </#template>
        </ExampleAndCode>
      

        <ExampleAndCode id="currency_2" class="mt-4">
          <#template slot="example">
            <Currency name="IconBitcoin" font_size="10rem" />
          </#template>

          <#template slot="code">
            <#CodePreview>
              <Currency name="IconBitcoin" font_size="10rem" />
            </#CodePreview>
          </#template>
        </ExampleAndCode>
      

        <ExampleAndCode id="currency_3" class="mt-4">
          <#template slot="example">
            <Currency name="IconBnb" font_size="10rem" />
          </#template>

          <#template slot="code">
            <#CodePreview>
              <Currency name="IconBnb" font_size="10rem" />
            </#CodePreview>
          </#template>
        </ExampleAndCode>
      

        <ExampleAndCode id="currency_4" class="mt-4">
          <#template slot="example">
            <Currency name="IconBrazilianReal" font_size="10rem" />
          </#template>

          <#template slot="code">
            <#CodePreview>
              <Currency name="IconBrazilianReal" font_size="10rem" />
            </#CodePreview>
          </#template>
        </ExampleAndCode>
      

        <ExampleAndCode id="currency_5" class="mt-4">
          <#template slot="example">
            <Currency name="IconBusd" font_size="10rem" />
          </#template>

          <#template slot="code">
            <#CodePreview>
              <Currency name="IconBusd" font_size="10rem" />
            </#CodePreview>
          </#template>
        </ExampleAndCode>
      

        <ExampleAndCode id="currency_6" class="mt-4">
          <#template slot="example">
            <Currency name="IconCanadianDollar" font_size="10rem" />
          </#template>

          <#template slot="code">
            <#CodePreview>
              <Currency name="IconCanadianDollar" font_size="10rem" />
            </#CodePreview>
          </#template>
        </ExampleAndCode>
      

        <ExampleAndCode id="currency_7" class="mt-4">
          <#template slot="example">
            <Currency name="IconCardano" font_size="10rem" />
          </#template>

          <#template slot="code">
            <#CodePreview>
              <Currency name="IconCardano" font_size="10rem" />
            </#CodePreview>
          </#template>
        </ExampleAndCode>
      

        <ExampleAndCode id="currency_8" class="mt-4">
          <#template slot="example">
            <Currency name="IconChilieanPeso" font_size="10rem" />
          </#template>

          <#template slot="code">
            <#CodePreview>
              <Currency name="IconChilieanPeso" font_size="10rem" />
            </#CodePreview>
          </#template>
        </ExampleAndCode>
      

        <ExampleAndCode id="currency_9" class="mt-4">
          <#template slot="example">
            <Currency name="IconChineseYuan" font_size="10rem" />
          </#template>

          <#template slot="code">
            <#CodePreview>
              <Currency name="IconChineseYuan" font_size="10rem" />
            </#CodePreview>
          </#template>
        </ExampleAndCode>
      

        <ExampleAndCode id="currency_10" class="mt-4">
          <#template slot="example">
            <Currency name="IconDanishKrone" font_size="10rem" />
          </#template>

          <#template slot="code">
            <#CodePreview>
              <Currency name="IconDanishKrone" font_size="10rem" />
            </#CodePreview>
          </#template>
        </ExampleAndCode>
      

        <ExampleAndCode id="currency_11" class="mt-4">
          <#template slot="example">
            <Currency name="IconDogecoin" font_size="10rem" />
          </#template>

          <#template slot="code">
            <#CodePreview>
              <Currency name="IconDogecoin" font_size="10rem" />
            </#CodePreview>
          </#template>
        </ExampleAndCode>
      

        <ExampleAndCode id="currency_12" class="mt-4">
          <#template slot="example">
            <Currency name="IconEthereum" font_size="10rem" />
          </#template>

          <#template slot="code">
            <#CodePreview>
              <Currency name="IconEthereum" font_size="10rem" />
            </#CodePreview>
          </#template>
        </ExampleAndCode>
      

        <ExampleAndCode id="currency_13" class="mt-4">
          <#template slot="example">
            <Currency name="IconEuro" font_size="10rem" />
          </#template>

          <#template slot="code">
            <#CodePreview>
              <Currency name="IconEuro" font_size="10rem" />
            </#CodePreview>
          </#template>
        </ExampleAndCode>
      

        <ExampleAndCode id="currency_14" class="mt-4">
          <#template slot="example">
            <Currency name="IconGbPoundSterling" font_size="10rem" />
          </#template>

          <#template slot="code">
            <#CodePreview>
              <Currency name="IconGbPoundSterling" font_size="10rem" />
            </#CodePreview>
          </#template>
        </ExampleAndCode>
      

        <ExampleAndCode id="currency_15" class="mt-4">
          <#template slot="example">
            <Currency name="IconHongKongDollar" font_size="10rem" />
          </#template>

          <#template slot="code">
            <#CodePreview>
              <Currency name="IconHongKongDollar" font_size="10rem" />
            </#CodePreview>
          </#template>
        </ExampleAndCode>
      

        <ExampleAndCode id="currency_16" class="mt-4">
          <#template slot="example">
            <Currency name="IconIcelandicKrona" font_size="10rem" />
          </#template>

          <#template slot="code">
            <#CodePreview>
              <Currency name="IconIcelandicKrona" font_size="10rem" />
            </#CodePreview>
          </#template>
        </ExampleAndCode>
      

        <ExampleAndCode id="currency_17" class="mt-4">
          <#template slot="example">
            <Currency name="IconIndianRupee" font_size="10rem" />
          </#template>

          <#template slot="code">
            <#CodePreview>
              <Currency name="IconIndianRupee" font_size="10rem" />
            </#CodePreview>
          </#template>
        </ExampleAndCode>
      

        <ExampleAndCode id="currency_18" class="mt-4">
          <#template slot="example">
            <Currency name="IconJapaneseYen" font_size="10rem" />
          </#template>

          <#template slot="code">
            <#CodePreview>
              <Currency name="IconJapaneseYen" font_size="10rem" />
            </#CodePreview>
          </#template>
        </ExampleAndCode>
      

        <ExampleAndCode id="currency_19" class="mt-4">
          <#template slot="example">
            <Currency name="IconLitecoin" font_size="10rem" />
          </#template>

          <#template slot="code">
            <#CodePreview>
              <Currency name="IconLitecoin" font_size="10rem" />
            </#CodePreview>
          </#template>
        </ExampleAndCode>
      

        <ExampleAndCode id="currency_20" class="mt-4">
          <#template slot="example">
            <Currency name="IconNewTaiwanDollar" font_size="10rem" />
          </#template>

          <#template slot="code">
            <#CodePreview>
              <Currency name="IconNewTaiwanDollar" font_size="10rem" />
            </#CodePreview>
          </#template>
        </ExampleAndCode>
      

        <ExampleAndCode id="currency_21" class="mt-4">
          <#template slot="example">
            <Currency name="IconNewZealandDollar" font_size="10rem" />
          </#template>

          <#template slot="code">
            <#CodePreview>
              <Currency name="IconNewZealandDollar" font_size="10rem" />
            </#CodePreview>
          </#template>
        </ExampleAndCode>
      

        <ExampleAndCode id="currency_22" class="mt-4">
          <#template slot="example">
            <Currency name="IconPolandZloty" font_size="10rem" />
          </#template>

          <#template slot="code">
            <#CodePreview>
              <Currency name="IconPolandZloty" font_size="10rem" />
            </#CodePreview>
          </#template>
        </ExampleAndCode>
      

        <ExampleAndCode id="currency_23" class="mt-4">
          <#template slot="example">
            <Currency name="IconRipple" font_size="10rem" />
          </#template>

          <#template slot="code">
            <#CodePreview>
              <Currency name="IconRipple" font_size="10rem" />
            </#CodePreview>
          </#template>
        </ExampleAndCode>
      

        <ExampleAndCode id="currency_24" class="mt-4">
          <#template slot="example">
            <Currency name="IconRussianRuble" font_size="10rem" />
          </#template>

          <#template slot="code">
            <#CodePreview>
              <Currency name="IconRussianRuble" font_size="10rem" />
            </#CodePreview>
          </#template>
        </ExampleAndCode>
      

        <ExampleAndCode id="currency_25" class="mt-4">
          <#template slot="example">
            <Currency name="IconSingaporeDollar" font_size="10rem" />
          </#template>

          <#template slot="code">
            <#CodePreview>
              <Currency name="IconSingaporeDollar" font_size="10rem" />
            </#CodePreview>
          </#template>
        </ExampleAndCode>
      

        <ExampleAndCode id="currency_26" class="mt-4">
          <#template slot="example">
            <Currency name="IconSoc" font_size="10rem" />
          </#template>

          <#template slot="code">
            <#CodePreview>
              <Currency name="IconSoc" font_size="10rem" />
            </#CodePreview>
          </#template>
        </ExampleAndCode>
      

        <ExampleAndCode id="currency_27" class="mt-4">
          <#template slot="example">
            <Currency name="IconSouthKoreanWon" font_size="10rem" />
          </#template>

          <#template slot="code">
            <#CodePreview>
              <Currency name="IconSouthKoreanWon" font_size="10rem" />
            </#CodePreview>
          </#template>
        </ExampleAndCode>
      

        <ExampleAndCode id="currency_28" class="mt-4">
          <#template slot="example">
            <Currency name="IconSwedishKrona" font_size="10rem" />
          </#template>

          <#template slot="code">
            <#CodePreview>
              <Currency name="IconSwedishKrona" font_size="10rem" />
            </#CodePreview>
          </#template>
        </ExampleAndCode>
      

        <ExampleAndCode id="currency_29" class="mt-4">
          <#template slot="example">
            <Currency name="IconSwissFranc" font_size="10rem" />
          </#template>

          <#template slot="code">
            <#CodePreview>
              <Currency name="IconSwissFranc" font_size="10rem" />
            </#CodePreview>
          </#template>
        </ExampleAndCode>
      

        <ExampleAndCode id="currency_30" class="mt-4">
          <#template slot="example">
            <Currency name="IconThaiBaht" font_size="10rem" />
          </#template>

          <#template slot="code">
            <#CodePreview>
              <Currency name="IconThaiBaht" font_size="10rem" />
            </#CodePreview>
          </#template>
        </ExampleAndCode>
      

        <ExampleAndCode id="currency_31" class="mt-4">
          <#template slot="example">
            <Currency name="IconTron" font_size="10rem" />
          </#template>

          <#template slot="code">
            <#CodePreview>
              <Currency name="IconTron" font_size="10rem" />
            </#CodePreview>
          </#template>
        </ExampleAndCode>
      

        <ExampleAndCode id="currency_32" class="mt-4">
          <#template slot="example">
            <Currency name="IconTurkishLira" font_size="10rem" />
          </#template>

          <#template slot="code">
            <#CodePreview>
              <Currency name="IconTurkishLira" font_size="10rem" />
            </#CodePreview>
          </#template>
        </ExampleAndCode>
      

        <ExampleAndCode id="currency_33" class="mt-4">
          <#template slot="example">
            <Currency name="IconUsaDollar" font_size="10rem" />
          </#template>

          <#template slot="code">
            <#CodePreview>
              <Currency name="IconUsaDollar" font_size="10rem" />
            </#CodePreview>
          </#template>
        </ExampleAndCode>
      
      </TopToDown>
    </Page>
    """
  end
end
    