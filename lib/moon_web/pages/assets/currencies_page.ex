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
    <ExampleAndCode id="currency_1" class="mt-4">
      <:example>
        <IconAustralianDollar font_size="10rem" />
      </:example>

      <:code>
        <#CodePreview>
        <IconAustralianDollar font_size="10rem" />
        </#CodePreview>
      </:code>
    </ExampleAndCode>

    <ExampleAndCode id="currency_2" class="mt-4">
      <:example>
        <IconBitcoin font_size="10rem" />
      </:example>

      <:code>
        <#CodePreview>
        <IconBitcoin font_size="10rem" />
        </#CodePreview>
      </:code>
    </ExampleAndCode>

    <ExampleAndCode id="currency_3" class="mt-4">
      <:example>
        <IconBrazilianReal font_size="10rem" />
      </:example>

      <:code>
        <#CodePreview>
        <IconBrazilianReal font_size="10rem" />
        </#CodePreview>
      </:code>
    </ExampleAndCode>

    <ExampleAndCode id="currency_4" class="mt-4">
      <:example>
        <IconCanadianDollar font_size="10rem" />
      </:example>

      <:code>
        <#CodePreview>
        <IconCanadianDollar font_size="10rem" />
        </#CodePreview>
      </:code>
    </ExampleAndCode>

    <ExampleAndCode id="currency_5" class="mt-4">
      <:example>
        <IconCardano font_size="10rem" />
      </:example>

      <:code>
        <#CodePreview>
        <IconCardano font_size="10rem" />
        </#CodePreview>
      </:code>
    </ExampleAndCode>

    <ExampleAndCode id="currency_6" class="mt-4">
      <:example>
        <IconChilieanPeso font_size="10rem" />
      </:example>

      <:code>
        <#CodePreview>
        <IconChilieanPeso font_size="10rem" />
        </#CodePreview>
      </:code>
    </ExampleAndCode>

    <ExampleAndCode id="currency_7" class="mt-4">
      <:example>
        <IconChineseYuan font_size="10rem" />
      </:example>

      <:code>
        <#CodePreview>
        <IconChineseYuan font_size="10rem" />
        </#CodePreview>
      </:code>
    </ExampleAndCode>

    <ExampleAndCode id="currency_8" class="mt-4">
      <:example>
        <IconDanishKrone font_size="10rem" />
      </:example>

      <:code>
        <#CodePreview>
        <IconDanishKrone font_size="10rem" />
        </#CodePreview>
      </:code>
    </ExampleAndCode>

    <ExampleAndCode id="currency_9" class="mt-4">
      <:example>
        <IconDogecoin font_size="10rem" />
      </:example>

      <:code>
        <#CodePreview>
        <IconDogecoin font_size="10rem" />
        </#CodePreview>
      </:code>
    </ExampleAndCode>

    <ExampleAndCode id="currency_10" class="mt-4">
      <:example>
        <IconEthereum font_size="10rem" />
      </:example>

      <:code>
        <#CodePreview>
        <IconEthereum font_size="10rem" />
        </#CodePreview>
      </:code>
    </ExampleAndCode>

    <ExampleAndCode id="currency_11" class="mt-4">
      <:example>
        <IconEuro font_size="10rem" />
      </:example>

      <:code>
        <#CodePreview>
        <IconEuro font_size="10rem" />
        </#CodePreview>
      </:code>
    </ExampleAndCode>

    <ExampleAndCode id="currency_12" class="mt-4">
      <:example>
        <IconGbPoundSterling font_size="10rem" />
      </:example>

      <:code>
        <#CodePreview>
        <IconGbPoundSterling font_size="10rem" />
        </#CodePreview>
      </:code>
    </ExampleAndCode>

    <ExampleAndCode id="currency_13" class="mt-4">
      <:example>
        <IconHongKongDollar font_size="10rem" />
      </:example>

      <:code>
        <#CodePreview>
        <IconHongKongDollar font_size="10rem" />
        </#CodePreview>
      </:code>
    </ExampleAndCode>

    <ExampleAndCode id="currency_14" class="mt-4">
      <:example>
        <IconIcelandicKrona font_size="10rem" />
      </:example>

      <:code>
        <#CodePreview>
        <IconIcelandicKrona font_size="10rem" />
        </#CodePreview>
      </:code>
    </ExampleAndCode>

    <ExampleAndCode id="currency_15" class="mt-4">
      <:example>
        <IconIndianRupee font_size="10rem" />
      </:example>

      <:code>
        <#CodePreview>
        <IconIndianRupee font_size="10rem" />
        </#CodePreview>
      </:code>
    </ExampleAndCode>

    <ExampleAndCode id="currency_16" class="mt-4">
      <:example>
        <IconJapaneseYen font_size="10rem" />
      </:example>

      <:code>
        <#CodePreview>
        <IconJapaneseYen font_size="10rem" />
        </#CodePreview>
      </:code>
    </ExampleAndCode>

    <ExampleAndCode id="currency_17" class="mt-4">
      <:example>
        <IconLitecoin font_size="10rem" />
      </:example>

      <:code>
        <#CodePreview>
        <IconLitecoin font_size="10rem" />
        </#CodePreview>
      </:code>
    </ExampleAndCode>

    <ExampleAndCode id="currency_18" class="mt-4">
      <:example>
        <IconNewTaiwanDollar font_size="10rem" />
      </:example>

      <:code>
        <#CodePreview>
        <IconNewTaiwanDollar font_size="10rem" />
        </#CodePreview>
      </:code>
    </ExampleAndCode>

    <ExampleAndCode id="currency_19" class="mt-4">
      <:example>
        <IconNewZealandDollar font_size="10rem" />
      </:example>

      <:code>
        <#CodePreview>
        <IconNewZealandDollar font_size="10rem" />
        </#CodePreview>
      </:code>
    </ExampleAndCode>

    <ExampleAndCode id="currency_20" class="mt-4">
      <:example>
        <IconPolandZloty font_size="10rem" />
      </:example>

      <:code>
        <#CodePreview>
        <IconPolandZloty font_size="10rem" />
        </#CodePreview>
      </:code>
    </ExampleAndCode>

    <ExampleAndCode id="currency_21" class="mt-4">
      <:example>
        <IconRipple font_size="10rem" />
      </:example>

      <:code>
        <#CodePreview>
        <IconRipple font_size="10rem" />
        </#CodePreview>
      </:code>
    </ExampleAndCode>

    <ExampleAndCode id="currency_22" class="mt-4">
      <:example>
        <IconRussianRuble font_size="10rem" />
      </:example>

      <:code>
        <#CodePreview>
        <IconRussianRuble font_size="10rem" />
        </#CodePreview>
      </:code>
    </ExampleAndCode>

    <ExampleAndCode id="currency_23" class="mt-4">
      <:example>
        <IconSingaporeDollar font_size="10rem" />
      </:example>

      <:code>
        <#CodePreview>
        <IconSingaporeDollar font_size="10rem" />
        </#CodePreview>
      </:code>
    </ExampleAndCode>

    <ExampleAndCode id="currency_24" class="mt-4">
      <:example>
        <IconSoc font_size="10rem" />
      </:example>

      <:code>
        <#CodePreview>
        <IconSoc font_size="10rem" />
        </#CodePreview>
      </:code>
    </ExampleAndCode>

    <ExampleAndCode id="currency_25" class="mt-4">
      <:example>
        <IconSouthKoreanWon font_size="10rem" />
      </:example>

      <:code>
        <#CodePreview>
        <IconSouthKoreanWon font_size="10rem" />
        </#CodePreview>
      </:code>
    </ExampleAndCode>

    <ExampleAndCode id="currency_26" class="mt-4">
      <:example>
        <IconSwedishKrona font_size="10rem" />
      </:example>

      <:code>
        <#CodePreview>
        <IconSwedishKrona font_size="10rem" />
        </#CodePreview>
      </:code>
    </ExampleAndCode>

    <ExampleAndCode id="currency_27" class="mt-4">
      <:example>
        <IconSwissFranc font_size="10rem" />
      </:example>

      <:code>
        <#CodePreview>
        <IconSwissFranc font_size="10rem" />
        </#CodePreview>
      </:code>
    </ExampleAndCode>

    <ExampleAndCode id="currency_28" class="mt-4">
      <:example>
        <IconThaiBaht font_size="10rem" />
      </:example>

      <:code>
        <#CodePreview>
        <IconThaiBaht font_size="10rem" />
        </#CodePreview>
      </:code>
    </ExampleAndCode>

    <ExampleAndCode id="currency_29" class="mt-4">
      <:example>
        <IconTron font_size="10rem" />
      </:example>

      <:code>
        <#CodePreview>
        <IconTron font_size="10rem" />
        </#CodePreview>
      </:code>
    </ExampleAndCode>

    <ExampleAndCode id="currency_30" class="mt-4">
      <:example>
        <IconTurkishLira font_size="10rem" />
      </:example>

      <:code>
        <#CodePreview>
        <IconTurkishLira font_size="10rem" />
        </#CodePreview>
      </:code>
    </ExampleAndCode>

    <ExampleAndCode id="currency_31" class="mt-4">
      <:example>
        <IconUsaDollar font_size="10rem" />
      </:example>

      <:code>
        <#CodePreview>
        <IconUsaDollar font_size="10rem" />
        </#CodePreview>
      </:code>
    </ExampleAndCode>
    """
  end
end
