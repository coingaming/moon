defmodule MoonWeb.Pages.Assets.IconsPage do
  use MoonWeb, :live_view

  alias MoonWeb.Components.ExampleAndCode
  alias Moon.Components.CodePreview
  alias Moon.Autolayouts.TopToDown
  alias MoonWeb.Components.Breadcrumbs

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
  alias Icons.IconStart
  alias Icons.IconStats
  alias Icons.IconStop
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

  data breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Assets"
      },
      %{
        to: "/assets/icons",
        name: "Icons"
      }
    ]

  def mount(params, _session, socket) do
    {:ok,
     assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def render(assigns) do
    ~F"""
    <TopToDown>
      <Breadcrumbs breadcrumbs={@breadcrumbs} class="mb-2" />
      <ExampleAndCode class="mt-4">
        <:example>
          <IconAbout font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconAbout font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconAdd font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconAdd font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconAlertCircle font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconAlertCircle font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconAlignLeft font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconAlignLeft font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconAllSports font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconAllSports font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconArrowDiagonalDownLeft font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconArrowDiagonalDownLeft font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconArrowDiagonalUpRight font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconArrowDiagonalUpRight font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconArrowDiagonals font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconArrowDiagonals font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconArrowDown font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconArrowDown font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconArrowLDown font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconArrowLDown font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconArrowLUp font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconArrowLUp font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconArrowLeftRight font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconArrowLeftRight font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconArrowLeft font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconArrowLeft font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconArrowRight font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconArrowRight font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconArrowTopRight font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconArrowTopRight font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconArrowUpDown font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconArrowUpDown font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconArrowUp font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconArrowUp font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconAsianView font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconAsianView font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconAttache font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconAttache font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconAward font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconAward font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconBannerInfo font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconBannerInfo font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconBell font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconBell font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconBitcoinTalk font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconBitcoinTalk font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconBombayClub font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconBombayClub font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconBurger font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconBurger font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconCalendarEmpty font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconCalendarEmpty font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconCalendar font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconCalendar font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconCard font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconCard font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconCase font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconCase font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconCashOut font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconCashOut font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconCasinoBell font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconCasinoBell font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconCasino font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconCasino font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconChartArea font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconChartArea font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconChartBar font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconChartBar font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconChartPies font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconChartPies font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconChartRound font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconChartRound font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconChartSegment font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconChartSegment font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconChevronDownRounded font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconChevronDownRounded font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconChevronDown font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconChevronDown font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconChevronLeftRounded font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconChevronLeftRounded font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconChevronLeft font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconChevronLeft font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconChevronRightRounded font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconChevronRightRounded font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconChevronRight font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconChevronRight font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconChevronUpDown font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconChevronUpDown font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconChevronUpRounded font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconChevronUpRounded font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconChevronUp font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconChevronUp font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconCircle font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconCircle font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconClaps font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconClaps font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconClock font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconClock font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconCloseRounded font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconCloseRounded font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconCloseSmall font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconCloseSmall font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconClose font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconClose font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconCode font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconCode font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconCollapse font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconCollapse font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconCopy font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconCopy font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconCredit font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconCredit font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconCrypto font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconCrypto font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconCurrencyAda font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconCurrencyAda font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconCurrencyArs font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconCurrencyArs font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconCurrencyBdt font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconCurrencyBdt font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconCurrencyBob font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconCurrencyBob font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconCurrencyBrl font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconCurrencyBrl font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconCurrencyBtc font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconCurrencyBtc font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconCurrencyCad font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconCurrencyCad font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconCurrencyClp font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconCurrencyClp font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconCurrencyCny font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconCurrencyCny font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconCurrencyCrc font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconCurrencyCrc font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconCurrencyEth font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconCurrencyEth font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconCurrencyEur font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconCurrencyEur font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconCurrencyGel font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconCurrencyGel font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconCurrencyHkd font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconCurrencyHkd font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconCurrencyIdr font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconCurrencyIdr font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconCurrencyInr font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconCurrencyInr font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconCurrencyIqd font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconCurrencyIqd font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconCurrencyJpy font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconCurrencyJpy font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconCurrencyKrw font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconCurrencyKrw font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconCurrencyLtc font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconCurrencyLtc font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconCurrencyMxn font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconCurrencyMxn font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconCurrencyMyr font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconCurrencyMyr font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconCurrencyPen font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconCurrencyPen font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconCurrencyPkr font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconCurrencyPkr font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconCurrencyRub font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconCurrencyRub font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconCurrencySoc font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconCurrencySoc font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconCurrencyThb font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconCurrencyThb font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconCurrencyTrx font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconCurrencyTrx font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconCurrencyTry font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconCurrencyTry font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconCurrencyUah font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconCurrencyUah font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconCurrencyUsd font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconCurrencyUsd font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconCurrencyUsdt font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconCurrencyUsdt font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconCurrencyVes font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconCurrencyVes font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconCurrencyVnd font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconCurrencyVnd font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconCurrencyXrp font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconCurrencyXrp font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconCursor font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconCursor font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconData font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconData font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconDelete font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconDelete font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconDesktop font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconDesktop font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconDetails font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconDetails font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconDouble font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconDouble font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconDownload font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconDownload font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconDuotoneArrows font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconDuotoneArrows font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconDuotoneChat font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconDuotoneChat font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconDuotoneCoins font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconDuotoneCoins font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconDuotoneMail font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconDuotoneMail font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconESportsCallOfDuty font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconESportsCallOfDuty font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconESportsCounterStrike font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconESportsCounterStrike font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconESportsDota2 font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconESportsDota2 font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconESportsENba font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconESportsENba font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconESportsESport font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconESportsESport font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconESportsFootball font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconESportsFootball font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconESportsHearthstone font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconESportsHearthstone font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconESportsLeagueOfLegends font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconESportsLeagueOfLegends font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconESportsOverwatch font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconESportsOverwatch font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconESportsRainbow font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconESportsRainbow font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconESportsRocketLeague font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconESportsRocketLeague font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconESportsStarCraft font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconESportsStarCraft font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconEdit font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconEdit font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconErrorCircle font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconErrorCircle font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconError font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconError font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconExpand font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconExpand font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconEyeClosed font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconEyeClosed font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconEye font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconEye font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconFacebook font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconFacebook font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconFilter font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconFilter font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconForward font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconForward font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconFreebet font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconFreebet font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconFullScreen font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconFullScreen font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconGamepad font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconGamepad font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconGeneralInfo font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconGeneralInfo font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconGift font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconGift font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconGlasses font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconGlasses font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconGlobe font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconGlobe font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconGoogleAuth font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconGoogleAuth font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconGoogle font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconGoogle font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconHamburger font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconHamburger font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconHelp font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconHelp font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconHistory font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconHistory font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconHome font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconHome font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconHub88 font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconHub88 font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconHyperlink font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconHyperlink font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconInPlay font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconInPlay font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconInfoCircle font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconInfoCircle font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconInfo font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconInfo font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconInstagram font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconInstagram font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconLeftArrowCurveRight font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconLeftArrowCurveRight font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconLifeRing font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconLifeRing font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconLightbulb font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconLightbulb font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconLimit font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconLimit font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconLine font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconLine font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconLink font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconLink font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconListNumbered font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconListNumbered font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconLiveCasino font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconLiveCasino font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconLiveChat font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconLiveChat font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconLiveStream font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconLiveStream font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconLock font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconLock font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconLogin font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconLogin font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconLogoPlain font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconLogoPlain font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconLogout font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconLogout font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconLoyalty0 font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconLoyalty0 font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconMail font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconMail font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconMenuHome font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconMenuHome font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconMenu font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconMenu font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconMinus font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconMinus font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconMobile font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconMobile font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconMoney font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconMoney font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconMoneybag font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconMoneybag font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconMoon font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconMoon font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconMore font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconMore font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconNews font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconNews font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconNotificationUnread font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconNotificationUnread font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconNotification font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconNotification font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconPadlock font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconPadlock font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconPencil font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconPencil font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconPhoto font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconPhoto font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconPicture font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconPicture font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconPin font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconPin font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconPlay font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconPlay font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconPlus font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconPlus font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconPriceBoost font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconPriceBoost font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconPrint font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconPrint font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconProfile font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconProfile font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconPromotions font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconPromotions font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconRefresh font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconRefresh font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconReward font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconReward font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconRow font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconRow font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconSbShield font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconSbShield font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconSearch font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconSearch font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconSettings font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconSettings font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconShare font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconShare font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconSliders font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconSliders font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconSlots font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconSlots font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconSnackbarSuccess font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconSnackbarSuccess font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconSportWidget font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconSportWidget font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconSportsAfl font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconSportsAfl font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconSportsAmericanFootBall font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconSportsAmericanFootBall font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconSportsBadminton font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconSportsBadminton font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconSportsBaseBall font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconSportsBaseBall font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconSportsBasketBall font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconSportsBasketBall font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconSportsBiathlon font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconSportsBiathlon font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconSportsBoxing font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconSportsBoxing font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconSportsCenter font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconSportsCenter font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconSportsCricket font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconSportsCricket font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconSportsCycling font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconSportsCycling font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconSportsDarts font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconSportsDarts font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconSportsESports font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconSportsESports font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconSportsFantasy font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconSportsFantasy font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconSportsFeatured font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconSportsFeatured font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconSportsFootBall font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconSportsFootBall font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconSportsGolf font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconSportsGolf font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconSportsGreyhound font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconSportsGreyhound font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconSportsHandBall font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconSportsHandBall font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconSportsHarness font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconSportsHarness font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconSportsHorseRacing font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconSportsHorseRacing font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconSportsHorse font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconSportsHorse font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconSportsIceHockey font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconSportsIceHockey font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconSportsMma font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconSportsMma font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconSportsMotorSports font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconSportsMotorSports font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconSportsPoker font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconSportsPoker font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconSportsPolitics font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconSportsPolitics font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconSportsPool font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconSportsPool font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconSportsPopular font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconSportsPopular font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconSportsRugby font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconSportsRugby font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconSportsSki font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconSportsSki font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconSportsSnooker font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconSportsSnooker font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconSportsSpecial font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconSportsSpecial font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconSportsSquash font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconSportsSquash font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconSportsTableTennis font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconSportsTableTennis font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconSportsTennis font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconSportsTennis font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconSportsVolleyBall font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconSportsVolleyBall font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconSportsWaterPolo font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconSportsWaterPolo font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconStarEmpty font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconStarEmpty font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconStarFilled font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconStarFilled font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconStarFlag font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconStarFlag font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconStars font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconStars font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconStart font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconStart font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconStats font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconStats font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconStop font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconStop font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconStopwatch font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconStopwatch font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconSuccessCircle font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconSuccessCircle font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconSun font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconSun font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconSupport font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconSupport font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconTable font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconTable font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconTag font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconTag font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconTelegram font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconTelegram font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconText font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconText font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconTimer font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconTimer font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconTwitter font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconTwitter font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconUpload font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconUpload font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconUser font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconUser font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconUsers font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconUsers font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconVerify font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconVerify font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconVirtualSports font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconVirtualSports font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconVkontakte font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconVkontakte font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconVolatility font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconVolatility font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconWalletRounded font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconWalletRounded font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconWallet font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconWallet font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconWand font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconWand font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconWarning font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconWarning font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconWhatsapp font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconWhatsapp font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconYoutube font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconYoutube font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <IconZoom font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
        <IconZoom font_size="5rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>
    </TopToDown>
    """
  end
end
