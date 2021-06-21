defmodule MoonWeb.Pages.Assets.IconsPage do
  use MoonWeb, :live_view

  alias MoonWeb.Components.ExampleAndCode
  alias Moon.Components.CodePreview

  alias Moon.Assets.Icons
  alias Icons.IconAbout
  alias Icons.IconAdd
  alias Icons.IconAlertCircle
  alias Icons.IconAlignLeft
  alias Icons.IconAllSports
  alias Icons.IconArrowDiagonalDownLeft
  alias Icons.IconArrowDiagonalUpRight
  alias Icons.IconArrowDiagonals
  alias Icons.IconArrowDown
  alias Icons.IconArrowLDown
  alias Icons.IconArrowLUp
  alias Icons.IconArrowLeftRight
  alias Icons.IconArrowLeft
  alias Icons.IconArrowRight
  alias Icons.IconArrowTopRight
  alias Icons.IconArrowUpDown
  alias Icons.IconArrowUp
  alias Icons.IconAsianView
  alias Icons.IconAttache
  alias Icons.IconAward
  alias Icons.IconBannerInfo
  alias Icons.IconBell
  alias Icons.IconBitcoinTalk
  alias Icons.IconBombayClub
  alias Icons.IconBurger
  alias Icons.IconCalendarEmpty
  alias Icons.IconCalendar
  alias Icons.IconCard
  alias Icons.IconCase
  alias Icons.IconCashOut
  alias Icons.IconCasinoBell
  alias Icons.IconCasino
  alias Icons.IconChartArea
  alias Icons.IconChartBar
  alias Icons.IconChartPies
  alias Icons.IconChartRound
  alias Icons.IconChartSegment
  alias Icons.IconChevronDownRounded
  alias Icons.IconChevronDown
  alias Icons.IconChevronLeftRounded
  alias Icons.IconChevronLeft
  alias Icons.IconChevronRightRounded
  alias Icons.IconChevronRight
  alias Icons.IconChevronUpDown
  alias Icons.IconChevronUpRounded
  alias Icons.IconChevronUp
  alias Icons.IconCircle
  alias Icons.IconClaps
  alias Icons.IconClock
  alias Icons.IconCloseRounded
  alias Icons.IconCloseSmall
  alias Icons.IconClose
  alias Icons.IconCode
  alias Icons.IconCollapse
  alias Icons.IconCopy
  alias Icons.IconCredit
  alias Icons.IconCrypto
  alias Icons.IconCurrencyAda
  alias Icons.IconCurrencyArs
  alias Icons.IconCurrencyBdt
  alias Icons.IconCurrencyBob
  alias Icons.IconCurrencyBrl
  alias Icons.IconCurrencyBtc
  alias Icons.IconCurrencyCad
  alias Icons.IconCurrencyClp
  alias Icons.IconCurrencyCny
  alias Icons.IconCurrencyCrc
  alias Icons.IconCurrencyEth
  alias Icons.IconCurrencyEur
  alias Icons.IconCurrencyGel
  alias Icons.IconCurrencyHkd
  alias Icons.IconCurrencyIdr
  alias Icons.IconCurrencyInr
  alias Icons.IconCurrencyIqd
  alias Icons.IconCurrencyJpy
  alias Icons.IconCurrencyKrw
  alias Icons.IconCurrencyLtc
  alias Icons.IconCurrencyMxn
  alias Icons.IconCurrencyMyr
  alias Icons.IconCurrencyPen
  alias Icons.IconCurrencyPkr
  alias Icons.IconCurrencyRub
  alias Icons.IconCurrencySoc
  alias Icons.IconCurrencyThb
  alias Icons.IconCurrencyTrx
  alias Icons.IconCurrencyTry
  alias Icons.IconCurrencyUah
  alias Icons.IconCurrencyUsd
  alias Icons.IconCurrencyUsdt
  alias Icons.IconCurrencyVes
  alias Icons.IconCurrencyVnd
  alias Icons.IconCurrencyXrp
  alias Icons.IconCursor
  alias Icons.IconData
  alias Icons.IconDelete
  alias Icons.IconDesktop
  alias Icons.IconDetails
  alias Icons.IconDouble
  alias Icons.IconDownload
  alias Icons.IconDuotoneArrows
  alias Icons.IconDuotoneChat
  alias Icons.IconDuotoneCoins
  alias Icons.IconDuotoneMail
  alias Icons.IconESportsCallOfDuty
  alias Icons.IconESportsCounterStrike
  alias Icons.IconESportsDota2
  alias Icons.IconESportsENba
  alias Icons.IconESportsESport
  alias Icons.IconESportsFootball
  alias Icons.IconESportsHearthstone
  alias Icons.IconESportsLeagueOfLegends
  alias Icons.IconESportsOverwatch
  alias Icons.IconESportsRainbow
  alias Icons.IconESportsRocketLeague
  alias Icons.IconESportsStarCraft
  alias Icons.IconEdit
  alias Icons.IconErrorCircle
  alias Icons.IconError
  alias Icons.IconExpand
  alias Icons.IconEyeClosed
  alias Icons.IconEye
  alias Icons.IconFacebook
  alias Icons.IconFilter
  alias Icons.IconForward
  alias Icons.IconFreebet
  alias Icons.IconFullScreen
  alias Icons.IconGamepad
  alias Icons.IconGeneralInfo
  alias Icons.IconGift
  alias Icons.IconGlasses
  alias Icons.IconGlobe
  alias Icons.IconGoogleAuth
  alias Icons.IconGoogle
  alias Icons.IconHamburger
  alias Icons.IconHelp
  alias Icons.IconHistory
  alias Icons.IconHome
  alias Icons.IconHub88
  alias Icons.IconHyperlink
  alias Icons.IconInPlay
  alias Icons.IconInfoCircle
  alias Icons.IconInfo
  alias Icons.IconInstagram
  alias Icons.IconLeftArrowCurveRight
  alias Icons.IconLifeRing
  alias Icons.IconLightbulb
  alias Icons.IconLimit
  alias Icons.IconLine
  alias Icons.IconLink
  alias Icons.IconListNumbered
  alias Icons.IconLiveCasino
  alias Icons.IconLiveChat
  alias Icons.IconLiveStream
  alias Icons.IconLock
  alias Icons.IconLogin
  alias Icons.IconLogoPlain
  alias Icons.IconLogout
  alias Icons.IconLoyalty0
  alias Icons.IconMail
  alias Icons.IconMenuHome
  alias Icons.IconMenu
  alias Icons.IconMinus
  alias Icons.IconMobile
  alias Icons.IconMoney
  alias Icons.IconMoneybag
  alias Icons.IconMoon
  alias Icons.IconMore
  alias Icons.IconNews
  alias Icons.IconNotificationUnread
  alias Icons.IconNotification
  alias Icons.IconPadlock
  alias Icons.IconPencil
  alias Icons.IconPhoto
  alias Icons.IconPicture
  alias Icons.IconPin
  alias Icons.IconPlay
  alias Icons.IconPlus
  alias Icons.IconPriceBoost
  alias Icons.IconPrint
  alias Icons.IconProfile
  alias Icons.IconPromotions
  alias Icons.IconRefresh
  alias Icons.IconReward
  alias Icons.IconRow
  alias Icons.IconSbShield
  alias Icons.IconSearch
  alias Icons.IconSettings
  alias Icons.IconShare
  alias Icons.IconSliders
  alias Icons.IconSlots
  alias Icons.IconSnackbarSuccess
  alias Icons.IconSportWidget
  alias Icons.IconSportsAfl
  alias Icons.IconSportsAmericanFootBall
  alias Icons.IconSportsBadminton
  alias Icons.IconSportsBaseBall
  alias Icons.IconSportsBasketBall
  alias Icons.IconSportsBiathlon
  alias Icons.IconSportsBoxing
  alias Icons.IconSportsCenter
  alias Icons.IconSportsCricket
  alias Icons.IconSportsCycling
  alias Icons.IconSportsDarts
  alias Icons.IconSportsESports
  alias Icons.IconSportsFantasy
  alias Icons.IconSportsFeatured
  alias Icons.IconSportsFootBall
  alias Icons.IconSportsGolf
  alias Icons.IconSportsGreyhound
  alias Icons.IconSportsHandBall
  alias Icons.IconSportsHarness
  alias Icons.IconSportsHorseRacing
  alias Icons.IconSportsHorse
  alias Icons.IconSportsIceHockey
  alias Icons.IconSportsMma
  alias Icons.IconSportsMotorSports
  alias Icons.IconSportsPoker
  alias Icons.IconSportsPolitics
  alias Icons.IconSportsPool
  alias Icons.IconSportsPopular
  alias Icons.IconSportsRugby
  alias Icons.IconSportsSki
  alias Icons.IconSportsSnooker
  alias Icons.IconSportsSpecial
  alias Icons.IconSportsSquash
  alias Icons.IconSportsTableTennis
  alias Icons.IconSportsTennis
  alias Icons.IconSportsVolleyBall
  alias Icons.IconSportsWaterPolo
  alias Icons.IconStarEmpty
  alias Icons.IconStarFilled
  alias Icons.IconStarFlag
  alias Icons.IconStars
  alias Icons.IconStats
  alias Icons.IconStopwatch
  alias Icons.IconSuccessCircle
  alias Icons.IconSun
  alias Icons.IconSupport
  alias Icons.IconTable
  alias Icons.IconTag
  alias Icons.IconTelegram
  alias Icons.IconText
  alias Icons.IconTimer
  alias Icons.IconTwitter
  alias Icons.IconUpload
  alias Icons.IconUser
  alias Icons.IconUsers
  alias Icons.IconVerify
  alias Icons.IconVirtualSports
  alias Icons.IconVkontakte
  alias Icons.IconVolatility
  alias Icons.IconWalletRounded
  alias Icons.IconWallet
  alias Icons.IconWand
  alias Icons.IconWarning
  alias Icons.IconWhatsapp
  alias Icons.IconYoutube
  alias Icons.IconZoom

  def mount(params, _session, socket) do
    {:ok,
     assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def render(assigns) do
    ~F"""

    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconAbout font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconAbout font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconAdd font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconAdd font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconAlertCircle font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconAlertCircle font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconAlignLeft font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconAlignLeft font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconAllSports font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconAllSports font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconArrowDiagonalDownLeft font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconArrowDiagonalDownLeft font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconArrowDiagonalUpRight font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconArrowDiagonalUpRight font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconArrowDiagonals font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconArrowDiagonals font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconArrowDown font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconArrowDown font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconArrowLDown font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconArrowLDown font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconArrowLUp font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconArrowLUp font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconArrowLeftRight font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconArrowLeftRight font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconArrowLeft font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconArrowLeft font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconArrowRight font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconArrowRight font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconArrowTopRight font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconArrowTopRight font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconArrowUpDown font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconArrowUpDown font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconArrowUp font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconArrowUp font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconAsianView font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconAsianView font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconAttache font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconAttache font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconAward font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconAward font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconBannerInfo font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconBannerInfo font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconBell font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconBell font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconBitcoinTalk font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconBitcoinTalk font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconBombayClub font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconBombayClub font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconBurger font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconBurger font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconCalendarEmpty font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconCalendarEmpty font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconCalendar font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconCalendar font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconCard font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconCard font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconCase font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconCase font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconCashOut font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconCashOut font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconCasinoBell font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconCasinoBell font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconCasino font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconCasino font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconChartArea font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconChartArea font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconChartBar font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconChartBar font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconChartPies font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconChartPies font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconChartRound font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconChartRound font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconChartSegment font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconChartSegment font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconChevronDownRounded font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconChevronDownRounded font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconChevronDown font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconChevronDown font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconChevronLeftRounded font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconChevronLeftRounded font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconChevronLeft font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconChevronLeft font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconChevronRightRounded font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconChevronRightRounded font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconChevronRight font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconChevronRight font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconChevronUpDown font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconChevronUpDown font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconChevronUpRounded font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconChevronUpRounded font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconChevronUp font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconChevronUp font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconCircle font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconCircle font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconClaps font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconClaps font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconClock font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconClock font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconCloseRounded font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconCloseRounded font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconCloseSmall font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconCloseSmall font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconClose font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconClose font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconCode font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconCode font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconCollapse font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconCollapse font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconCopy font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconCopy font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconCredit font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconCredit font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconCrypto font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconCrypto font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconCurrencyAda font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconCurrencyAda font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconCurrencyArs font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconCurrencyArs font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconCurrencyBdt font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconCurrencyBdt font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconCurrencyBob font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconCurrencyBob font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconCurrencyBrl font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconCurrencyBrl font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconCurrencyBtc font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconCurrencyBtc font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconCurrencyCad font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconCurrencyCad font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconCurrencyClp font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconCurrencyClp font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconCurrencyCny font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconCurrencyCny font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconCurrencyCrc font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconCurrencyCrc font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconCurrencyEth font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconCurrencyEth font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconCurrencyEur font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconCurrencyEur font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconCurrencyGel font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconCurrencyGel font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconCurrencyHkd font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconCurrencyHkd font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconCurrencyIdr font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconCurrencyIdr font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconCurrencyInr font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconCurrencyInr font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconCurrencyIqd font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconCurrencyIqd font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconCurrencyJpy font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconCurrencyJpy font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconCurrencyKrw font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconCurrencyKrw font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconCurrencyLtc font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconCurrencyLtc font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconCurrencyMxn font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconCurrencyMxn font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconCurrencyMyr font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconCurrencyMyr font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconCurrencyPen font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconCurrencyPen font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconCurrencyPkr font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconCurrencyPkr font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconCurrencyRub font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconCurrencyRub font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconCurrencySoc font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconCurrencySoc font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconCurrencyThb font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconCurrencyThb font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconCurrencyTrx font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconCurrencyTrx font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconCurrencyTry font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconCurrencyTry font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconCurrencyUah font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconCurrencyUah font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconCurrencyUsd font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconCurrencyUsd font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconCurrencyUsdt font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconCurrencyUsdt font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconCurrencyVes font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconCurrencyVes font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconCurrencyVnd font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconCurrencyVnd font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconCurrencyXrp font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconCurrencyXrp font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconCursor font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconCursor font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconData font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconData font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconDelete font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconDelete font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconDesktop font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconDesktop font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconDetails font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconDetails font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconDouble font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconDouble font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconDownload font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconDownload font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconDuotoneArrows font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconDuotoneArrows font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconDuotoneChat font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconDuotoneChat font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconDuotoneCoins font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconDuotoneCoins font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconDuotoneMail font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconDuotoneMail font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconESportsCallOfDuty font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconESportsCallOfDuty font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconESportsCounterStrike font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconESportsCounterStrike font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconESportsDota2 font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconESportsDota2 font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconESportsENba font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconESportsENba font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconESportsESport font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconESportsESport font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconESportsFootball font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconESportsFootball font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconESportsHearthstone font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconESportsHearthstone font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconESportsLeagueOfLegends font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconESportsLeagueOfLegends font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconESportsOverwatch font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconESportsOverwatch font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconESportsRainbow font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconESportsRainbow font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconESportsRocketLeague font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconESportsRocketLeague font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconESportsStarCraft font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconESportsStarCraft font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconEdit font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconEdit font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconErrorCircle font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconErrorCircle font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconError font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconError font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconExpand font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconExpand font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconEyeClosed font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconEyeClosed font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconEye font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconEye font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconFacebook font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconFacebook font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconFilter font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconFilter font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconForward font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconForward font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconFreebet font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconFreebet font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconFullScreen font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconFullScreen font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconGamepad font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconGamepad font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconGeneralInfo font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconGeneralInfo font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconGift font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconGift font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconGlasses font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconGlasses font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconGlobe font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconGlobe font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconGoogleAuth font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconGoogleAuth font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconGoogle font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconGoogle font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconHamburger font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconHamburger font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconHelp font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconHelp font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconHistory font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconHistory font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconHome font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconHome font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconHub88 font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconHub88 font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconHyperlink font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconHyperlink font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconInPlay font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconInPlay font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconInfoCircle font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconInfoCircle font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconInfo font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconInfo font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconInstagram font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconInstagram font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconLeftArrowCurveRight font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconLeftArrowCurveRight font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconLifeRing font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconLifeRing font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconLightbulb font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconLightbulb font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconLimit font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconLimit font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconLine font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconLine font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconLink font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconLink font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconListNumbered font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconListNumbered font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconLiveCasino font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconLiveCasino font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconLiveChat font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconLiveChat font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconLiveStream font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconLiveStream font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconLock font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconLock font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconLogin font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconLogin font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconLogoPlain font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconLogoPlain font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconLogout font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconLogout font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconLoyalty0 font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconLoyalty0 font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconMail font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconMail font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconMenuHome font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconMenuHome font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconMenu font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconMenu font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconMinus font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconMinus font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconMobile font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconMobile font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconMoney font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconMoney font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconMoneybag font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconMoneybag font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconMoon font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconMoon font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconMore font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconMore font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconNews font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconNews font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconNotificationUnread font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconNotificationUnread font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconNotification font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconNotification font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconPadlock font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconPadlock font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconPencil font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconPencil font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconPhoto font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconPhoto font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconPicture font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconPicture font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconPin font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconPin font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconPlay font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconPlay font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconPlus font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconPlus font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconPriceBoost font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconPriceBoost font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconPrint font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconPrint font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconProfile font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconProfile font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconPromotions font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconPromotions font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconRefresh font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconRefresh font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconReward font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconReward font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconRow font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconRow font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconSbShield font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconSbShield font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconSearch font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconSearch font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconSettings font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconSettings font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconShare font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconShare font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconSliders font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconSliders font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconSlots font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconSlots font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconSnackbarSuccess font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconSnackbarSuccess font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconSportWidget font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconSportWidget font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconSportsAfl font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconSportsAfl font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconSportsAmericanFootBall font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconSportsAmericanFootBall font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconSportsBadminton font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconSportsBadminton font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconSportsBaseBall font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconSportsBaseBall font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconSportsBasketBall font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconSportsBasketBall font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconSportsBiathlon font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconSportsBiathlon font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconSportsBoxing font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconSportsBoxing font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconSportsCenter font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconSportsCenter font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconSportsCricket font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconSportsCricket font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconSportsCycling font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconSportsCycling font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconSportsDarts font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconSportsDarts font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconSportsESports font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconSportsESports font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconSportsFantasy font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconSportsFantasy font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconSportsFeatured font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconSportsFeatured font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconSportsFootBall font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconSportsFootBall font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconSportsGolf font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconSportsGolf font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconSportsGreyhound font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconSportsGreyhound font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconSportsHandBall font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconSportsHandBall font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconSportsHarness font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconSportsHarness font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconSportsHorseRacing font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconSportsHorseRacing font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconSportsHorse font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconSportsHorse font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconSportsIceHockey font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconSportsIceHockey font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconSportsMma font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconSportsMma font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconSportsMotorSports font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconSportsMotorSports font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconSportsPoker font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconSportsPoker font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconSportsPolitics font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconSportsPolitics font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconSportsPool font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconSportsPool font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconSportsPopular font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconSportsPopular font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconSportsRugby font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconSportsRugby font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconSportsSki font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconSportsSki font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconSportsSnooker font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconSportsSnooker font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconSportsSpecial font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconSportsSpecial font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconSportsSquash font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconSportsSquash font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconSportsTableTennis font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconSportsTableTennis font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconSportsTennis font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconSportsTennis font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconSportsVolleyBall font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconSportsVolleyBall font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconSportsWaterPolo font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconSportsWaterPolo font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconStarEmpty font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconStarEmpty font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconStarFilled font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconStarFilled font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconStarFlag font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconStarFlag font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconStars font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconStars font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconStats font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconStats font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconStopwatch font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconStopwatch font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconSuccessCircle font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconSuccessCircle font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconSun font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconSun font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconSupport font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconSupport font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconTable font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconTable font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconTag font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconTag font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconTelegram font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconTelegram font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconText font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconText font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconTimer font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconTimer font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconTwitter font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconTwitter font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconUpload font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconUpload font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconUser font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconUser font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconUsers font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconUsers font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconVerify font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconVerify font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconVirtualSports font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconVirtualSports font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconVkontakte font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconVkontakte font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconVolatility font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconVolatility font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconWalletRounded font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconWalletRounded font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconWallet font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconWallet font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconWand font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconWand font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconWarning font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconWarning font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconWhatsapp font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconWhatsapp font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconYoutube font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconYoutube font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <#template slot="example">
        <IconZoom font_size="5rem" />
      </#template>

      <#template slot="code">
        <#CodePreview>
        <IconZoom font_size="5rem" />
        </#CodePreview>
      </#template>
    </ExampleAndCode>

    """
  end
end
