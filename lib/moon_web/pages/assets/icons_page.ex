defmodule MoonWeb.Pages.Assets.IconsPage do
  use MoonWeb, :live_view

  alias Moon.Assets.Icons
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
        to: "/assets/icons",
        name: "Icons"
      }
    ]

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
  alias Icons.IconCurrencyADA
  alias Icons.IconCurrencyARS
  alias Icons.IconCurrencyBDT
  alias Icons.IconCurrencyBOB
  alias Icons.IconCurrencyBRL
  alias Icons.IconCurrencyBTC
  alias Icons.IconCurrencyCAD
  alias Icons.IconCurrencyCLP
  alias Icons.IconCurrencyCNY
  alias Icons.IconCurrencyCRC
  alias Icons.IconCurrencyETH
  alias Icons.IconCurrencyEUR
  alias Icons.IconCurrencyGEL
  alias Icons.IconCurrencyHKD
  alias Icons.IconCurrencyIDR
  alias Icons.IconCurrencyINR
  alias Icons.IconCurrencyIQD
  alias Icons.IconCurrencyJPY
  alias Icons.IconCurrencyKRW
  alias Icons.IconCurrencyLTC
  alias Icons.IconCurrencyMXN
  alias Icons.IconCurrencyMYR
  alias Icons.IconCurrencyPEN
  alias Icons.IconCurrencyPKR
  alias Icons.IconCurrencyRUB
  alias Icons.IconCurrencySOC
  alias Icons.IconCurrencyTHB
  alias Icons.IconCurrencyTRX
  alias Icons.IconCurrencyTRY
  alias Icons.IconCurrencyUAH
  alias Icons.IconCurrencyUSD
  alias Icons.IconCurrencyUSDT
  alias Icons.IconCurrencyVES
  alias Icons.IconCurrencyVND
  alias Icons.IconCurrencyXRP
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
  alias Icons.IconExpand
  alias Icons.IconEyeClosed
  alias Icons.IconEye
  alias Icons.IconFacebook
  alias Icons.IconFilter
  alias Icons.IconForward
  alias Icons.IconFreebet
  alias Icons.IconFullScreen
  alias Icons.IconGamepad
  alias Icons.IconGift
  alias Icons.IconGlasses
  alias Icons.IconGlobe
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
  alias Icons.IconLiveChat
  alias Icons.IconLiveStream
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
  alias Icons.IconSportsHandBall
  alias Icons.IconSportsHorseRacing
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
  alias Icons.IconError
  alias Icons.IconGeneralInfo
  alias Icons.IconGoogleAuth
  alias Icons.IconLiveCasino
  alias Icons.IconLock
  alias Icons.IconSportsGreyhound
  alias Icons.IconSportsHarness
  alias Icons.IconSportsHorse
  alias Icons.IconVerify

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
        <Heading size={56} class="mb-4">Icons</Heading>

        <ExampleAndCode id="icon_1" class="mt-4">
          <:example>
            <IconAbout font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconAbout font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_2" class="mt-4">
          <:example>
            <IconAdd font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconAdd font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_3" class="mt-4">
          <:example>
            <IconAlertCircle font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconAlertCircle font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_4" class="mt-4">
          <:example>
            <IconAlignLeft font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconAlignLeft font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_5" class="mt-4">
          <:example>
            <IconAllSports font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconAllSports font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_6" class="mt-4">
          <:example>
            <IconArrowDiagonalDownLeft font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconArrowDiagonalDownLeft font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_7" class="mt-4">
          <:example>
            <IconArrowDiagonalUpRight font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconArrowDiagonalUpRight font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_8" class="mt-4">
          <:example>
            <IconArrowDiagonals font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconArrowDiagonals font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_9" class="mt-4">
          <:example>
            <IconArrowDown font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconArrowDown font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_10" class="mt-4">
          <:example>
            <IconArrowLDown font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconArrowLDown font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_11" class="mt-4">
          <:example>
            <IconArrowLUp font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconArrowLUp font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_12" class="mt-4">
          <:example>
            <IconArrowLeftRight font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconArrowLeftRight font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_13" class="mt-4">
          <:example>
            <IconArrowLeft font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconArrowLeft font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_14" class="mt-4">
          <:example>
            <IconArrowRight font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconArrowRight font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_15" class="mt-4">
          <:example>
            <IconArrowTopRight font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconArrowTopRight font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_16" class="mt-4">
          <:example>
            <IconArrowUpDown font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconArrowUpDown font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_17" class="mt-4">
          <:example>
            <IconArrowUp font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconArrowUp font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_18" class="mt-4">
          <:example>
            <IconAsianView font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconAsianView font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_19" class="mt-4">
          <:example>
            <IconAttache font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconAttache font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_20" class="mt-4">
          <:example>
            <IconAward font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconAward font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_21" class="mt-4">
          <:example>
            <IconBannerInfo font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconBannerInfo font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_22" class="mt-4">
          <:example>
            <IconBell font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconBell font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_23" class="mt-4">
          <:example>
            <IconBitcoinTalk font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconBitcoinTalk font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_24" class="mt-4">
          <:example>
            <IconBombayClub font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconBombayClub font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_25" class="mt-4">
          <:example>
            <IconBurger font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconBurger font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_26" class="mt-4">
          <:example>
            <IconCalendarEmpty font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconCalendarEmpty font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_27" class="mt-4">
          <:example>
            <IconCalendar font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconCalendar font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_28" class="mt-4">
          <:example>
            <IconCard font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconCard font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_29" class="mt-4">
          <:example>
            <IconCase font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconCase font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_30" class="mt-4">
          <:example>
            <IconCashOut font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconCashOut font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_31" class="mt-4">
          <:example>
            <IconCasinoBell font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconCasinoBell font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_32" class="mt-4">
          <:example>
            <IconCasino font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconCasino font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_33" class="mt-4">
          <:example>
            <IconChartArea font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconChartArea font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_34" class="mt-4">
          <:example>
            <IconChartBar font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconChartBar font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_35" class="mt-4">
          <:example>
            <IconChartPies font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconChartPies font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_36" class="mt-4">
          <:example>
            <IconChartRound font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconChartRound font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_37" class="mt-4">
          <:example>
            <IconChartSegment font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconChartSegment font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_38" class="mt-4">
          <:example>
            <IconChevronDownRounded font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconChevronDownRounded font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_39" class="mt-4">
          <:example>
            <IconChevronDown font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconChevronDown font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_40" class="mt-4">
          <:example>
            <IconChevronLeftRounded font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconChevronLeftRounded font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_41" class="mt-4">
          <:example>
            <IconChevronLeft font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconChevronLeft font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_42" class="mt-4">
          <:example>
            <IconChevronRightRounded font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconChevronRightRounded font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_43" class="mt-4">
          <:example>
            <IconChevronRight font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconChevronRight font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_44" class="mt-4">
          <:example>
            <IconChevronUpDown font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconChevronUpDown font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_45" class="mt-4">
          <:example>
            <IconChevronUpRounded font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconChevronUpRounded font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_46" class="mt-4">
          <:example>
            <IconChevronUp font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconChevronUp font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_47" class="mt-4">
          <:example>
            <IconCircle font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconCircle font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_48" class="mt-4">
          <:example>
            <IconClaps font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconClaps font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_49" class="mt-4">
          <:example>
            <IconClock font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconClock font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_50" class="mt-4">
          <:example>
            <IconCloseRounded font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconCloseRounded font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_51" class="mt-4">
          <:example>
            <IconCloseSmall font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconCloseSmall font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_52" class="mt-4">
          <:example>
            <IconClose font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconClose font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_53" class="mt-4">
          <:example>
            <IconCode font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconCode font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_54" class="mt-4">
          <:example>
            <IconCollapse font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconCollapse font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_55" class="mt-4">
          <:example>
            <IconCopy font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconCopy font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_56" class="mt-4">
          <:example>
            <IconCredit font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconCredit font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_57" class="mt-4">
          <:example>
            <IconCrypto font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconCrypto font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_58" class="mt-4">
          <:example>
            <IconCurrencyADA font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconCurrencyADA font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_59" class="mt-4">
          <:example>
            <IconCurrencyARS font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconCurrencyARS font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_60" class="mt-4">
          <:example>
            <IconCurrencyBDT font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconCurrencyBDT font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_61" class="mt-4">
          <:example>
            <IconCurrencyBOB font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconCurrencyBOB font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_62" class="mt-4">
          <:example>
            <IconCurrencyBRL font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconCurrencyBRL font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_63" class="mt-4">
          <:example>
            <IconCurrencyBTC font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconCurrencyBTC font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_64" class="mt-4">
          <:example>
            <IconCurrencyCAD font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconCurrencyCAD font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_65" class="mt-4">
          <:example>
            <IconCurrencyCLP font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconCurrencyCLP font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_66" class="mt-4">
          <:example>
            <IconCurrencyCNY font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconCurrencyCNY font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_67" class="mt-4">
          <:example>
            <IconCurrencyCRC font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconCurrencyCRC font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_68" class="mt-4">
          <:example>
            <IconCurrencyETH font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconCurrencyETH font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_69" class="mt-4">
          <:example>
            <IconCurrencyEUR font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconCurrencyEUR font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_70" class="mt-4">
          <:example>
            <IconCurrencyGEL font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconCurrencyGEL font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_71" class="mt-4">
          <:example>
            <IconCurrencyHKD font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconCurrencyHKD font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_72" class="mt-4">
          <:example>
            <IconCurrencyIDR font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconCurrencyIDR font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_73" class="mt-4">
          <:example>
            <IconCurrencyINR font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconCurrencyINR font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_74" class="mt-4">
          <:example>
            <IconCurrencyIQD font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconCurrencyIQD font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_75" class="mt-4">
          <:example>
            <IconCurrencyJPY font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconCurrencyJPY font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_76" class="mt-4">
          <:example>
            <IconCurrencyKRW font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconCurrencyKRW font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_77" class="mt-4">
          <:example>
            <IconCurrencyLTC font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconCurrencyLTC font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_78" class="mt-4">
          <:example>
            <IconCurrencyMXN font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconCurrencyMXN font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_79" class="mt-4">
          <:example>
            <IconCurrencyMYR font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconCurrencyMYR font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_80" class="mt-4">
          <:example>
            <IconCurrencyPEN font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconCurrencyPEN font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_81" class="mt-4">
          <:example>
            <IconCurrencyPKR font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconCurrencyPKR font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_82" class="mt-4">
          <:example>
            <IconCurrencyRUB font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconCurrencyRUB font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_83" class="mt-4">
          <:example>
            <IconCurrencySOC font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconCurrencySOC font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_84" class="mt-4">
          <:example>
            <IconCurrencyTHB font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconCurrencyTHB font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_85" class="mt-4">
          <:example>
            <IconCurrencyTRX font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconCurrencyTRX font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_86" class="mt-4">
          <:example>
            <IconCurrencyTRY font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconCurrencyTRY font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_87" class="mt-4">
          <:example>
            <IconCurrencyUAH font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconCurrencyUAH font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_88" class="mt-4">
          <:example>
            <IconCurrencyUSD font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconCurrencyUSD font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_89" class="mt-4">
          <:example>
            <IconCurrencyUSDT font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconCurrencyUSDT font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_90" class="mt-4">
          <:example>
            <IconCurrencyVES font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconCurrencyVES font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_91" class="mt-4">
          <:example>
            <IconCurrencyVND font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconCurrencyVND font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_92" class="mt-4">
          <:example>
            <IconCurrencyXRP font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconCurrencyXRP font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_93" class="mt-4">
          <:example>
            <IconCursor font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconCursor font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_94" class="mt-4">
          <:example>
            <IconData font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconData font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_95" class="mt-4">
          <:example>
            <IconDelete font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconDelete font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_96" class="mt-4">
          <:example>
            <IconDesktop font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconDesktop font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_97" class="mt-4">
          <:example>
            <IconDetails font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconDetails font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_98" class="mt-4">
          <:example>
            <IconDouble font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconDouble font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_99" class="mt-4">
          <:example>
            <IconDownload font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconDownload font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_100" class="mt-4">
          <:example>
            <IconDuotoneArrows font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconDuotoneArrows font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_101" class="mt-4">
          <:example>
            <IconDuotoneChat font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconDuotoneChat font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_102" class="mt-4">
          <:example>
            <IconDuotoneCoins font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconDuotoneCoins font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_103" class="mt-4">
          <:example>
            <IconDuotoneMail font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconDuotoneMail font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_104" class="mt-4">
          <:example>
            <IconESportsCallOfDuty font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconESportsCallOfDuty font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_105" class="mt-4">
          <:example>
            <IconESportsCounterStrike font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconESportsCounterStrike font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_106" class="mt-4">
          <:example>
            <IconESportsDota2 font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconESportsDota2 font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_107" class="mt-4">
          <:example>
            <IconESportsENba font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconESportsENba font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_108" class="mt-4">
          <:example>
            <IconESportsESport font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconESportsESport font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_109" class="mt-4">
          <:example>
            <IconESportsFootball font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconESportsFootball font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_110" class="mt-4">
          <:example>
            <IconESportsHearthstone font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconESportsHearthstone font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_111" class="mt-4">
          <:example>
            <IconESportsLeagueOfLegends font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconESportsLeagueOfLegends font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_112" class="mt-4">
          <:example>
            <IconESportsOverwatch font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconESportsOverwatch font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_113" class="mt-4">
          <:example>
            <IconESportsRainbow font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconESportsRainbow font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_114" class="mt-4">
          <:example>
            <IconESportsRocketLeague font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconESportsRocketLeague font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_115" class="mt-4">
          <:example>
            <IconESportsStarCraft font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconESportsStarCraft font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_116" class="mt-4">
          <:example>
            <IconEdit font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconEdit font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_117" class="mt-4">
          <:example>
            <IconErrorCircle font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconErrorCircle font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_118" class="mt-4">
          <:example>
            <IconExpand font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconExpand font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_119" class="mt-4">
          <:example>
            <IconEyeClosed font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconEyeClosed font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_120" class="mt-4">
          <:example>
            <IconEye font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconEye font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_121" class="mt-4">
          <:example>
            <IconFacebook font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconFacebook font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_122" class="mt-4">
          <:example>
            <IconFilter font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconFilter font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_123" class="mt-4">
          <:example>
            <IconForward font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconForward font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_124" class="mt-4">
          <:example>
            <IconFreebet font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconFreebet font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_125" class="mt-4">
          <:example>
            <IconFullScreen font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconFullScreen font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_126" class="mt-4">
          <:example>
            <IconGamepad font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconGamepad font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_127" class="mt-4">
          <:example>
            <IconGift font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconGift font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_128" class="mt-4">
          <:example>
            <IconGlasses font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconGlasses font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_129" class="mt-4">
          <:example>
            <IconGlobe font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconGlobe font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_130" class="mt-4">
          <:example>
            <IconGoogle font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconGoogle font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_131" class="mt-4">
          <:example>
            <IconHamburger font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconHamburger font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_132" class="mt-4">
          <:example>
            <IconHelp font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconHelp font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_133" class="mt-4">
          <:example>
            <IconHistory font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconHistory font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_134" class="mt-4">
          <:example>
            <IconHome font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconHome font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_135" class="mt-4">
          <:example>
            <IconHub88 font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconHub88 font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_136" class="mt-4">
          <:example>
            <IconHyperlink font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconHyperlink font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_137" class="mt-4">
          <:example>
            <IconInPlay font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconInPlay font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_138" class="mt-4">
          <:example>
            <IconInfoCircle font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconInfoCircle font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_139" class="mt-4">
          <:example>
            <IconInfo font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconInfo font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_140" class="mt-4">
          <:example>
            <IconInstagram font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconInstagram font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_141" class="mt-4">
          <:example>
            <IconLeftArrowCurveRight font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconLeftArrowCurveRight font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_142" class="mt-4">
          <:example>
            <IconLifeRing font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconLifeRing font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_143" class="mt-4">
          <:example>
            <IconLightbulb font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconLightbulb font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_144" class="mt-4">
          <:example>
            <IconLimit font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconLimit font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_145" class="mt-4">
          <:example>
            <IconLine font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconLine font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_146" class="mt-4">
          <:example>
            <IconLink font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconLink font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_147" class="mt-4">
          <:example>
            <IconListNumbered font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconListNumbered font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_148" class="mt-4">
          <:example>
            <IconLiveChat font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconLiveChat font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_149" class="mt-4">
          <:example>
            <IconLiveStream font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconLiveStream font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_150" class="mt-4">
          <:example>
            <IconLogin font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconLogin font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_151" class="mt-4">
          <:example>
            <IconLogoPlain font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconLogoPlain font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_152" class="mt-4">
          <:example>
            <IconLogout font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconLogout font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_153" class="mt-4">
          <:example>
            <IconLoyalty0 font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconLoyalty0 font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_154" class="mt-4">
          <:example>
            <IconMail font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconMail font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_155" class="mt-4">
          <:example>
            <IconMenuHome font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconMenuHome font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_156" class="mt-4">
          <:example>
            <IconMenu font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconMenu font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_157" class="mt-4">
          <:example>
            <IconMinus font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconMinus font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_158" class="mt-4">
          <:example>
            <IconMobile font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconMobile font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_159" class="mt-4">
          <:example>
            <IconMoney font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconMoney font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_160" class="mt-4">
          <:example>
            <IconMoneybag font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconMoneybag font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_161" class="mt-4">
          <:example>
            <IconMoon font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconMoon font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_162" class="mt-4">
          <:example>
            <IconMore font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconMore font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_163" class="mt-4">
          <:example>
            <IconNews font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconNews font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_164" class="mt-4">
          <:example>
            <IconNotificationUnread font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconNotificationUnread font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_165" class="mt-4">
          <:example>
            <IconNotification font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconNotification font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_166" class="mt-4">
          <:example>
            <IconPadlock font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconPadlock font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_167" class="mt-4">
          <:example>
            <IconPencil font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconPencil font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_168" class="mt-4">
          <:example>
            <IconPhoto font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconPhoto font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_169" class="mt-4">
          <:example>
            <IconPicture font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconPicture font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_170" class="mt-4">
          <:example>
            <IconPin font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconPin font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_171" class="mt-4">
          <:example>
            <IconPlay font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconPlay font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_172" class="mt-4">
          <:example>
            <IconPlus font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconPlus font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_173" class="mt-4">
          <:example>
            <IconPriceBoost font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconPriceBoost font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_174" class="mt-4">
          <:example>
            <IconPrint font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconPrint font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_175" class="mt-4">
          <:example>
            <IconProfile font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconProfile font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_176" class="mt-4">
          <:example>
            <IconPromotions font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconPromotions font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_177" class="mt-4">
          <:example>
            <IconRefresh font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconRefresh font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_178" class="mt-4">
          <:example>
            <IconReward font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconReward font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_179" class="mt-4">
          <:example>
            <IconRow font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconRow font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_180" class="mt-4">
          <:example>
            <IconSbShield font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconSbShield font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_181" class="mt-4">
          <:example>
            <IconSearch font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconSearch font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_182" class="mt-4">
          <:example>
            <IconSettings font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconSettings font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_183" class="mt-4">
          <:example>
            <IconShare font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconShare font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_184" class="mt-4">
          <:example>
            <IconSliders font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconSliders font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_185" class="mt-4">
          <:example>
            <IconSlots font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconSlots font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_186" class="mt-4">
          <:example>
            <IconSnackbarSuccess font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconSnackbarSuccess font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_187" class="mt-4">
          <:example>
            <IconSportWidget font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconSportWidget font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_188" class="mt-4">
          <:example>
            <IconSportsAfl font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconSportsAfl font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_189" class="mt-4">
          <:example>
            <IconSportsAmericanFootBall font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconSportsAmericanFootBall font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_190" class="mt-4">
          <:example>
            <IconSportsBadminton font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconSportsBadminton font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_191" class="mt-4">
          <:example>
            <IconSportsBaseBall font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconSportsBaseBall font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_192" class="mt-4">
          <:example>
            <IconSportsBasketBall font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconSportsBasketBall font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_193" class="mt-4">
          <:example>
            <IconSportsBiathlon font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconSportsBiathlon font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_194" class="mt-4">
          <:example>
            <IconSportsBoxing font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconSportsBoxing font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_195" class="mt-4">
          <:example>
            <IconSportsCenter font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconSportsCenter font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_196" class="mt-4">
          <:example>
            <IconSportsCricket font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconSportsCricket font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_197" class="mt-4">
          <:example>
            <IconSportsCycling font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconSportsCycling font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_198" class="mt-4">
          <:example>
            <IconSportsDarts font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconSportsDarts font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_199" class="mt-4">
          <:example>
            <IconSportsESports font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconSportsESports font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_200" class="mt-4">
          <:example>
            <IconSportsFantasy font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconSportsFantasy font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_201" class="mt-4">
          <:example>
            <IconSportsFeatured font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconSportsFeatured font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_202" class="mt-4">
          <:example>
            <IconSportsFootBall font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconSportsFootBall font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_203" class="mt-4">
          <:example>
            <IconSportsGolf font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconSportsGolf font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_204" class="mt-4">
          <:example>
            <IconSportsHandBall font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconSportsHandBall font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_205" class="mt-4">
          <:example>
            <IconSportsHorseRacing font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconSportsHorseRacing font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_206" class="mt-4">
          <:example>
            <IconSportsIceHockey font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconSportsIceHockey font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_207" class="mt-4">
          <:example>
            <IconSportsMma font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconSportsMma font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_208" class="mt-4">
          <:example>
            <IconSportsMotorSports font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconSportsMotorSports font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_209" class="mt-4">
          <:example>
            <IconSportsPoker font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconSportsPoker font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_210" class="mt-4">
          <:example>
            <IconSportsPolitics font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconSportsPolitics font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_211" class="mt-4">
          <:example>
            <IconSportsPool font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconSportsPool font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_212" class="mt-4">
          <:example>
            <IconSportsPopular font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconSportsPopular font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_213" class="mt-4">
          <:example>
            <IconSportsRugby font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconSportsRugby font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_214" class="mt-4">
          <:example>
            <IconSportsSki font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconSportsSki font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_215" class="mt-4">
          <:example>
            <IconSportsSnooker font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconSportsSnooker font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_216" class="mt-4">
          <:example>
            <IconSportsSpecial font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconSportsSpecial font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_217" class="mt-4">
          <:example>
            <IconSportsSquash font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconSportsSquash font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_218" class="mt-4">
          <:example>
            <IconSportsTableTennis font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconSportsTableTennis font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_219" class="mt-4">
          <:example>
            <IconSportsTennis font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconSportsTennis font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_220" class="mt-4">
          <:example>
            <IconSportsVolleyBall font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconSportsVolleyBall font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_221" class="mt-4">
          <:example>
            <IconSportsWaterPolo font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconSportsWaterPolo font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_222" class="mt-4">
          <:example>
            <IconStarEmpty font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconStarEmpty font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_223" class="mt-4">
          <:example>
            <IconStarFilled font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconStarFilled font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_224" class="mt-4">
          <:example>
            <IconStarFlag font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconStarFlag font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_225" class="mt-4">
          <:example>
            <IconStars font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconStars font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_226" class="mt-4">
          <:example>
            <IconStart font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconStart font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_227" class="mt-4">
          <:example>
            <IconStats font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconStats font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_228" class="mt-4">
          <:example>
            <IconStop font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconStop font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_229" class="mt-4">
          <:example>
            <IconStopwatch font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconStopwatch font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_230" class="mt-4">
          <:example>
            <IconSuccessCircle font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconSuccessCircle font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_231" class="mt-4">
          <:example>
            <IconSun font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconSun font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_232" class="mt-4">
          <:example>
            <IconSupport font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconSupport font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_233" class="mt-4">
          <:example>
            <IconTable font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconTable font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_234" class="mt-4">
          <:example>
            <IconTag font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconTag font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_235" class="mt-4">
          <:example>
            <IconTelegram font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconTelegram font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_236" class="mt-4">
          <:example>
            <IconText font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconText font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_237" class="mt-4">
          <:example>
            <IconTimer font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconTimer font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_238" class="mt-4">
          <:example>
            <IconTwitter font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconTwitter font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_239" class="mt-4">
          <:example>
            <IconUpload font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconUpload font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_240" class="mt-4">
          <:example>
            <IconUser font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconUser font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_241" class="mt-4">
          <:example>
            <IconUsers font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconUsers font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_242" class="mt-4">
          <:example>
            <IconVirtualSports font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconVirtualSports font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_243" class="mt-4">
          <:example>
            <IconVkontakte font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconVkontakte font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_244" class="mt-4">
          <:example>
            <IconVolatility font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconVolatility font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_245" class="mt-4">
          <:example>
            <IconWalletRounded font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconWalletRounded font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_246" class="mt-4">
          <:example>
            <IconWallet font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconWallet font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_247" class="mt-4">
          <:example>
            <IconWand font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconWand font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_248" class="mt-4">
          <:example>
            <IconWarning font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconWarning font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_249" class="mt-4">
          <:example>
            <IconWhatsapp font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconWhatsapp font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_250" class="mt-4">
          <:example>
            <IconYoutube font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconYoutube font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_251" class="mt-4">
          <:example>
            <IconZoom font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconZoom font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_252" class="mt-4">
          <:example>
            <IconError font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconError font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_253" class="mt-4">
          <:example>
            <IconGeneralInfo font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconGeneralInfo font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_254" class="mt-4">
          <:example>
            <IconGoogleAuth font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconGoogleAuth font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_255" class="mt-4">
          <:example>
            <IconLiveCasino font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconLiveCasino font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_256" class="mt-4">
          <:example>
            <IconLock font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconLock font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_257" class="mt-4">
          <:example>
            <IconSportsGreyhound font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconSportsGreyhound font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_258" class="mt-4">
          <:example>
            <IconSportsHarness font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconSportsHarness font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_259" class="mt-4">
          <:example>
            <IconSportsHorse font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconSportsHorse font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_260" class="mt-4">
          <:example>
            <IconVerify font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <IconVerify font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>
      </TopToDown>
    </Page>
    """
  end
end
