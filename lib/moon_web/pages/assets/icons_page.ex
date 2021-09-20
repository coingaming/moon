defmodule MoonWeb.Pages.Assets.IconsPage do
  use MoonWeb, :live_view

  alias MoonWeb.Components.Breadcrumbs
  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Heading
  alias MoonWeb.Components.ExampleAndCode
  alias Moon.Components.CodePreview
  alias Moon.Assets.Icons
  alias MoonWeb.Components.Footer

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
  alias Icons.IconArrowsBottomLeft
  alias Icons.IconArrowsBottomRight
  alias Icons.IconArrowsChevronDownDouble
  alias Icons.IconArrowsChevronLeftDouble
  alias Icons.IconArrowsChevronRightDouble
  alias Icons.IconArrowsChevronUpDouble
  alias Icons.IconArrowsDiagonalsBltr
  alias Icons.IconArrowsDiagonalsTlbr
  alias Icons.IconArrowsDown
  alias Icons.IconArrowsForward
  alias Icons.IconArrowsLeftCurved
  alias Icons.IconArrowsLeft
  alias Icons.IconArrowsRefresh
  alias Icons.IconArrowsReply
  alias Icons.IconArrowsRightCurved
  alias Icons.IconArrowsRight
  alias Icons.IconArrowsTopLeft
  alias Icons.IconArrowsTopRight
  alias Icons.IconArrowsTransfer
  alias Icons.IconArrowsUp
  alias Icons.IconArrowsUpdate
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
  alias Icons.IconChartBarAlternitive
  alias Icons.IconChartBarVertical
  alias Icons.IconChartBar
  alias Icons.IconChartDashboard
  alias Icons.IconChartFin
  alias Icons.IconChartLine
  alias Icons.IconChartPieChart
  alias Icons.IconChartPies
  alias Icons.IconChartRelation
  alias Icons.IconChartRound
  alias Icons.IconChartSegment
  alias Icons.IconChatChat
  alias Icons.IconChatCommentAdd
  alias Icons.IconChatCommentBubbleAlert
  alias Icons.IconChatCommentBubbleQuestionMark
  alias Icons.IconChatCommentBubble
  alias Icons.IconChatCommentRemove
  alias Icons.IconChatCommentText
  alias Icons.IconChatComment
  alias Icons.IconChatDoubleBubble
  alias Icons.IconChatStatsChat
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
  alias Icons.IconControlsChevronDownSmall
  alias Icons.IconControlsChevronDown
  alias Icons.IconControlsChevronLeftSmall
  alias Icons.IconControlsChevronLeft
  alias Icons.IconControlsChevronRightSmall
  alias Icons.IconControlsChevronRight
  alias Icons.IconControlsChevronUpSmall
  alias Icons.IconControlsChevronUp
  alias Icons.IconControlsClear
  alias Icons.IconControlsCloseSmall
  alias Icons.IconControlsClose
  alias Icons.IconControlsCollapse
  alias Icons.IconControlsDiagonalsInsight
  alias Icons.IconControlsDiagonalsOutsight
  alias Icons.IconControlsExpand
  alias Icons.IconControlsEyeCrossed
  alias Icons.IconControlsEye
  alias Icons.IconControlsMinus
  alias Icons.IconControlsPlus
  alias Icons.IconControlsVerticalDoubleChevron
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
  alias Icons.IconDevicesBluetooth
  alias Icons.IconDevicesJoystick
  alias Icons.IconDevicesKeyboard
  alias Icons.IconDevicesMac
  alias Icons.IconDevicesMacbookAndIphone
  alias Icons.IconDevicesMacbook
  alias Icons.IconDevicesMouse
  alias Icons.IconDevicesPhone
  alias Icons.IconDevicesSmartphone
  alias Icons.IconDevicesTvBox
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
  alias Icons.IconFilesAdd
  alias Icons.IconFilesCase
  alias Icons.IconFilesClipboardText
  alias Icons.IconFilesClipboard
  alias Icons.IconFilesCode
  alias Icons.IconFilesCopy
  alias Icons.IconFilesDelete
  alias Icons.IconFilesDraft
  alias Icons.IconFilesExport
  alias Icons.IconFilesExternalLink
  alias Icons.IconFilesFile
  alias Icons.IconFilesFolderClosed
  alias Icons.IconFilesFolderOpenAlternative
  alias Icons.IconFilesFolderOpen
  alias Icons.IconFilesFolderZip
  alias Icons.IconFilesGlasses
  alias Icons.IconFilesImport
  alias Icons.IconFilesMagazine
  alias Icons.IconFilesPrint
  alias Icons.IconFilesRemove
  alias Icons.IconFilesSave
  alias Icons.IconFilesScan
  alias Icons.IconFilesShare
  alias Icons.IconFilesSticker
  alias Icons.IconFilesStickers
  alias Icons.IconFilesTable
  alias Icons.IconFilesText
  alias Icons.IconFilter
  alias Icons.IconForward
  alias Icons.IconFreebet
  alias Icons.IconFullScreen
  alias Icons.IconGamepad
  alias Icons.IconGeneralInfo
  alias Icons.IconGenericAbout
  alias Icons.IconGenericAlarmRound
  alias Icons.IconGenericAlarm
  alias Icons.IconGenericAmountNumber
  alias Icons.IconGenericBet
  alias Icons.IconGenericBlock
  alias Icons.IconGenericBookmark
  alias Icons.IconGenericBrowser
  alias Icons.IconGenericBurgerRegular
  alias Icons.IconGenericBurgerZig
  alias Icons.IconGenericCheckAlternative
  alias Icons.IconGenericCheckRounded
  alias Icons.IconGenericClose
  alias Icons.IconGenericDelete
  alias Icons.IconGenericDislike
  alias Icons.IconGenericDownload
  alias Icons.IconGenericDragHandle
  alias Icons.IconGenericEdit
  alias Icons.IconGenericGlobe
  alias Icons.IconGenericHeart
  alias Icons.IconGenericHelp
  alias Icons.IconGenericHome
  alias Icons.IconGenericIdea
  alias Icons.IconGenericInfoAlternative
  alias Icons.IconGenericInfo
  alias Icons.IconGenericLike
  alias Icons.IconGenericLink
  alias Icons.IconGenericLogIn
  alias Icons.IconGenericLogOut
  alias Icons.IconGenericLoyalty
  alias Icons.IconGenericMention
  alias Icons.IconGenericMenu
  alias Icons.IconGenericMinus
  alias Icons.IconGenericMultiBet
  alias Icons.IconGenericNews
  alias Icons.IconGenericPicture
  alias Icons.IconGenericPlus
  alias Icons.IconGenericSearch
  alias Icons.IconGenericSettings
  alias Icons.IconGenericShareAndroid
  alias Icons.IconGenericShareIosBig
  alias Icons.IconGenericShareIos
  alias Icons.IconGenericStar
  alias Icons.IconGenericTag
  alias Icons.IconGenericTicket
  alias Icons.IconGenericUpload
  alias Icons.IconGenericUser
  alias Icons.IconGenericUsers
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
  alias Icons.IconMailBox
  alias Icons.IconMailEmailStats
  alias Icons.IconMailEnvelope
  alias Icons.IconMailFilterCrossed
  alias Icons.IconMailFilter
  alias Icons.IconMailFlag
  alias Icons.IconMailLink
  alias Icons.IconMailSend
  alias Icons.IconMail
  alias Icons.IconMapsCompas
  alias Icons.IconMapsLocation
  alias Icons.IconMapsMap
  alias Icons.IconMapsMarker
  alias Icons.IconMapsPanorama
  alias Icons.IconMapsPinAdd
  alias Icons.IconMapsPinLocation
  alias Icons.IconMapsPin
  alias Icons.IconMapsWorld
  alias Icons.IconMediaFastBack
  alias Icons.IconMediaFastForward
  alias Icons.IconMediaGif
  alias Icons.IconMediaHeadphones
  alias Icons.IconMediaMegaphone
  alias Icons.IconMediaMiceAlternative
  alias Icons.IconMediaMice
  alias Icons.IconMediaMonitor
  alias Icons.IconMediaMusic
  alias Icons.IconMediaNoVolume
  alias Icons.IconMediaPause
  alias Icons.IconMediaPhoto
  alias Icons.IconMediaPlay
  alias Icons.IconMediaSoundwave
  alias Icons.IconMediaStop
  alias Icons.IconMediaTunerAlternative
  alias Icons.IconMediaTuner
  alias Icons.IconMediaVideo
  alias Icons.IconMediaVolume
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
  alias Icons.IconNotificationsActivity
  alias Icons.IconNotificationsAddBell
  alias Icons.IconNotificationsAlert
  alias Icons.IconNotificationsApp
  alias Icons.IconNotificationsBellAlarm
  alias Icons.IconNotificationsBellCross
  alias Icons.IconNotificationsBellRingingAlternative
  alias Icons.IconNotificationsBellRinging
  alias Icons.IconNotificationsBell
  alias Icons.IconNotificationsError
  alias Icons.IconNotificationsNotifications
  alias Icons.IconNotificationsQuestionMark
  alias Icons.IconNotificationsSettings
  alias Icons.IconOtherFrame
  alias Icons.IconOtherId
  alias Icons.IconOtherLightning
  alias Icons.IconOtherMoon
  alias Icons.IconOtherOther
  alias Icons.IconOtherPlug
  alias Icons.IconOtherRewards
  alias Icons.IconOtherSad
  alias Icons.IconOtherSmile
  alias Icons.IconOtherSun
  alias Icons.IconOtherWater
  alias Icons.IconOther3DotsHorizontal
  alias Icons.IconOther3Dots
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
  alias Icons.IconSecurityKey
  alias Icons.IconSecurityLock
  alias Icons.IconSecurityMagnet
  alias Icons.IconSecurityShieldSecured
  alias Icons.IconSecurityShield
  alias Icons.IconSecurityUmbrella
  alias Icons.IconSecurityUnlock
  alias Icons.IconSecurityVerifiedFace
  alias Icons.IconSecurityVerified
  alias Icons.IconSettings
  alias Icons.IconShare
  alias Icons.IconShopBag
  alias Icons.IconShopBasket
  alias Icons.IconShopCard
  alias Icons.IconShopCart
  alias Icons.IconShopCryptoCoin
  alias Icons.IconShopCrypto
  alias Icons.IconShopWallet
  alias Icons.IconShopWirelessPay
  alias Icons.IconSliders
  alias Icons.IconSlots
  alias Icons.IconSnackbarSuccess
  alias Icons.IconSoftwareBug
  alias Icons.IconSoftwareCode
  alias Icons.IconSoftwareCursor
  alias Icons.IconSoftwareDashboard
  alias Icons.IconSoftwareData
  alias Icons.IconSoftwareDownload
  alias Icons.IconSoftwareHand
  alias Icons.IconSoftwareLogOut
  alias Icons.IconSoftwareLogin
  alias Icons.IconSoftwareNut
  alias Icons.IconSoftwarePlate
  alias Icons.IconSoftwarePuzzle
  alias Icons.IconSoftwareSettings
  alias Icons.IconSoftwareShutdown
  alias Icons.IconSoftwareSorting
  alias Icons.IconSoftwareWrench
  alias Icons.IconSportAmericanFootball
  alias Icons.IconSportBadminton
  alias Icons.IconSportBaseball
  alias Icons.IconSportBasketball
  alias Icons.IconSportBeachVolley
  alias Icons.IconSportBeachVolleyball
  alias Icons.IconSportBombay
  alias Icons.IconSportBoxing
  alias Icons.IconSportCSGO
  alias Icons.IconSportCasino
  alias Icons.IconSportCricket
  alias Icons.IconSportCrossCountry
  alias Icons.IconSportCycling
  alias Icons.IconSportDarts
  alias Icons.IconSportDota2
  alias Icons.IconSportEsportGeneric
  alias Icons.IconSportFeatured
  alias Icons.IconSportFieldHockey
  alias Icons.IconSportFloorball
  alias Icons.IconSportFutsal
  alias Icons.IconSportGolf
  alias Icons.IconSportGreyhound
  alias Icons.IconSportHandball
  alias Icons.IconSportHarness
  alias Icons.IconSportHorseRacing
  alias Icons.IconSportIceHockey
  alias Icons.IconSportLoL
  alias Icons.IconSportMMA
  alias Icons.IconSportMotor
  alias Icons.IconSportOverwatch
  alias Icons.IconSportRugby
  alias Icons.IconSportSetTennis
  alias Icons.IconSportSnooker
  alias Icons.IconSportSoccer
  alias Icons.IconSportSpecials
  alias Icons.IconSportSportsbet
  alias Icons.IconSportTableTennis
  alias Icons.IconSportTennis
  alias Icons.IconSportWaterpolo
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
  alias Icons.IconTextAncor
  alias Icons.IconTextAttach
  alias Icons.IconTextBold
  alias Icons.IconTextBulletsList
  alias Icons.IconTextCards
  alias Icons.IconTextCenter
  alias Icons.IconTextClearFormatting
  alias Icons.IconTextCut
  alias Icons.IconTextDescreaseIndent
  alias Icons.IconTextIncertLine
  alias Icons.IconTextIncreaseIndent
  alias Icons.IconTextItalic
  alias Icons.IconTextLeftAlign
  alias Icons.IconTextMarker
  alias Icons.IconTextMath
  alias Icons.IconTextNumbersList
  alias Icons.IconTextRightAlign
  alias Icons.IconTextSize
  alias Icons.IconTextStrikethrough
  alias Icons.IconTextStyle
  alias Icons.IconTextTableAlternative
  alias Icons.IconTextTable
  alias Icons.IconTextUnderline
  alias Icons.IconText
  alias Icons.IconTimeAlarm
  alias Icons.IconTimeCalendarAdd
  alias Icons.IconTimeCalendarAlternative
  alias Icons.IconTimeCalendarDate
  alias Icons.IconTimeCalendarRemove
  alias Icons.IconTimeCalendarSucsess
  alias Icons.IconTimeCalendar
  alias Icons.IconTimeClock
  alias Icons.IconTimeSandglass
  alias Icons.IconTimeStopwatchTimer
  alias Icons.IconTimeStopwatch
  alias Icons.IconTimeTime
  alias Icons.IconTimeWatch
  alias Icons.IconTimer
  alias Icons.IconTwitter
  alias Icons.IconTypeClosedHand
  alias Icons.IconTypeDefault
  alias Icons.IconTypeHandPointing
  alias Icons.IconTypeHelp
  alias Icons.IconTypeMove
  alias Icons.IconTypeNotAllowed
  alias Icons.IconTypeOpenedHand
  alias Icons.IconTypeText
  alias Icons.IconTypeZoomIn
  alias Icons.IconTypeZoomOut
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

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <TopToDown>
      <Breadcrumbs theme_name={@theme_name} breadcrumbs={@breadcrumbs} class="mb-2" />
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
          <IconArrowsBottomLeft font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconArrowsBottomLeft font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_19" class="mt-4">
        <:example>
          <IconArrowsBottomRight font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconArrowsBottomRight font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_20" class="mt-4">
        <:example>
          <IconArrowsChevronDownDouble font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconArrowsChevronDownDouble font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_21" class="mt-4">
        <:example>
          <IconArrowsChevronLeftDouble font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconArrowsChevronLeftDouble font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_22" class="mt-4">
        <:example>
          <IconArrowsChevronRightDouble font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconArrowsChevronRightDouble font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_23" class="mt-4">
        <:example>
          <IconArrowsChevronUpDouble font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconArrowsChevronUpDouble font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_24" class="mt-4">
        <:example>
          <IconArrowsDiagonalsBltr font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconArrowsDiagonalsBltr font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_25" class="mt-4">
        <:example>
          <IconArrowsDiagonalsTlbr font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconArrowsDiagonalsTlbr font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_26" class="mt-4">
        <:example>
          <IconArrowsDown font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconArrowsDown font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_27" class="mt-4">
        <:example>
          <IconArrowsForward font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconArrowsForward font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_28" class="mt-4">
        <:example>
          <IconArrowsLeftCurved font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconArrowsLeftCurved font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_29" class="mt-4">
        <:example>
          <IconArrowsLeft font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconArrowsLeft font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_30" class="mt-4">
        <:example>
          <IconArrowsRefresh font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconArrowsRefresh font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_31" class="mt-4">
        <:example>
          <IconArrowsReply font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconArrowsReply font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_32" class="mt-4">
        <:example>
          <IconArrowsRightCurved font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconArrowsRightCurved font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_33" class="mt-4">
        <:example>
          <IconArrowsRight font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconArrowsRight font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_34" class="mt-4">
        <:example>
          <IconArrowsTopLeft font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconArrowsTopLeft font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_35" class="mt-4">
        <:example>
          <IconArrowsTopRight font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconArrowsTopRight font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_36" class="mt-4">
        <:example>
          <IconArrowsTransfer font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconArrowsTransfer font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_37" class="mt-4">
        <:example>
          <IconArrowsUp font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconArrowsUp font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_38" class="mt-4">
        <:example>
          <IconArrowsUpdate font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconArrowsUpdate font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_39" class="mt-4">
        <:example>
          <IconAsianView font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconAsianView font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_40" class="mt-4">
        <:example>
          <IconAttache font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconAttache font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_41" class="mt-4">
        <:example>
          <IconAward font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconAward font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_42" class="mt-4">
        <:example>
          <IconBannerInfo font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconBannerInfo font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_43" class="mt-4">
        <:example>
          <IconBell font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconBell font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_44" class="mt-4">
        <:example>
          <IconBitcoinTalk font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconBitcoinTalk font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_45" class="mt-4">
        <:example>
          <IconBombayClub font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconBombayClub font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_46" class="mt-4">
        <:example>
          <IconBurger font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconBurger font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_47" class="mt-4">
        <:example>
          <IconCalendarEmpty font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCalendarEmpty font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_48" class="mt-4">
        <:example>
          <IconCalendar font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCalendar font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_49" class="mt-4">
        <:example>
          <IconCard font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCard font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_50" class="mt-4">
        <:example>
          <IconCase font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCase font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_51" class="mt-4">
        <:example>
          <IconCashOut font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCashOut font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_52" class="mt-4">
        <:example>
          <IconCasinoBell font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCasinoBell font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_53" class="mt-4">
        <:example>
          <IconCasino font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCasino font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_54" class="mt-4">
        <:example>
          <IconChartArea font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconChartArea font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_55" class="mt-4">
        <:example>
          <IconChartBarAlternitive font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconChartBarAlternitive font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_56" class="mt-4">
        <:example>
          <IconChartBarVertical font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconChartBarVertical font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_57" class="mt-4">
        <:example>
          <IconChartBar font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconChartBar font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_58" class="mt-4">
        <:example>
          <IconChartDashboard font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconChartDashboard font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_59" class="mt-4">
        <:example>
          <IconChartFin font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconChartFin font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_60" class="mt-4">
        <:example>
          <IconChartLine font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconChartLine font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_61" class="mt-4">
        <:example>
          <IconChartPieChart font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconChartPieChart font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_62" class="mt-4">
        <:example>
          <IconChartPies font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconChartPies font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_63" class="mt-4">
        <:example>
          <IconChartRelation font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconChartRelation font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_64" class="mt-4">
        <:example>
          <IconChartRound font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconChartRound font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_65" class="mt-4">
        <:example>
          <IconChartSegment font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconChartSegment font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_66" class="mt-4">
        <:example>
          <IconChatChat font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconChatChat font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_67" class="mt-4">
        <:example>
          <IconChatCommentAdd font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconChatCommentAdd font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_68" class="mt-4">
        <:example>
          <IconChatCommentBubbleAlert font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconChatCommentBubbleAlert font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_69" class="mt-4">
        <:example>
          <IconChatCommentBubbleQuestionMark font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconChatCommentBubbleQuestionMark font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_70" class="mt-4">
        <:example>
          <IconChatCommentBubble font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconChatCommentBubble font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_71" class="mt-4">
        <:example>
          <IconChatCommentRemove font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconChatCommentRemove font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_72" class="mt-4">
        <:example>
          <IconChatCommentText font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconChatCommentText font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_73" class="mt-4">
        <:example>
          <IconChatComment font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconChatComment font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_74" class="mt-4">
        <:example>
          <IconChatDoubleBubble font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconChatDoubleBubble font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_75" class="mt-4">
        <:example>
          <IconChatStatsChat font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconChatStatsChat font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_76" class="mt-4">
        <:example>
          <IconChevronDownRounded font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconChevronDownRounded font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_77" class="mt-4">
        <:example>
          <IconChevronDown font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconChevronDown font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_78" class="mt-4">
        <:example>
          <IconChevronLeftRounded font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconChevronLeftRounded font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_79" class="mt-4">
        <:example>
          <IconChevronLeft font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconChevronLeft font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_80" class="mt-4">
        <:example>
          <IconChevronRightRounded font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconChevronRightRounded font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_81" class="mt-4">
        <:example>
          <IconChevronRight font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconChevronRight font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_82" class="mt-4">
        <:example>
          <IconChevronUpDown font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconChevronUpDown font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_83" class="mt-4">
        <:example>
          <IconChevronUpRounded font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconChevronUpRounded font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_84" class="mt-4">
        <:example>
          <IconChevronUp font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconChevronUp font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_85" class="mt-4">
        <:example>
          <IconCircle font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCircle font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_86" class="mt-4">
        <:example>
          <IconClaps font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconClaps font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_87" class="mt-4">
        <:example>
          <IconClock font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconClock font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_88" class="mt-4">
        <:example>
          <IconCloseRounded font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCloseRounded font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_89" class="mt-4">
        <:example>
          <IconCloseSmall font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCloseSmall font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_90" class="mt-4">
        <:example>
          <IconClose font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconClose font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_91" class="mt-4">
        <:example>
          <IconCode font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCode font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_92" class="mt-4">
        <:example>
          <IconCollapse font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCollapse font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_93" class="mt-4">
        <:example>
          <IconControlsChevronDownSmall font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconControlsChevronDownSmall font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_94" class="mt-4">
        <:example>
          <IconControlsChevronDown font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconControlsChevronDown font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_95" class="mt-4">
        <:example>
          <IconControlsChevronLeftSmall font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconControlsChevronLeftSmall font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_96" class="mt-4">
        <:example>
          <IconControlsChevronLeft font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconControlsChevronLeft font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_97" class="mt-4">
        <:example>
          <IconControlsChevronRightSmall font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconControlsChevronRightSmall font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_98" class="mt-4">
        <:example>
          <IconControlsChevronRight font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconControlsChevronRight font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_99" class="mt-4">
        <:example>
          <IconControlsChevronUpSmall font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconControlsChevronUpSmall font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_100" class="mt-4">
        <:example>
          <IconControlsChevronUp font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconControlsChevronUp font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_101" class="mt-4">
        <:example>
          <IconControlsClear font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconControlsClear font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_102" class="mt-4">
        <:example>
          <IconControlsCloseSmall font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconControlsCloseSmall font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_103" class="mt-4">
        <:example>
          <IconControlsClose font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconControlsClose font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_104" class="mt-4">
        <:example>
          <IconControlsCollapse font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconControlsCollapse font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_105" class="mt-4">
        <:example>
          <IconControlsDiagonalsInsight font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconControlsDiagonalsInsight font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_106" class="mt-4">
        <:example>
          <IconControlsDiagonalsOutsight font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconControlsDiagonalsOutsight font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_107" class="mt-4">
        <:example>
          <IconControlsExpand font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconControlsExpand font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_108" class="mt-4">
        <:example>
          <IconControlsEyeCrossed font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconControlsEyeCrossed font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_109" class="mt-4">
        <:example>
          <IconControlsEye font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconControlsEye font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_110" class="mt-4">
        <:example>
          <IconControlsMinus font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconControlsMinus font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_111" class="mt-4">
        <:example>
          <IconControlsPlus font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconControlsPlus font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_112" class="mt-4">
        <:example>
          <IconControlsVerticalDoubleChevron font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconControlsVerticalDoubleChevron font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_113" class="mt-4">
        <:example>
          <IconCopy font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCopy font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_114" class="mt-4">
        <:example>
          <IconCredit font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCredit font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_115" class="mt-4">
        <:example>
          <IconCrypto font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCrypto font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_116" class="mt-4">
        <:example>
          <IconCurrencyAda font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyAda font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_117" class="mt-4">
        <:example>
          <IconCurrencyArs font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyArs font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_118" class="mt-4">
        <:example>
          <IconCurrencyBdt font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyBdt font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_119" class="mt-4">
        <:example>
          <IconCurrencyBob font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyBob font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_120" class="mt-4">
        <:example>
          <IconCurrencyBrl font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyBrl font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_121" class="mt-4">
        <:example>
          <IconCurrencyBtc font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyBtc font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_122" class="mt-4">
        <:example>
          <IconCurrencyCad font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyCad font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_123" class="mt-4">
        <:example>
          <IconCurrencyClp font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyClp font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_124" class="mt-4">
        <:example>
          <IconCurrencyCny font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyCny font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_125" class="mt-4">
        <:example>
          <IconCurrencyCrc font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyCrc font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_126" class="mt-4">
        <:example>
          <IconCurrencyEth font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyEth font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_127" class="mt-4">
        <:example>
          <IconCurrencyEur font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyEur font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_128" class="mt-4">
        <:example>
          <IconCurrencyGel font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyGel font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_129" class="mt-4">
        <:example>
          <IconCurrencyHkd font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyHkd font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_130" class="mt-4">
        <:example>
          <IconCurrencyIdr font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyIdr font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_131" class="mt-4">
        <:example>
          <IconCurrencyInr font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyInr font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_132" class="mt-4">
        <:example>
          <IconCurrencyIqd font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyIqd font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_133" class="mt-4">
        <:example>
          <IconCurrencyJpy font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyJpy font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_134" class="mt-4">
        <:example>
          <IconCurrencyKrw font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyKrw font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_135" class="mt-4">
        <:example>
          <IconCurrencyLtc font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyLtc font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_136" class="mt-4">
        <:example>
          <IconCurrencyMxn font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyMxn font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_137" class="mt-4">
        <:example>
          <IconCurrencyMyr font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyMyr font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_138" class="mt-4">
        <:example>
          <IconCurrencyPen font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyPen font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_139" class="mt-4">
        <:example>
          <IconCurrencyPkr font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyPkr font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_140" class="mt-4">
        <:example>
          <IconCurrencyRub font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyRub font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_141" class="mt-4">
        <:example>
          <IconCurrencySoc font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencySoc font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_142" class="mt-4">
        <:example>
          <IconCurrencyThb font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyThb font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_143" class="mt-4">
        <:example>
          <IconCurrencyTrx font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyTrx font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_144" class="mt-4">
        <:example>
          <IconCurrencyTry font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyTry font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_145" class="mt-4">
        <:example>
          <IconCurrencyUah font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyUah font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_146" class="mt-4">
        <:example>
          <IconCurrencyUsd font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyUsd font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_147" class="mt-4">
        <:example>
          <IconCurrencyUsdt font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyUsdt font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_148" class="mt-4">
        <:example>
          <IconCurrencyVes font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyVes font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_149" class="mt-4">
        <:example>
          <IconCurrencyVnd font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyVnd font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_150" class="mt-4">
        <:example>
          <IconCurrencyXrp font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyXrp font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_151" class="mt-4">
        <:example>
          <IconCursor font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCursor font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_152" class="mt-4">
        <:example>
          <IconData font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconData font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_153" class="mt-4">
        <:example>
          <IconDelete font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconDelete font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_154" class="mt-4">
        <:example>
          <IconDesktop font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconDesktop font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_155" class="mt-4">
        <:example>
          <IconDetails font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconDetails font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_156" class="mt-4">
        <:example>
          <IconDevicesBluetooth font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconDevicesBluetooth font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_157" class="mt-4">
        <:example>
          <IconDevicesJoystick font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconDevicesJoystick font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_158" class="mt-4">
        <:example>
          <IconDevicesKeyboard font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconDevicesKeyboard font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_159" class="mt-4">
        <:example>
          <IconDevicesMac font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconDevicesMac font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_160" class="mt-4">
        <:example>
          <IconDevicesMacbookAndIphone font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconDevicesMacbookAndIphone font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_161" class="mt-4">
        <:example>
          <IconDevicesMacbook font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconDevicesMacbook font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_162" class="mt-4">
        <:example>
          <IconDevicesMouse font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconDevicesMouse font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_163" class="mt-4">
        <:example>
          <IconDevicesPhone font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconDevicesPhone font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_164" class="mt-4">
        <:example>
          <IconDevicesSmartphone font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconDevicesSmartphone font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_165" class="mt-4">
        <:example>
          <IconDevicesTvBox font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconDevicesTvBox font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_166" class="mt-4">
        <:example>
          <IconDouble font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconDouble font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_167" class="mt-4">
        <:example>
          <IconDownload font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconDownload font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_168" class="mt-4">
        <:example>
          <IconDuotoneArrows font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconDuotoneArrows font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_169" class="mt-4">
        <:example>
          <IconDuotoneChat font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconDuotoneChat font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_170" class="mt-4">
        <:example>
          <IconDuotoneCoins font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconDuotoneCoins font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_171" class="mt-4">
        <:example>
          <IconDuotoneMail font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconDuotoneMail font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_172" class="mt-4">
        <:example>
          <IconESportsCallOfDuty font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconESportsCallOfDuty font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_173" class="mt-4">
        <:example>
          <IconESportsCounterStrike font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconESportsCounterStrike font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_174" class="mt-4">
        <:example>
          <IconESportsDota2 font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconESportsDota2 font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_175" class="mt-4">
        <:example>
          <IconESportsENba font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconESportsENba font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_176" class="mt-4">
        <:example>
          <IconESportsESport font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconESportsESport font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_177" class="mt-4">
        <:example>
          <IconESportsFootball font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconESportsFootball font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_178" class="mt-4">
        <:example>
          <IconESportsHearthstone font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconESportsHearthstone font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_179" class="mt-4">
        <:example>
          <IconESportsLeagueOfLegends font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconESportsLeagueOfLegends font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_180" class="mt-4">
        <:example>
          <IconESportsOverwatch font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconESportsOverwatch font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_181" class="mt-4">
        <:example>
          <IconESportsRainbow font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconESportsRainbow font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_182" class="mt-4">
        <:example>
          <IconESportsRocketLeague font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconESportsRocketLeague font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_183" class="mt-4">
        <:example>
          <IconESportsStarCraft font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconESportsStarCraft font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_184" class="mt-4">
        <:example>
          <IconEdit font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconEdit font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_185" class="mt-4">
        <:example>
          <IconErrorCircle font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconErrorCircle font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_186" class="mt-4">
        <:example>
          <IconError font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconError font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_187" class="mt-4">
        <:example>
          <IconExpand font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconExpand font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_188" class="mt-4">
        <:example>
          <IconEyeClosed font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconEyeClosed font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_189" class="mt-4">
        <:example>
          <IconEye font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconEye font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_190" class="mt-4">
        <:example>
          <IconFacebook font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconFacebook font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_191" class="mt-4">
        <:example>
          <IconFilesAdd font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconFilesAdd font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_192" class="mt-4">
        <:example>
          <IconFilesCase font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconFilesCase font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_193" class="mt-4">
        <:example>
          <IconFilesClipboardText font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconFilesClipboardText font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_194" class="mt-4">
        <:example>
          <IconFilesClipboard font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconFilesClipboard font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_195" class="mt-4">
        <:example>
          <IconFilesCode font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconFilesCode font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_196" class="mt-4">
        <:example>
          <IconFilesCopy font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconFilesCopy font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_197" class="mt-4">
        <:example>
          <IconFilesDelete font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconFilesDelete font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_198" class="mt-4">
        <:example>
          <IconFilesDraft font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconFilesDraft font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_199" class="mt-4">
        <:example>
          <IconFilesExport font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconFilesExport font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_200" class="mt-4">
        <:example>
          <IconFilesExternalLink font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconFilesExternalLink font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_201" class="mt-4">
        <:example>
          <IconFilesFile font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconFilesFile font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_202" class="mt-4">
        <:example>
          <IconFilesFolderClosed font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconFilesFolderClosed font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_203" class="mt-4">
        <:example>
          <IconFilesFolderOpenAlternative font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconFilesFolderOpenAlternative font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_204" class="mt-4">
        <:example>
          <IconFilesFolderOpen font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconFilesFolderOpen font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_205" class="mt-4">
        <:example>
          <IconFilesFolderZip font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconFilesFolderZip font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_206" class="mt-4">
        <:example>
          <IconFilesGlasses font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconFilesGlasses font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_207" class="mt-4">
        <:example>
          <IconFilesImport font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconFilesImport font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_208" class="mt-4">
        <:example>
          <IconFilesMagazine font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconFilesMagazine font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_209" class="mt-4">
        <:example>
          <IconFilesPrint font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconFilesPrint font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_210" class="mt-4">
        <:example>
          <IconFilesRemove font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconFilesRemove font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_211" class="mt-4">
        <:example>
          <IconFilesSave font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconFilesSave font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_212" class="mt-4">
        <:example>
          <IconFilesScan font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconFilesScan font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_213" class="mt-4">
        <:example>
          <IconFilesShare font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconFilesShare font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_214" class="mt-4">
        <:example>
          <IconFilesSticker font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconFilesSticker font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_215" class="mt-4">
        <:example>
          <IconFilesStickers font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconFilesStickers font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_216" class="mt-4">
        <:example>
          <IconFilesTable font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconFilesTable font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_217" class="mt-4">
        <:example>
          <IconFilesText font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconFilesText font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_218" class="mt-4">
        <:example>
          <IconFilter font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconFilter font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_219" class="mt-4">
        <:example>
          <IconForward font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconForward font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_220" class="mt-4">
        <:example>
          <IconFreebet font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconFreebet font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_221" class="mt-4">
        <:example>
          <IconFullScreen font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconFullScreen font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_222" class="mt-4">
        <:example>
          <IconGamepad font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGamepad font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_223" class="mt-4">
        <:example>
          <IconGeneralInfo font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGeneralInfo font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_224" class="mt-4">
        <:example>
          <IconGenericAbout font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGenericAbout font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_225" class="mt-4">
        <:example>
          <IconGenericAlarmRound font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGenericAlarmRound font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_226" class="mt-4">
        <:example>
          <IconGenericAlarm font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGenericAlarm font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_227" class="mt-4">
        <:example>
          <IconGenericAmountNumber font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGenericAmountNumber font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_228" class="mt-4">
        <:example>
          <IconGenericBet font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGenericBet font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_229" class="mt-4">
        <:example>
          <IconGenericBlock font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGenericBlock font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_230" class="mt-4">
        <:example>
          <IconGenericBookmark font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGenericBookmark font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_231" class="mt-4">
        <:example>
          <IconGenericBrowser font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGenericBrowser font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_232" class="mt-4">
        <:example>
          <IconGenericBurgerRegular font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGenericBurgerRegular font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_233" class="mt-4">
        <:example>
          <IconGenericBurgerZig font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGenericBurgerZig font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_234" class="mt-4">
        <:example>
          <IconGenericCheckAlternative font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGenericCheckAlternative font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_235" class="mt-4">
        <:example>
          <IconGenericCheckRounded font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGenericCheckRounded font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_236" class="mt-4">
        <:example>
          <IconGenericClose font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGenericClose font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_237" class="mt-4">
        <:example>
          <IconGenericDelete font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGenericDelete font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_238" class="mt-4">
        <:example>
          <IconGenericDislike font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGenericDislike font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_239" class="mt-4">
        <:example>
          <IconGenericDownload font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGenericDownload font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_240" class="mt-4">
        <:example>
          <IconGenericDragHandle font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGenericDragHandle font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_241" class="mt-4">
        <:example>
          <IconGenericEdit font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGenericEdit font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_242" class="mt-4">
        <:example>
          <IconGenericGlobe font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGenericGlobe font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_243" class="mt-4">
        <:example>
          <IconGenericHeart font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGenericHeart font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_244" class="mt-4">
        <:example>
          <IconGenericHelp font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGenericHelp font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_245" class="mt-4">
        <:example>
          <IconGenericHome font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGenericHome font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_246" class="mt-4">
        <:example>
          <IconGenericIdea font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGenericIdea font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_247" class="mt-4">
        <:example>
          <IconGenericInfoAlternative font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGenericInfoAlternative font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_248" class="mt-4">
        <:example>
          <IconGenericInfo font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGenericInfo font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_249" class="mt-4">
        <:example>
          <IconGenericLike font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGenericLike font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_250" class="mt-4">
        <:example>
          <IconGenericLink font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGenericLink font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_251" class="mt-4">
        <:example>
          <IconGenericLogIn font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGenericLogIn font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_252" class="mt-4">
        <:example>
          <IconGenericLogOut font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGenericLogOut font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_253" class="mt-4">
        <:example>
          <IconGenericLoyalty font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGenericLoyalty font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_254" class="mt-4">
        <:example>
          <IconGenericMention font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGenericMention font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_255" class="mt-4">
        <:example>
          <IconGenericMenu font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGenericMenu font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_256" class="mt-4">
        <:example>
          <IconGenericMinus font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGenericMinus font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_257" class="mt-4">
        <:example>
          <IconGenericMultiBet font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGenericMultiBet font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_258" class="mt-4">
        <:example>
          <IconGenericNews font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGenericNews font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_259" class="mt-4">
        <:example>
          <IconGenericPicture font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGenericPicture font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_260" class="mt-4">
        <:example>
          <IconGenericPlus font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGenericPlus font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_261" class="mt-4">
        <:example>
          <IconGenericSearch font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGenericSearch font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_262" class="mt-4">
        <:example>
          <IconGenericSettings font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGenericSettings font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_263" class="mt-4">
        <:example>
          <IconGenericShareAndroid font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGenericShareAndroid font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_264" class="mt-4">
        <:example>
          <IconGenericShareIosBig font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGenericShareIosBig font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_265" class="mt-4">
        <:example>
          <IconGenericShareIos font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGenericShareIos font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_266" class="mt-4">
        <:example>
          <IconGenericStar font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGenericStar font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_267" class="mt-4">
        <:example>
          <IconGenericTag font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGenericTag font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_268" class="mt-4">
        <:example>
          <IconGenericTicket font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGenericTicket font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_269" class="mt-4">
        <:example>
          <IconGenericUpload font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGenericUpload font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_270" class="mt-4">
        <:example>
          <IconGenericUser font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGenericUser font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_271" class="mt-4">
        <:example>
          <IconGenericUsers font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGenericUsers font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_272" class="mt-4">
        <:example>
          <IconGift font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGift font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_273" class="mt-4">
        <:example>
          <IconGlasses font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGlasses font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_274" class="mt-4">
        <:example>
          <IconGlobe font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGlobe font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_275" class="mt-4">
        <:example>
          <IconGoogleAuth font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGoogleAuth font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_276" class="mt-4">
        <:example>
          <IconGoogle font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGoogle font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_277" class="mt-4">
        <:example>
          <IconHamburger font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconHamburger font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_278" class="mt-4">
        <:example>
          <IconHelp font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconHelp font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_279" class="mt-4">
        <:example>
          <IconHistory font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconHistory font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_280" class="mt-4">
        <:example>
          <IconHome font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconHome font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_281" class="mt-4">
        <:example>
          <IconHub88 font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconHub88 font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_282" class="mt-4">
        <:example>
          <IconHyperlink font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconHyperlink font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_283" class="mt-4">
        <:example>
          <IconInPlay font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconInPlay font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_284" class="mt-4">
        <:example>
          <IconInfoCircle font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconInfoCircle font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_285" class="mt-4">
        <:example>
          <IconInfo font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconInfo font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_286" class="mt-4">
        <:example>
          <IconInstagram font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconInstagram font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_287" class="mt-4">
        <:example>
          <IconLeftArrowCurveRight font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconLeftArrowCurveRight font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_288" class="mt-4">
        <:example>
          <IconLifeRing font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconLifeRing font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_289" class="mt-4">
        <:example>
          <IconLightbulb font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconLightbulb font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_290" class="mt-4">
        <:example>
          <IconLimit font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconLimit font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_291" class="mt-4">
        <:example>
          <IconLine font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconLine font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_292" class="mt-4">
        <:example>
          <IconLink font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconLink font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_293" class="mt-4">
        <:example>
          <IconListNumbered font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconListNumbered font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_294" class="mt-4">
        <:example>
          <IconLiveCasino font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconLiveCasino font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_295" class="mt-4">
        <:example>
          <IconLiveChat font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconLiveChat font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_296" class="mt-4">
        <:example>
          <IconLiveStream font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconLiveStream font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_297" class="mt-4">
        <:example>
          <IconLock font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconLock font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_298" class="mt-4">
        <:example>
          <IconLogin font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconLogin font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_299" class="mt-4">
        <:example>
          <IconLogoPlain font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconLogoPlain font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_300" class="mt-4">
        <:example>
          <IconLogout font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconLogout font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_301" class="mt-4">
        <:example>
          <IconLoyalty0 font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconLoyalty0 font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_302" class="mt-4">
        <:example>
          <IconMailBox font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconMailBox font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_303" class="mt-4">
        <:example>
          <IconMailEmailStats font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconMailEmailStats font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_304" class="mt-4">
        <:example>
          <IconMailEnvelope font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconMailEnvelope font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_305" class="mt-4">
        <:example>
          <IconMailFilterCrossed font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconMailFilterCrossed font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_306" class="mt-4">
        <:example>
          <IconMailFilter font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconMailFilter font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_307" class="mt-4">
        <:example>
          <IconMailFlag font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconMailFlag font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_308" class="mt-4">
        <:example>
          <IconMailLink font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconMailLink font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_309" class="mt-4">
        <:example>
          <IconMailSend font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconMailSend font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_310" class="mt-4">
        <:example>
          <IconMail font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconMail font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_311" class="mt-4">
        <:example>
          <IconMapsCompas font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconMapsCompas font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_312" class="mt-4">
        <:example>
          <IconMapsLocation font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconMapsLocation font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_313" class="mt-4">
        <:example>
          <IconMapsMap font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconMapsMap font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_314" class="mt-4">
        <:example>
          <IconMapsMarker font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconMapsMarker font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_315" class="mt-4">
        <:example>
          <IconMapsPanorama font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconMapsPanorama font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_316" class="mt-4">
        <:example>
          <IconMapsPinAdd font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconMapsPinAdd font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_317" class="mt-4">
        <:example>
          <IconMapsPinLocation font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconMapsPinLocation font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_318" class="mt-4">
        <:example>
          <IconMapsPin font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconMapsPin font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_319" class="mt-4">
        <:example>
          <IconMapsWorld font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconMapsWorld font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_320" class="mt-4">
        <:example>
          <IconMediaFastBack font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconMediaFastBack font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_321" class="mt-4">
        <:example>
          <IconMediaFastForward font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconMediaFastForward font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_322" class="mt-4">
        <:example>
          <IconMediaGif font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconMediaGif font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_323" class="mt-4">
        <:example>
          <IconMediaHeadphones font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconMediaHeadphones font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_324" class="mt-4">
        <:example>
          <IconMediaMegaphone font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconMediaMegaphone font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_325" class="mt-4">
        <:example>
          <IconMediaMiceAlternative font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconMediaMiceAlternative font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_326" class="mt-4">
        <:example>
          <IconMediaMice font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconMediaMice font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_327" class="mt-4">
        <:example>
          <IconMediaMonitor font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconMediaMonitor font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_328" class="mt-4">
        <:example>
          <IconMediaMusic font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconMediaMusic font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_329" class="mt-4">
        <:example>
          <IconMediaNoVolume font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconMediaNoVolume font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_330" class="mt-4">
        <:example>
          <IconMediaPause font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconMediaPause font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_331" class="mt-4">
        <:example>
          <IconMediaPhoto font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconMediaPhoto font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_332" class="mt-4">
        <:example>
          <IconMediaPlay font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconMediaPlay font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_333" class="mt-4">
        <:example>
          <IconMediaSoundwave font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconMediaSoundwave font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_334" class="mt-4">
        <:example>
          <IconMediaStop font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconMediaStop font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_335" class="mt-4">
        <:example>
          <IconMediaTunerAlternative font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconMediaTunerAlternative font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_336" class="mt-4">
        <:example>
          <IconMediaTuner font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconMediaTuner font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_337" class="mt-4">
        <:example>
          <IconMediaVideo font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconMediaVideo font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_338" class="mt-4">
        <:example>
          <IconMediaVolume font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconMediaVolume font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_339" class="mt-4">
        <:example>
          <IconMenuHome font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconMenuHome font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_340" class="mt-4">
        <:example>
          <IconMenu font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconMenu font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_341" class="mt-4">
        <:example>
          <IconMinus font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconMinus font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_342" class="mt-4">
        <:example>
          <IconMobile font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconMobile font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_343" class="mt-4">
        <:example>
          <IconMoney font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconMoney font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_344" class="mt-4">
        <:example>
          <IconMoneybag font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconMoneybag font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_345" class="mt-4">
        <:example>
          <IconMoon font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconMoon font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_346" class="mt-4">
        <:example>
          <IconMore font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconMore font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_347" class="mt-4">
        <:example>
          <IconNews font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconNews font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_348" class="mt-4">
        <:example>
          <IconNotificationUnread font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconNotificationUnread font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_349" class="mt-4">
        <:example>
          <IconNotification font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconNotification font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_350" class="mt-4">
        <:example>
          <IconNotificationsActivity font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconNotificationsActivity font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_351" class="mt-4">
        <:example>
          <IconNotificationsAddBell font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconNotificationsAddBell font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_352" class="mt-4">
        <:example>
          <IconNotificationsAlert font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconNotificationsAlert font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_353" class="mt-4">
        <:example>
          <IconNotificationsApp font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconNotificationsApp font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_354" class="mt-4">
        <:example>
          <IconNotificationsBellAlarm font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconNotificationsBellAlarm font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_355" class="mt-4">
        <:example>
          <IconNotificationsBellCross font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconNotificationsBellCross font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_356" class="mt-4">
        <:example>
          <IconNotificationsBellRingingAlternative font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconNotificationsBellRingingAlternative font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_357" class="mt-4">
        <:example>
          <IconNotificationsBellRinging font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconNotificationsBellRinging font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_358" class="mt-4">
        <:example>
          <IconNotificationsBell font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconNotificationsBell font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_359" class="mt-4">
        <:example>
          <IconNotificationsError font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconNotificationsError font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_360" class="mt-4">
        <:example>
          <IconNotificationsNotifications font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconNotificationsNotifications font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_361" class="mt-4">
        <:example>
          <IconNotificationsQuestionMark font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconNotificationsQuestionMark font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_362" class="mt-4">
        <:example>
          <IconNotificationsSettings font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconNotificationsSettings font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_363" class="mt-4">
        <:example>
          <IconOtherFrame font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconOtherFrame font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_364" class="mt-4">
        <:example>
          <IconOtherId font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconOtherId font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_365" class="mt-4">
        <:example>
          <IconOtherLightning font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconOtherLightning font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_366" class="mt-4">
        <:example>
          <IconOtherMoon font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconOtherMoon font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_367" class="mt-4">
        <:example>
          <IconOtherOther font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconOtherOther font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_368" class="mt-4">
        <:example>
          <IconOtherPlug font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconOtherPlug font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_369" class="mt-4">
        <:example>
          <IconOtherRewards font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconOtherRewards font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_370" class="mt-4">
        <:example>
          <IconOtherSad font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconOtherSad font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_371" class="mt-4">
        <:example>
          <IconOtherSmile font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconOtherSmile font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_372" class="mt-4">
        <:example>
          <IconOtherSun font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconOtherSun font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_373" class="mt-4">
        <:example>
          <IconOtherWater font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconOtherWater font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_374" class="mt-4">
        <:example>
          <IconOther3DotsHorizontal font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconOther3DotsHorizontal font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_375" class="mt-4">
        <:example>
          <IconOther3Dots font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconOther3Dots font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_376" class="mt-4">
        <:example>
          <IconPadlock font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconPadlock font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_377" class="mt-4">
        <:example>
          <IconPencil font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconPencil font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_378" class="mt-4">
        <:example>
          <IconPhoto font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconPhoto font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_379" class="mt-4">
        <:example>
          <IconPicture font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconPicture font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_380" class="mt-4">
        <:example>
          <IconPin font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconPin font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_381" class="mt-4">
        <:example>
          <IconPlay font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconPlay font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_382" class="mt-4">
        <:example>
          <IconPlus font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconPlus font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_383" class="mt-4">
        <:example>
          <IconPriceBoost font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconPriceBoost font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_384" class="mt-4">
        <:example>
          <IconPrint font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconPrint font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_385" class="mt-4">
        <:example>
          <IconProfile font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconProfile font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_386" class="mt-4">
        <:example>
          <IconPromotions font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconPromotions font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_387" class="mt-4">
        <:example>
          <IconRefresh font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconRefresh font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_388" class="mt-4">
        <:example>
          <IconReward font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconReward font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_389" class="mt-4">
        <:example>
          <IconRow font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconRow font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_390" class="mt-4">
        <:example>
          <IconSbShield font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSbShield font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_391" class="mt-4">
        <:example>
          <IconSearch font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSearch font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_392" class="mt-4">
        <:example>
          <IconSecurityKey font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSecurityKey font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_393" class="mt-4">
        <:example>
          <IconSecurityLock font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSecurityLock font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_394" class="mt-4">
        <:example>
          <IconSecurityMagnet font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSecurityMagnet font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_395" class="mt-4">
        <:example>
          <IconSecurityShieldSecured font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSecurityShieldSecured font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_396" class="mt-4">
        <:example>
          <IconSecurityShield font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSecurityShield font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_397" class="mt-4">
        <:example>
          <IconSecurityUmbrella font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSecurityUmbrella font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_398" class="mt-4">
        <:example>
          <IconSecurityUnlock font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSecurityUnlock font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_399" class="mt-4">
        <:example>
          <IconSecurityVerifiedFace font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSecurityVerifiedFace font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_400" class="mt-4">
        <:example>
          <IconSecurityVerified font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSecurityVerified font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_401" class="mt-4">
        <:example>
          <IconSettings font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSettings font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_402" class="mt-4">
        <:example>
          <IconShare font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconShare font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_403" class="mt-4">
        <:example>
          <IconShopBag font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconShopBag font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_404" class="mt-4">
        <:example>
          <IconShopBasket font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconShopBasket font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_405" class="mt-4">
        <:example>
          <IconShopCard font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconShopCard font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_406" class="mt-4">
        <:example>
          <IconShopCart font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconShopCart font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_407" class="mt-4">
        <:example>
          <IconShopCryptoCoin font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconShopCryptoCoin font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_408" class="mt-4">
        <:example>
          <IconShopCrypto font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconShopCrypto font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_409" class="mt-4">
        <:example>
          <IconShopWallet font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconShopWallet font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_410" class="mt-4">
        <:example>
          <IconShopWirelessPay font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconShopWirelessPay font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_411" class="mt-4">
        <:example>
          <IconSliders font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSliders font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_412" class="mt-4">
        <:example>
          <IconSlots font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSlots font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_413" class="mt-4">
        <:example>
          <IconSnackbarSuccess font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSnackbarSuccess font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_414" class="mt-4">
        <:example>
          <IconSoftwareBug font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSoftwareBug font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_415" class="mt-4">
        <:example>
          <IconSoftwareCode font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSoftwareCode font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_416" class="mt-4">
        <:example>
          <IconSoftwareCursor font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSoftwareCursor font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_417" class="mt-4">
        <:example>
          <IconSoftwareDashboard font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSoftwareDashboard font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_418" class="mt-4">
        <:example>
          <IconSoftwareData font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSoftwareData font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_419" class="mt-4">
        <:example>
          <IconSoftwareDownload font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSoftwareDownload font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_420" class="mt-4">
        <:example>
          <IconSoftwareHand font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSoftwareHand font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_421" class="mt-4">
        <:example>
          <IconSoftwareLogOut font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSoftwareLogOut font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_422" class="mt-4">
        <:example>
          <IconSoftwareLogin font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSoftwareLogin font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_423" class="mt-4">
        <:example>
          <IconSoftwareNut font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSoftwareNut font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_424" class="mt-4">
        <:example>
          <IconSoftwarePlate font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSoftwarePlate font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_425" class="mt-4">
        <:example>
          <IconSoftwarePuzzle font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSoftwarePuzzle font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_426" class="mt-4">
        <:example>
          <IconSoftwareSettings font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSoftwareSettings font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_427" class="mt-4">
        <:example>
          <IconSoftwareShutdown font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSoftwareShutdown font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_428" class="mt-4">
        <:example>
          <IconSoftwareSorting font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSoftwareSorting font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_429" class="mt-4">
        <:example>
          <IconSoftwareWrench font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSoftwareWrench font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_430" class="mt-4">
        <:example>
          <IconSportAmericanFootball font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportAmericanFootball font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_431" class="mt-4">
        <:example>
          <IconSportBadminton font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportBadminton font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_432" class="mt-4">
        <:example>
          <IconSportBaseball font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportBaseball font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_433" class="mt-4">
        <:example>
          <IconSportBasketball font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportBasketball font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_434" class="mt-4">
        <:example>
          <IconSportBeachVolley font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportBeachVolley font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_435" class="mt-4">
        <:example>
          <IconSportBeachVolleyball font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportBeachVolleyball font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_436" class="mt-4">
        <:example>
          <IconSportBombay font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportBombay font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_437" class="mt-4">
        <:example>
          <IconSportBoxing font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportBoxing font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_438" class="mt-4">
        <:example>
          <IconSportCSGO font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportCSGO font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_439" class="mt-4">
        <:example>
          <IconSportCasino font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportCasino font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_440" class="mt-4">
        <:example>
          <IconSportCricket font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportCricket font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_441" class="mt-4">
        <:example>
          <IconSportCrossCountry font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportCrossCountry font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_442" class="mt-4">
        <:example>
          <IconSportCycling font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportCycling font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_443" class="mt-4">
        <:example>
          <IconSportDarts font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportDarts font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_444" class="mt-4">
        <:example>
          <IconSportDota2 font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportDota2 font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_445" class="mt-4">
        <:example>
          <IconSportEsportGeneric font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportEsportGeneric font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_446" class="mt-4">
        <:example>
          <IconSportFeatured font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportFeatured font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_447" class="mt-4">
        <:example>
          <IconSportFieldHockey font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportFieldHockey font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_448" class="mt-4">
        <:example>
          <IconSportFloorball font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportFloorball font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_449" class="mt-4">
        <:example>
          <IconSportFutsal font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportFutsal font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_450" class="mt-4">
        <:example>
          <IconSportGolf font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportGolf font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_451" class="mt-4">
        <:example>
          <IconSportGreyhound font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportGreyhound font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_452" class="mt-4">
        <:example>
          <IconSportHandball font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportHandball font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_453" class="mt-4">
        <:example>
          <IconSportHarness font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportHarness font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_454" class="mt-4">
        <:example>
          <IconSportHorseRacing font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportHorseRacing font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_455" class="mt-4">
        <:example>
          <IconSportIceHockey font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportIceHockey font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_456" class="mt-4">
        <:example>
          <IconSportLoL font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportLoL font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_457" class="mt-4">
        <:example>
          <IconSportMMA font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportMMA font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_458" class="mt-4">
        <:example>
          <IconSportMotor font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportMotor font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_459" class="mt-4">
        <:example>
          <IconSportOverwatch font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportOverwatch font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_460" class="mt-4">
        <:example>
          <IconSportRugby font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportRugby font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_461" class="mt-4">
        <:example>
          <IconSportSetTennis font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportSetTennis font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_462" class="mt-4">
        <:example>
          <IconSportSnooker font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportSnooker font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_463" class="mt-4">
        <:example>
          <IconSportSoccer font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportSoccer font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_464" class="mt-4">
        <:example>
          <IconSportSpecials font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportSpecials font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_465" class="mt-4">
        <:example>
          <IconSportSportsbet font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportSportsbet font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_466" class="mt-4">
        <:example>
          <IconSportTableTennis font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportTableTennis font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_467" class="mt-4">
        <:example>
          <IconSportTennis font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportTennis font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_468" class="mt-4">
        <:example>
          <IconSportWaterpolo font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportWaterpolo font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_469" class="mt-4">
        <:example>
          <IconSportWidget font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportWidget font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_470" class="mt-4">
        <:example>
          <IconSportsAfl font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsAfl font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_471" class="mt-4">
        <:example>
          <IconSportsAmericanFootBall font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsAmericanFootBall font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_472" class="mt-4">
        <:example>
          <IconSportsBadminton font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsBadminton font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_473" class="mt-4">
        <:example>
          <IconSportsBaseBall font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsBaseBall font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_474" class="mt-4">
        <:example>
          <IconSportsBasketBall font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsBasketBall font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_475" class="mt-4">
        <:example>
          <IconSportsBiathlon font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsBiathlon font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_476" class="mt-4">
        <:example>
          <IconSportsBoxing font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsBoxing font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_477" class="mt-4">
        <:example>
          <IconSportsCenter font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsCenter font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_478" class="mt-4">
        <:example>
          <IconSportsCricket font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsCricket font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_479" class="mt-4">
        <:example>
          <IconSportsCycling font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsCycling font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_480" class="mt-4">
        <:example>
          <IconSportsDarts font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsDarts font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_481" class="mt-4">
        <:example>
          <IconSportsESports font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsESports font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_482" class="mt-4">
        <:example>
          <IconSportsFantasy font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsFantasy font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_483" class="mt-4">
        <:example>
          <IconSportsFeatured font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsFeatured font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_484" class="mt-4">
        <:example>
          <IconSportsFootBall font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsFootBall font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_485" class="mt-4">
        <:example>
          <IconSportsGolf font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsGolf font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_486" class="mt-4">
        <:example>
          <IconSportsGreyhound font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsGreyhound font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_487" class="mt-4">
        <:example>
          <IconSportsHandBall font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsHandBall font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_488" class="mt-4">
        <:example>
          <IconSportsHarness font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsHarness font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_489" class="mt-4">
        <:example>
          <IconSportsHorseRacing font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsHorseRacing font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_490" class="mt-4">
        <:example>
          <IconSportsHorse font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsHorse font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_491" class="mt-4">
        <:example>
          <IconSportsIceHockey font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsIceHockey font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_492" class="mt-4">
        <:example>
          <IconSportsMma font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsMma font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_493" class="mt-4">
        <:example>
          <IconSportsMotorSports font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsMotorSports font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_494" class="mt-4">
        <:example>
          <IconSportsPoker font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsPoker font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_495" class="mt-4">
        <:example>
          <IconSportsPolitics font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsPolitics font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_496" class="mt-4">
        <:example>
          <IconSportsPool font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsPool font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_497" class="mt-4">
        <:example>
          <IconSportsPopular font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsPopular font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_498" class="mt-4">
        <:example>
          <IconSportsRugby font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsRugby font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_499" class="mt-4">
        <:example>
          <IconSportsSki font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsSki font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_500" class="mt-4">
        <:example>
          <IconSportsSnooker font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsSnooker font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_501" class="mt-4">
        <:example>
          <IconSportsSpecial font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsSpecial font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_502" class="mt-4">
        <:example>
          <IconSportsSquash font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsSquash font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_503" class="mt-4">
        <:example>
          <IconSportsTableTennis font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsTableTennis font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_504" class="mt-4">
        <:example>
          <IconSportsTennis font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsTennis font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_505" class="mt-4">
        <:example>
          <IconSportsVolleyBall font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsVolleyBall font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_506" class="mt-4">
        <:example>
          <IconSportsWaterPolo font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsWaterPolo font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_507" class="mt-4">
        <:example>
          <IconStarEmpty font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconStarEmpty font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_508" class="mt-4">
        <:example>
          <IconStarFilled font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconStarFilled font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_509" class="mt-4">
        <:example>
          <IconStarFlag font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconStarFlag font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_510" class="mt-4">
        <:example>
          <IconStars font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconStars font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_511" class="mt-4">
        <:example>
          <IconStart font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconStart font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_512" class="mt-4">
        <:example>
          <IconStats font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconStats font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_513" class="mt-4">
        <:example>
          <IconStop font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconStop font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_514" class="mt-4">
        <:example>
          <IconStopwatch font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconStopwatch font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_515" class="mt-4">
        <:example>
          <IconSuccessCircle font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSuccessCircle font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_516" class="mt-4">
        <:example>
          <IconSun font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSun font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_517" class="mt-4">
        <:example>
          <IconSupport font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSupport font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_518" class="mt-4">
        <:example>
          <IconTable font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconTable font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_519" class="mt-4">
        <:example>
          <IconTag font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconTag font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_520" class="mt-4">
        <:example>
          <IconTelegram font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconTelegram font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_521" class="mt-4">
        <:example>
          <IconTextAncor font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconTextAncor font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_522" class="mt-4">
        <:example>
          <IconTextAttach font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconTextAttach font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_523" class="mt-4">
        <:example>
          <IconTextBold font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconTextBold font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_524" class="mt-4">
        <:example>
          <IconTextBulletsList font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconTextBulletsList font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_525" class="mt-4">
        <:example>
          <IconTextCards font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconTextCards font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_526" class="mt-4">
        <:example>
          <IconTextCenter font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconTextCenter font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_527" class="mt-4">
        <:example>
          <IconTextClearFormatting font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconTextClearFormatting font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_528" class="mt-4">
        <:example>
          <IconTextCut font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconTextCut font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_529" class="mt-4">
        <:example>
          <IconTextDescreaseIndent font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconTextDescreaseIndent font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_530" class="mt-4">
        <:example>
          <IconTextIncertLine font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconTextIncertLine font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_531" class="mt-4">
        <:example>
          <IconTextIncreaseIndent font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconTextIncreaseIndent font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_532" class="mt-4">
        <:example>
          <IconTextItalic font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconTextItalic font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_533" class="mt-4">
        <:example>
          <IconTextLeftAlign font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconTextLeftAlign font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_534" class="mt-4">
        <:example>
          <IconTextMarker font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconTextMarker font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_535" class="mt-4">
        <:example>
          <IconTextMath font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconTextMath font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_536" class="mt-4">
        <:example>
          <IconTextNumbersList font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconTextNumbersList font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_537" class="mt-4">
        <:example>
          <IconTextRightAlign font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconTextRightAlign font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_538" class="mt-4">
        <:example>
          <IconTextSize font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconTextSize font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_539" class="mt-4">
        <:example>
          <IconTextStrikethrough font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconTextStrikethrough font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_540" class="mt-4">
        <:example>
          <IconTextStyle font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconTextStyle font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_541" class="mt-4">
        <:example>
          <IconTextTableAlternative font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconTextTableAlternative font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_542" class="mt-4">
        <:example>
          <IconTextTable font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconTextTable font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_543" class="mt-4">
        <:example>
          <IconTextUnderline font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconTextUnderline font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_544" class="mt-4">
        <:example>
          <IconText font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconText font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_545" class="mt-4">
        <:example>
          <IconTimeAlarm font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconTimeAlarm font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_546" class="mt-4">
        <:example>
          <IconTimeCalendarAdd font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconTimeCalendarAdd font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_547" class="mt-4">
        <:example>
          <IconTimeCalendarAlternative font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconTimeCalendarAlternative font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_548" class="mt-4">
        <:example>
          <IconTimeCalendarDate font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconTimeCalendarDate font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_549" class="mt-4">
        <:example>
          <IconTimeCalendarRemove font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconTimeCalendarRemove font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_550" class="mt-4">
        <:example>
          <IconTimeCalendarSucsess font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconTimeCalendarSucsess font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_551" class="mt-4">
        <:example>
          <IconTimeCalendar font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconTimeCalendar font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_552" class="mt-4">
        <:example>
          <IconTimeClock font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconTimeClock font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_553" class="mt-4">
        <:example>
          <IconTimeSandglass font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconTimeSandglass font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_554" class="mt-4">
        <:example>
          <IconTimeStopwatchTimer font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconTimeStopwatchTimer font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_555" class="mt-4">
        <:example>
          <IconTimeStopwatch font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconTimeStopwatch font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_556" class="mt-4">
        <:example>
          <IconTimeTime font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconTimeTime font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_557" class="mt-4">
        <:example>
          <IconTimeWatch font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconTimeWatch font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_558" class="mt-4">
        <:example>
          <IconTimer font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconTimer font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_559" class="mt-4">
        <:example>
          <IconTwitter font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconTwitter font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_560" class="mt-4">
        <:example>
          <IconTypeClosedHand font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconTypeClosedHand font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_561" class="mt-4">
        <:example>
          <IconTypeDefault font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconTypeDefault font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_562" class="mt-4">
        <:example>
          <IconTypeHandPointing font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconTypeHandPointing font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_563" class="mt-4">
        <:example>
          <IconTypeHelp font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconTypeHelp font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_564" class="mt-4">
        <:example>
          <IconTypeMove font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconTypeMove font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_565" class="mt-4">
        <:example>
          <IconTypeNotAllowed font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconTypeNotAllowed font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_566" class="mt-4">
        <:example>
          <IconTypeOpenedHand font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconTypeOpenedHand font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_567" class="mt-4">
        <:example>
          <IconTypeText font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconTypeText font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_568" class="mt-4">
        <:example>
          <IconTypeZoomIn font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconTypeZoomIn font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_569" class="mt-4">
        <:example>
          <IconTypeZoomOut font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconTypeZoomOut font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_570" class="mt-4">
        <:example>
          <IconUpload font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconUpload font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_571" class="mt-4">
        <:example>
          <IconUser font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconUser font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_572" class="mt-4">
        <:example>
          <IconUsers font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconUsers font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_573" class="mt-4">
        <:example>
          <IconVerify font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconVerify font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_574" class="mt-4">
        <:example>
          <IconVirtualSports font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconVirtualSports font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_575" class="mt-4">
        <:example>
          <IconVkontakte font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconVkontakte font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_576" class="mt-4">
        <:example>
          <IconVolatility font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconVolatility font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_577" class="mt-4">
        <:example>
          <IconWalletRounded font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconWalletRounded font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_578" class="mt-4">
        <:example>
          <IconWallet font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconWallet font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_579" class="mt-4">
        <:example>
          <IconWand font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconWand font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_580" class="mt-4">
        <:example>
          <IconWarning font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconWarning font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_581" class="mt-4">
        <:example>
          <IconWhatsapp font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconWhatsapp font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_582" class="mt-4">
        <:example>
          <IconYoutube font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconYoutube font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_583" class="mt-4">
        <:example>
          <IconZoom font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconZoom font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <Footer />
    </TopToDown>
    """
  end
end
