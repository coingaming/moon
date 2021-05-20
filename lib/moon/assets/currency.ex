defmodule Moon.Assets.Currency do
  use Moon.StatelessComponent
  alias Moon.Assets.Currencys

  prop name, :string

  prop color, :string, values: Moon.colors()
  prop height, :string
  prop width, :string
  prop font_size, :string
  prop vertical_align, :string
  prop click, :event
  prop class, :string

  @assets_map %{
    icon_australian_dollar: Currencys.IconAustralianDollar,
    icon_bitcoin: Currencys.IconBitcoin,
    icon_brazilian_real: Currencys.IconBrazilianReal,
    icon_canadian_dollar: Currencys.IconCanadianDollar,
    icon_cardano: Currencys.IconCardano,
    icon_chiliean_peso: Currencys.IconChilieanPeso,
    icon_chinese_yuan: Currencys.IconChineseYuan,
    icon_danish_krone: Currencys.IconDanishKrone,
    icon_ethereum: Currencys.IconEthereum,
    icon_euro: Currencys.IconEuro,
    icon_gb_pound_sterling: Currencys.IconGbPoundSterling,
    icon_hong_kong_dollar: Currencys.IconHongKongDollar,
    icon_icelandic_krona: Currencys.IconIcelandicKrona,
    icon_indian_rupee: Currencys.IconIndianRupee,
    icon_japanese_yen: Currencys.IconJapaneseYen,
    icon_litecoin: Currencys.IconLitecoin,
    icon_new_taiwan_dollar: Currencys.IconNewTaiwanDollar,
    icon_new_zealand_dollar: Currencys.IconNewZealandDollar,
    icon_poland_zloty: Currencys.IconPolandZloty,
    icon_ripple: Currencys.IconRipple,
    icon_russian_ruble: Currencys.IconRussianRuble,
    icon_singapore_dollar: Currencys.IconSingaporeDollar,
    icon_soc: Currencys.IconSoc,
    icon_south_korean_won: Currencys.IconSouthKoreanWon,
    icon_swedish_krona: Currencys.IconSwedishKrona,
    icon_swiss_franc: Currencys.IconSwissFranc,
    icon_thai_baht: Currencys.IconThaiBaht,
    icon_tron: Currencys.IconTron,
    icon_turkish_lira: Currencys.IconTurkishLira,
    icon_usa_dollar: Currencys.IconUsaDollar
  }
  def icon_name_to_module(icon_name) do
    @assets_map[:"#{icon_name}"]
  end

  def render(assigns) do
    ~H"""
    {{ @name && icon_name_to_module(@name) && live_component(@socket, icon_name_to_module(@name), color: @color, height: @height, width: @width, font_size: @font_size, vertical_align: @vertical_align, click: @click, class: @class) }}
    """
  end
end
