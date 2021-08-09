defmodule MoonWeb.Pages.Assets.CurrenciesPage do
  use MoonWeb, :live_view

  alias MoonWeb.Components.ExampleAndCode
  alias Moon.Components.CodePreview

  alias Moon.Assets.Currencies
  alias Currencies.IconAustralianDollar
  alias Currencies.IconBitcoin
  alias Currencies.IconBrazilianReal
  alias Currencies.IconCanadianDollar
  alias Currencies.IconCardano
  alias Currencies.IconChilieanPeso
  alias Currencies.IconChineseYuan
  alias Currencies.IconDanishKrone
  alias Currencies.IconDogecoin
  alias Currencies.IconEthereum
  alias Currencies.IconEuro
  alias Currencies.IconGbPoundSterling
  alias Currencies.IconHongKongDollar
  alias Currencies.IconIcelandicKrona
  alias Currencies.IconIndianRupee
  alias Currencies.IconJapaneseYen
  alias Currencies.IconLitecoin
  alias Currencies.IconNewTaiwanDollar
  alias Currencies.IconNewZealandDollar
  alias Currencies.IconPolandZloty
  alias Currencies.IconRipple
  alias Currencies.IconRussianRuble
  alias Currencies.IconSingaporeDollar
  alias Currencies.IconSoc
  alias Currencies.IconSouthKoreanWon
  alias Currencies.IconSwedishKrona
  alias Currencies.IconSwissFranc
  alias Currencies.IconThaiBaht
  alias Currencies.IconTron
  alias Currencies.IconTurkishLira
  alias Currencies.IconUsaDollar

  def mount(params, _session, socket) do
    {:ok,
     assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def render(assigns) do
    ~F"""

    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconAustralianDollar font_size="10rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconAustralianDollar font_size="10rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconBitcoin font_size="10rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconBitcoin font_size="10rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconBrazilianReal font_size="10rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconBrazilianReal font_size="10rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconCanadianDollar font_size="10rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconCanadianDollar font_size="10rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconCardano font_size="10rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconCardano font_size="10rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconChilieanPeso font_size="10rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconChilieanPeso font_size="10rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconChineseYuan font_size="10rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconChineseYuan font_size="10rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconDanishKrone font_size="10rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconDanishKrone font_size="10rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconDogecoin font_size="10rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconDogecoin font_size="10rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconEthereum font_size="10rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconEthereum font_size="10rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconEuro font_size="10rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconEuro font_size="10rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconGbPoundSterling font_size="10rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconGbPoundSterling font_size="10rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconHongKongDollar font_size="10rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconHongKongDollar font_size="10rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconIcelandicKrona font_size="10rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconIcelandicKrona font_size="10rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconIndianRupee font_size="10rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconIndianRupee font_size="10rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconJapaneseYen font_size="10rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconJapaneseYen font_size="10rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconLitecoin font_size="10rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconLitecoin font_size="10rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconNewTaiwanDollar font_size="10rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconNewTaiwanDollar font_size="10rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconNewZealandDollar font_size="10rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconNewZealandDollar font_size="10rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconPolandZloty font_size="10rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconPolandZloty font_size="10rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconRipple font_size="10rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconRipple font_size="10rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconRussianRuble font_size="10rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconRussianRuble font_size="10rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconSingaporeDollar font_size="10rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconSingaporeDollar font_size="10rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconSoc font_size="10rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconSoc font_size="10rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconSouthKoreanWon font_size="10rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconSouthKoreanWon font_size="10rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconSwedishKrona font_size="10rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconSwedishKrona font_size="10rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconSwissFranc font_size="10rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconSwissFranc font_size="10rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconThaiBaht font_size="10rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconThaiBaht font_size="10rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconTron font_size="10rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconTron font_size="10rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconTurkishLira font_size="10rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconTurkishLira font_size="10rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconUsaDollar font_size="10rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconUsaDollar font_size="10rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>

    """
  end
end
