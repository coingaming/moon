defmodule MoonWeb.Pages.Assets.LogosPage do
  use MoonWeb, :live_view

  alias MoonWeb.Components.ExampleAndCode
  alias Moon.Components.CodePreview

  alias Moon.Assets.Logos
  alias Logos.LogoAposta10Full
  alias Logos.LogoAposta10Short
  alias Logos.LogoBitcasinoFull
  alias Logos.LogoBitcasinoShort
  alias Logos.LogoBombayFull
  alias Logos.LogoBombayShort
  alias Logos.LogoCommsFull
  alias Logos.LogoCommsShort
  alias Logos.LogoDrop
  alias Logos.LogoHub88Full
  alias Logos.LogoHub88Short
  alias Logos.LogoLabFull
  alias Logos.LogoLivecasinoFull
  alias Logos.LogoLuckyslotsFull
  alias Logos.LogoLuckyslotsShort
  alias Logos.LogoMissions
  alias Logos.LogoMoneyball
  alias Logos.LogoMoonDesignShort
  alias Logos.LogoMoonDesign
  alias Logos.LogoPoweredByHub88
  alias Logos.LogoSlotsFull
  alias Logos.LogoSlotsShort
  alias Logos.LogoSportsbetFull
  alias Logos.LogoSportsbetShort
  alias Logos.LogoSportsbetSponsor
  alias Logos.LogoSportsbet
  alias Logos.LogoUtorg
  alias Logos.MoonPay

  def mount(params, _session, socket) do
    {:ok,
     assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def render(assigns) do
    ~F"""

    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <LogoAposta10Full font_size="10rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <LogoAposta10Full font_size="10rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <LogoAposta10Short font_size="10rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <LogoAposta10Short font_size="10rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <LogoBitcasinoFull font_size="10rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <LogoBitcasinoFull font_size="10rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <LogoBitcasinoShort font_size="10rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <LogoBitcasinoShort font_size="10rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <LogoBombayFull font_size="10rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <LogoBombayFull font_size="10rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <LogoBombayShort font_size="10rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <LogoBombayShort font_size="10rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <LogoCommsFull font_size="10rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <LogoCommsFull font_size="10rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <LogoCommsShort font_size="10rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <LogoCommsShort font_size="10rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <LogoDrop font_size="10rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <LogoDrop font_size="10rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <LogoHub88Full font_size="10rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <LogoHub88Full font_size="10rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <LogoHub88Short font_size="10rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <LogoHub88Short font_size="10rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <LogoLabFull font_size="10rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <LogoLabFull font_size="10rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <LogoLivecasinoFull font_size="10rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <LogoLivecasinoFull font_size="10rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <LogoLuckyslotsFull font_size="10rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <LogoLuckyslotsFull font_size="10rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <LogoLuckyslotsShort font_size="10rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <LogoLuckyslotsShort font_size="10rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <LogoMissions font_size="10rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <LogoMissions font_size="10rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <LogoMoneyball font_size="10rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <LogoMoneyball font_size="10rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <LogoMoonDesignShort font_size="10rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <LogoMoonDesignShort font_size="10rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <LogoMoonDesign font_size="10rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <LogoMoonDesign font_size="10rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <LogoPoweredByHub88 font_size="10rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <LogoPoweredByHub88 font_size="10rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <LogoSlotsFull font_size="10rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <LogoSlotsFull font_size="10rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <LogoSlotsShort font_size="10rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <LogoSlotsShort font_size="10rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <LogoSportsbetFull font_size="10rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <LogoSportsbetFull font_size="10rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <LogoSportsbetShort font_size="10rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <LogoSportsbetShort font_size="10rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <LogoSportsbetSponsor font_size="10rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <LogoSportsbetSponsor font_size="10rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <LogoSportsbet font_size="10rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <LogoSportsbet font_size="10rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <LogoUtorg font_size="10rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <LogoUtorg font_size="10rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <MoonPay font_size="10rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <MoonPay font_size="10rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>

    """
  end
end
