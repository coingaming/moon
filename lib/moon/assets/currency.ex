defmodule Moon.Assets.Currency do
  use Moon.StatelessComponent
  alias Moon.Assets.Currencies

  prop(name, :string)

  prop(color, :string, values: Moon.colors())
  prop(height, :string)
  prop(width, :string)
  prop(font_size, :string)
  prop(vertical_align, :string)
  prop(class, :string)

  @assets_map %{
    icon_australian_dollar: Currencies.IconAustralianDollar,
    icon_bitcoin: Currencies.IconBitcoin,
    icon_brazilian_real: Currencies.IconBrazilianReal,
    icon_canadian_dollar: Currencies.IconCanadianDollar,
    icon_cardano: Currencies.IconCardano,
    icon_chiliean_peso: Currencies.IconChilieanPeso,
    icon_chinese_yuan: Currencies.IconChineseYuan,
    icon_danish_krone: Currencies.IconDanishKrone,
    icon_ethereum: Currencies.IconEthereum,
    icon_euro: Currencies.IconEuro,
    icon_gb_pound_sterling: Currencies.IconGbPoundSterling,
    icon_hong_kong_dollar: Currencies.IconHongKongDollar,
    icon_icelandic_krona: Currencies.IconIcelandicKrona,
    icon_indian_rupee: Currencies.IconIndianRupee,
    icon_japanese_yen: Currencies.IconJapaneseYen,
    icon_litecoin: Currencies.IconLitecoin,
    icon_new_taiwan_dollar: Currencies.IconNewTaiwanDollar,
    icon_new_zealand_dollar: Currencies.IconNewZealandDollar,
    icon_poland_zloty: Currencies.IconPolandZloty,
    icon_ripple: Currencies.IconRipple,
    icon_russian_ruble: Currencies.IconRussianRuble,
    icon_singapore_dollar: Currencies.IconSingaporeDollar,
    icon_soc: Currencies.IconSoc,
    icon_south_korean_won: Currencies.IconSouthKoreanWon,
    icon_swedish_krona: Currencies.IconSwedishKrona,
    icon_swiss_franc: Currencies.IconSwissFranc,
    icon_thai_baht: Currencies.IconThaiBaht,
    icon_tron: Currencies.IconTron,
    icon_turkish_lira: Currencies.IconTurkishLira,
    icon_usa_dollar: Currencies.IconUsaDollar
  }
  def icon_name_to_module(icon_name) do
    @assets_map[:"#{icon_name}"]
  end

  def render(assigns) do
    ~H"""
    {{ @name && icon_name_to_module(@name) && live_component(@socket, icon_name_to_module(@name), color: @color, height: @height, width: @width, font_size: @font_size, vertical_align: @vertical_align, class: @class) }}
    """
  end
end
