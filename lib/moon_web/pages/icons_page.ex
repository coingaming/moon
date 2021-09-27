defmodule MoonWeb.Pages.IconsPage do
  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Heading
  alias Moon.Components.CodePreview
  alias Moon.Icons
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ExampleAndCode

  data breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Assets"
      },
      %{
        to: "/icons",
        name: "Icons"
      }
    ]

  alias Icons.ArrowsBottomLeft
  alias Icons.ArrowsBottomRight
  alias Icons.ArrowsChevronDownDouble
  alias Icons.ArrowsChevronLeftDouble
  alias Icons.ArrowsChevronRightDouble
  alias Icons.ArrowsChevronUpDouble
  alias Icons.ArrowsDiagonalsBltr
  alias Icons.ArrowsDiagonalsTlbr
  alias Icons.ArrowsDown
  alias Icons.ArrowsForward
  alias Icons.ArrowsLeftCurved
  alias Icons.ArrowsLeft
  alias Icons.ArrowsRefresh
  alias Icons.ArrowsReply
  alias Icons.ArrowsRightCurved
  alias Icons.ArrowsRight
  alias Icons.ArrowsTopLeft
  alias Icons.ArrowsTopRight
  alias Icons.ArrowsTransfer
  alias Icons.ArrowsUp
  alias Icons.ArrowsUpdate
  alias Icons.ChartArea
  alias Icons.ChartBarAlternitive
  alias Icons.ChartBarVertical
  alias Icons.ChartBar
  alias Icons.ChartDashboard
  alias Icons.ChartFin
  alias Icons.ChartLine
  alias Icons.ChartPieChart
  alias Icons.ChartRelation
  alias Icons.ChartRound
  alias Icons.ChatChat
  alias Icons.ChatCommentAdd
  alias Icons.ChatCommentBubbleAlert
  alias Icons.ChatCommentBubbleQuestionMark
  alias Icons.ChatCommentBubble
  alias Icons.ChatCommentRemove
  alias Icons.ChatCommentText
  alias Icons.ChatComment
  alias Icons.ChatDoubleBubble
  alias Icons.ChatStatsChat
  alias Icons.ControlsChevronDownSmall
  alias Icons.ControlsChevronDown
  alias Icons.ControlsChevronLeftSmall
  alias Icons.ControlsChevronLeft
  alias Icons.ControlsChevronRightSmall
  alias Icons.ControlsChevronRight
  alias Icons.ControlsChevronUpSmall
  alias Icons.ControlsChevronUp
  alias Icons.ControlsClear
  alias Icons.ControlsCloseSmall
  alias Icons.ControlsClose
  alias Icons.ControlsCollapse
  alias Icons.ControlsDiagonalsInsight
  alias Icons.ControlsDiagonalsOutsight
  alias Icons.ControlsExpand
  alias Icons.ControlsEyeCrossed
  alias Icons.ControlsEye
  alias Icons.ControlsMinus
  alias Icons.ControlsPlus
  alias Icons.ControlsVerticalDoubleChevron
  alias Icons.DevicesBluetooth
  alias Icons.DevicesJoystick
  alias Icons.DevicesKeyboard
  alias Icons.DevicesMac
  alias Icons.DevicesMacbookAndIphone
  alias Icons.DevicesMacbook
  alias Icons.DevicesMouse
  alias Icons.DevicesPhone
  alias Icons.DevicesSmartphone
  alias Icons.DevicesTvBox
  alias Icons.FilesAdd
  alias Icons.FilesCase
  alias Icons.FilesClipboardText
  alias Icons.FilesClipboard
  alias Icons.FilesCode
  alias Icons.FilesCopy
  alias Icons.FilesDelete
  alias Icons.FilesDraft
  alias Icons.FilesExport
  alias Icons.FilesExternalLink
  alias Icons.FilesFile
  alias Icons.FilesFolderClosed
  alias Icons.FilesFolderOpenAlternative
  alias Icons.FilesFolderOpen
  alias Icons.FilesFolderZip
  alias Icons.FilesGlasses
  alias Icons.FilesImport
  alias Icons.FilesMagazine
  alias Icons.FilesPrint
  alias Icons.FilesRemove
  alias Icons.FilesSave
  alias Icons.FilesScan
  alias Icons.FilesShare
  alias Icons.FilesSticker
  alias Icons.FilesStickers
  alias Icons.FilesTable
  alias Icons.FilesText
  alias Icons.GenericAbout
  alias Icons.GenericAlarmRound
  alias Icons.GenericAlarm
  alias Icons.GenericAmountNumber
  alias Icons.GenericBet
  alias Icons.GenericBlock
  alias Icons.GenericBookmark
  alias Icons.GenericBrowser
  alias Icons.GenericBurgerRegular
  alias Icons.GenericBurgerZig
  alias Icons.GenericCheckAlternative
  alias Icons.GenericCheckRounded
  alias Icons.GenericClose
  alias Icons.GenericDelete
  alias Icons.GenericDislike
  alias Icons.GenericDownload
  alias Icons.GenericDragHandle
  alias Icons.GenericEdit
  alias Icons.GenericGlobe
  alias Icons.GenericHeart
  alias Icons.GenericHelp
  alias Icons.GenericHome
  alias Icons.GenericIdea
  alias Icons.GenericInfoAlternative
  alias Icons.GenericInfo
  alias Icons.GenericLike
  alias Icons.GenericLink
  alias Icons.GenericLogIn
  alias Icons.GenericLogOut
  alias Icons.GenericLoyalty
  alias Icons.GenericMention
  alias Icons.GenericMenu
  alias Icons.GenericMinus
  alias Icons.GenericMultiBet
  alias Icons.GenericNews
  alias Icons.GenericPicture
  alias Icons.GenericPlus
  alias Icons.GenericSearch
  alias Icons.GenericSettings
  alias Icons.GenericShareAndroid
  alias Icons.GenericShareIosBig
  alias Icons.GenericShareIos
  alias Icons.GenericStar
  alias Icons.GenericTag
  alias Icons.GenericTicket
  alias Icons.GenericUpload
  alias Icons.GenericUser
  alias Icons.GenericUsers
  alias Icons.MailBox
  alias Icons.MailEmailStats
  alias Icons.MailEnvelope
  alias Icons.MailFilterCrossed
  alias Icons.MailFilter
  alias Icons.MailFlag
  alias Icons.MailLink
  alias Icons.MailSend
  alias Icons.MapsCompas
  alias Icons.MapsLocation
  alias Icons.MapsMap
  alias Icons.MapsMarker
  alias Icons.MapsPanorama
  alias Icons.MapsPinAdd
  alias Icons.MapsPinLocation
  alias Icons.MapsPin
  alias Icons.MapsWorld
  alias Icons.MediaFastBack
  alias Icons.MediaFastForward
  alias Icons.MediaGif
  alias Icons.MediaHeadphones
  alias Icons.MediaMegaphone
  alias Icons.MediaMiceAlternative
  alias Icons.MediaMice
  alias Icons.MediaMonitor
  alias Icons.MediaMusic
  alias Icons.MediaNoVolume
  alias Icons.MediaPause
  alias Icons.MediaPhoto
  alias Icons.MediaPlay
  alias Icons.MediaSoundwave
  alias Icons.MediaStop
  alias Icons.MediaTunerAlternative
  alias Icons.MediaTuner
  alias Icons.MediaVideo
  alias Icons.MediaVolume
  alias Icons.NotificationsActivity
  alias Icons.NotificationsAddBell
  alias Icons.NotificationsAlert
  alias Icons.NotificationsApp
  alias Icons.NotificationsBellAlarm
  alias Icons.NotificationsBellCross
  alias Icons.NotificationsBellRingingAlternative
  alias Icons.NotificationsBellRinging
  alias Icons.NotificationsBell
  alias Icons.NotificationsError
  alias Icons.NotificationsNotifications
  alias Icons.NotificationsQuestionMark
  alias Icons.NotificationsSettings
  alias Icons.OtherFrame
  alias Icons.OtherId
  alias Icons.OtherLightning
  alias Icons.OtherMoon
  alias Icons.OtherOther
  alias Icons.OtherPlug
  alias Icons.OtherRewards
  alias Icons.OtherSad
  alias Icons.OtherSmile
  alias Icons.OtherSun
  alias Icons.OtherWater
  alias Icons.Other3DotsHorizontal
  alias Icons.Other3Dots
  alias Icons.SecurityKey
  alias Icons.SecurityLock
  alias Icons.SecurityMagnet
  alias Icons.SecurityShieldSecured
  alias Icons.SecurityShield
  alias Icons.SecurityUmbrella
  alias Icons.SecurityUnlock
  alias Icons.SecurityVerifiedFace
  alias Icons.SecurityVerified
  alias Icons.ShopBag
  alias Icons.ShopBasket
  alias Icons.ShopCard
  alias Icons.ShopCart
  alias Icons.ShopCryptoCoin
  alias Icons.ShopCrypto
  alias Icons.ShopWallet
  alias Icons.ShopWirelessPay
  alias Icons.SoftwareBug
  alias Icons.SoftwareCode
  alias Icons.SoftwareCursor
  alias Icons.SoftwareDashboard
  alias Icons.SoftwareData
  alias Icons.SoftwareDownload
  alias Icons.SoftwareHand
  alias Icons.SoftwareLogOut
  alias Icons.SoftwareLogin
  alias Icons.SoftwareNut
  alias Icons.SoftwarePlate
  alias Icons.SoftwarePuzzle
  alias Icons.SoftwareSettings
  alias Icons.SoftwareShutdown
  alias Icons.SoftwareSorting
  alias Icons.SoftwareWrench
  alias Icons.SportAmericanFootball
  alias Icons.SportBadminton
  alias Icons.SportBaseball
  alias Icons.SportBasketball
  alias Icons.SportBeachVolley
  alias Icons.SportBeachVolleyball
  alias Icons.SportBombay
  alias Icons.SportBoxing
  alias Icons.SportCSGO
  alias Icons.SportCasino
  alias Icons.SportCricket
  alias Icons.SportCrossCountry
  alias Icons.SportCycling
  alias Icons.SportDarts
  alias Icons.SportDota2
  alias Icons.SportEsportGeneric
  alias Icons.SportFeatured
  alias Icons.SportFieldHockey
  alias Icons.SportFloorball
  alias Icons.SportFutsal
  alias Icons.SportGolf
  alias Icons.SportGreyhound
  alias Icons.SportHandball
  alias Icons.SportHarness
  alias Icons.SportHorseRacing
  alias Icons.SportIceHockey
  alias Icons.SportLoL
  alias Icons.SportMMA
  alias Icons.SportMotor
  alias Icons.SportOverwatch
  alias Icons.SportRugby
  alias Icons.SportSetTennis
  alias Icons.SportSnooker
  alias Icons.SportSoccer
  alias Icons.SportSpecials
  alias Icons.SportSportsbet
  alias Icons.SportTableTennis
  alias Icons.SportTennis
  alias Icons.SportWaterpolo
  alias Icons.TextAncor
  alias Icons.TextAttach
  alias Icons.TextBold
  alias Icons.TextBulletsList
  alias Icons.TextCards
  alias Icons.TextCenter
  alias Icons.TextClearFormatting
  alias Icons.TextCut
  alias Icons.TextDescreaseIndent
  alias Icons.TextIncertLine
  alias Icons.TextIncreaseIndent
  alias Icons.TextItalic
  alias Icons.TextLeftAlign
  alias Icons.TextMarker
  alias Icons.TextMath
  alias Icons.TextNumbersList
  alias Icons.TextRightAlign
  alias Icons.TextSize
  alias Icons.TextStrikethrough
  alias Icons.TextStyle
  alias Icons.TextTableAlternative
  alias Icons.TextTable
  alias Icons.TextUnderline
  alias Icons.TimeAlarm
  alias Icons.TimeCalendarAdd
  alias Icons.TimeCalendarAlternative
  alias Icons.TimeCalendarDate
  alias Icons.TimeCalendarRemove
  alias Icons.TimeCalendarSucsess
  alias Icons.TimeCalendar
  alias Icons.TimeClock
  alias Icons.TimeSandglass
  alias Icons.TimeStopwatchTimer
  alias Icons.TimeStopwatch
  alias Icons.TimeTime
  alias Icons.TimeWatch
  alias Icons.TypeClosedHand
  alias Icons.TypeDefault
  alias Icons.TypeHandPointing
  alias Icons.TypeHelp
  alias Icons.TypeMove
  alias Icons.TypeNotAllowed
  alias Icons.TypeOpenedHand
  alias Icons.TypeText
  alias Icons.TypeZoomIn
  alias Icons.TypeZoomOut

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
            <ArrowsBottomLeft font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ArrowsBottomLeft font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_2" class="mt-4">
          <:example>
            <ArrowsBottomRight font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ArrowsBottomRight font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_3" class="mt-4">
          <:example>
            <ArrowsChevronDownDouble font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ArrowsChevronDownDouble font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_4" class="mt-4">
          <:example>
            <ArrowsChevronLeftDouble font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ArrowsChevronLeftDouble font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_5" class="mt-4">
          <:example>
            <ArrowsChevronRightDouble font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ArrowsChevronRightDouble font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_6" class="mt-4">
          <:example>
            <ArrowsChevronUpDouble font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ArrowsChevronUpDouble font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_7" class="mt-4">
          <:example>
            <ArrowsDiagonalsBltr font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ArrowsDiagonalsBltr font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_8" class="mt-4">
          <:example>
            <ArrowsDiagonalsTlbr font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ArrowsDiagonalsTlbr font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_9" class="mt-4">
          <:example>
            <ArrowsDown font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ArrowsDown font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_10" class="mt-4">
          <:example>
            <ArrowsForward font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ArrowsForward font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_11" class="mt-4">
          <:example>
            <ArrowsLeftCurved font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ArrowsLeftCurved font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_12" class="mt-4">
          <:example>
            <ArrowsLeft font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ArrowsLeft font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_13" class="mt-4">
          <:example>
            <ArrowsRefresh font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ArrowsRefresh font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_14" class="mt-4">
          <:example>
            <ArrowsReply font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ArrowsReply font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_15" class="mt-4">
          <:example>
            <ArrowsRightCurved font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ArrowsRightCurved font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_16" class="mt-4">
          <:example>
            <ArrowsRight font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ArrowsRight font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_17" class="mt-4">
          <:example>
            <ArrowsTopLeft font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ArrowsTopLeft font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_18" class="mt-4">
          <:example>
            <ArrowsTopRight font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ArrowsTopRight font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_19" class="mt-4">
          <:example>
            <ArrowsTransfer font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ArrowsTransfer font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_20" class="mt-4">
          <:example>
            <ArrowsUp font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ArrowsUp font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_21" class="mt-4">
          <:example>
            <ArrowsUpdate font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ArrowsUpdate font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_22" class="mt-4">
          <:example>
            <ChartArea font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ChartArea font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_23" class="mt-4">
          <:example>
            <ChartBarAlternitive font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ChartBarAlternitive font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_24" class="mt-4">
          <:example>
            <ChartBarVertical font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ChartBarVertical font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_25" class="mt-4">
          <:example>
            <ChartBar font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ChartBar font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_26" class="mt-4">
          <:example>
            <ChartDashboard font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ChartDashboard font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_27" class="mt-4">
          <:example>
            <ChartFin font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ChartFin font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_28" class="mt-4">
          <:example>
            <ChartLine font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ChartLine font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_29" class="mt-4">
          <:example>
            <ChartPieChart font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ChartPieChart font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_30" class="mt-4">
          <:example>
            <ChartRelation font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ChartRelation font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_31" class="mt-4">
          <:example>
            <ChartRound font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ChartRound font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_32" class="mt-4">
          <:example>
            <ChatChat font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ChatChat font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_33" class="mt-4">
          <:example>
            <ChatCommentAdd font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ChatCommentAdd font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_34" class="mt-4">
          <:example>
            <ChatCommentBubbleAlert font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ChatCommentBubbleAlert font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_35" class="mt-4">
          <:example>
            <ChatCommentBubbleQuestionMark font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ChatCommentBubbleQuestionMark font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_36" class="mt-4">
          <:example>
            <ChatCommentBubble font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ChatCommentBubble font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_37" class="mt-4">
          <:example>
            <ChatCommentRemove font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ChatCommentRemove font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_38" class="mt-4">
          <:example>
            <ChatCommentText font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ChatCommentText font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_39" class="mt-4">
          <:example>
            <ChatComment font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ChatComment font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_40" class="mt-4">
          <:example>
            <ChatDoubleBubble font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ChatDoubleBubble font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_41" class="mt-4">
          <:example>
            <ChatStatsChat font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ChatStatsChat font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_42" class="mt-4">
          <:example>
            <ControlsChevronDownSmall font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ControlsChevronDownSmall font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_43" class="mt-4">
          <:example>
            <ControlsChevronDown font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ControlsChevronDown font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_44" class="mt-4">
          <:example>
            <ControlsChevronLeftSmall font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ControlsChevronLeftSmall font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_45" class="mt-4">
          <:example>
            <ControlsChevronLeft font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ControlsChevronLeft font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_46" class="mt-4">
          <:example>
            <ControlsChevronRightSmall font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ControlsChevronRightSmall font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_47" class="mt-4">
          <:example>
            <ControlsChevronRight font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ControlsChevronRight font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_48" class="mt-4">
          <:example>
            <ControlsChevronUpSmall font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ControlsChevronUpSmall font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_49" class="mt-4">
          <:example>
            <ControlsChevronUp font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ControlsChevronUp font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_50" class="mt-4">
          <:example>
            <ControlsClear font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ControlsClear font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_51" class="mt-4">
          <:example>
            <ControlsCloseSmall font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ControlsCloseSmall font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_52" class="mt-4">
          <:example>
            <ControlsClose font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ControlsClose font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_53" class="mt-4">
          <:example>
            <ControlsCollapse font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ControlsCollapse font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_54" class="mt-4">
          <:example>
            <ControlsDiagonalsInsight font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ControlsDiagonalsInsight font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_55" class="mt-4">
          <:example>
            <ControlsDiagonalsOutsight font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ControlsDiagonalsOutsight font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_56" class="mt-4">
          <:example>
            <ControlsExpand font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ControlsExpand font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_57" class="mt-4">
          <:example>
            <ControlsEyeCrossed font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ControlsEyeCrossed font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_58" class="mt-4">
          <:example>
            <ControlsEye font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ControlsEye font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_59" class="mt-4">
          <:example>
            <ControlsMinus font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ControlsMinus font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_60" class="mt-4">
          <:example>
            <ControlsPlus font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ControlsPlus font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_61" class="mt-4">
          <:example>
            <ControlsVerticalDoubleChevron font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ControlsVerticalDoubleChevron font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_62" class="mt-4">
          <:example>
            <DevicesBluetooth font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <DevicesBluetooth font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_63" class="mt-4">
          <:example>
            <DevicesJoystick font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <DevicesJoystick font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_64" class="mt-4">
          <:example>
            <DevicesKeyboard font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <DevicesKeyboard font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_65" class="mt-4">
          <:example>
            <DevicesMac font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <DevicesMac font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_66" class="mt-4">
          <:example>
            <DevicesMacbookAndIphone font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <DevicesMacbookAndIphone font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_67" class="mt-4">
          <:example>
            <DevicesMacbook font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <DevicesMacbook font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_68" class="mt-4">
          <:example>
            <DevicesMouse font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <DevicesMouse font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_69" class="mt-4">
          <:example>
            <DevicesPhone font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <DevicesPhone font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_70" class="mt-4">
          <:example>
            <DevicesSmartphone font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <DevicesSmartphone font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_71" class="mt-4">
          <:example>
            <DevicesTvBox font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <DevicesTvBox font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_72" class="mt-4">
          <:example>
            <FilesAdd font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <FilesAdd font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_73" class="mt-4">
          <:example>
            <FilesCase font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <FilesCase font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_74" class="mt-4">
          <:example>
            <FilesClipboardText font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <FilesClipboardText font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_75" class="mt-4">
          <:example>
            <FilesClipboard font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <FilesClipboard font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_76" class="mt-4">
          <:example>
            <FilesCode font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <FilesCode font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_77" class="mt-4">
          <:example>
            <FilesCopy font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <FilesCopy font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_78" class="mt-4">
          <:example>
            <FilesDelete font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <FilesDelete font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_79" class="mt-4">
          <:example>
            <FilesDraft font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <FilesDraft font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_80" class="mt-4">
          <:example>
            <FilesExport font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <FilesExport font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_81" class="mt-4">
          <:example>
            <FilesExternalLink font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <FilesExternalLink font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_82" class="mt-4">
          <:example>
            <FilesFile font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <FilesFile font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_83" class="mt-4">
          <:example>
            <FilesFolderClosed font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <FilesFolderClosed font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_84" class="mt-4">
          <:example>
            <FilesFolderOpenAlternative font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <FilesFolderOpenAlternative font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_85" class="mt-4">
          <:example>
            <FilesFolderOpen font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <FilesFolderOpen font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_86" class="mt-4">
          <:example>
            <FilesFolderZip font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <FilesFolderZip font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_87" class="mt-4">
          <:example>
            <FilesGlasses font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <FilesGlasses font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_88" class="mt-4">
          <:example>
            <FilesImport font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <FilesImport font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_89" class="mt-4">
          <:example>
            <FilesMagazine font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <FilesMagazine font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_90" class="mt-4">
          <:example>
            <FilesPrint font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <FilesPrint font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_91" class="mt-4">
          <:example>
            <FilesRemove font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <FilesRemove font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_92" class="mt-4">
          <:example>
            <FilesSave font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <FilesSave font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_93" class="mt-4">
          <:example>
            <FilesScan font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <FilesScan font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_94" class="mt-4">
          <:example>
            <FilesShare font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <FilesShare font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_95" class="mt-4">
          <:example>
            <FilesSticker font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <FilesSticker font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_96" class="mt-4">
          <:example>
            <FilesStickers font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <FilesStickers font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_97" class="mt-4">
          <:example>
            <FilesTable font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <FilesTable font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_98" class="mt-4">
          <:example>
            <FilesText font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <FilesText font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_99" class="mt-4">
          <:example>
            <GenericAbout font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <GenericAbout font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_100" class="mt-4">
          <:example>
            <GenericAlarmRound font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <GenericAlarmRound font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_101" class="mt-4">
          <:example>
            <GenericAlarm font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <GenericAlarm font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_102" class="mt-4">
          <:example>
            <GenericAmountNumber font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <GenericAmountNumber font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_103" class="mt-4">
          <:example>
            <GenericBet font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <GenericBet font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_104" class="mt-4">
          <:example>
            <GenericBlock font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <GenericBlock font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_105" class="mt-4">
          <:example>
            <GenericBookmark font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <GenericBookmark font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_106" class="mt-4">
          <:example>
            <GenericBrowser font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <GenericBrowser font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_107" class="mt-4">
          <:example>
            <GenericBurgerRegular font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <GenericBurgerRegular font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_108" class="mt-4">
          <:example>
            <GenericBurgerZig font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <GenericBurgerZig font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_109" class="mt-4">
          <:example>
            <GenericCheckAlternative font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <GenericCheckAlternative font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_110" class="mt-4">
          <:example>
            <GenericCheckRounded font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <GenericCheckRounded font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_111" class="mt-4">
          <:example>
            <GenericClose font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <GenericClose font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_112" class="mt-4">
          <:example>
            <GenericDelete font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <GenericDelete font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_113" class="mt-4">
          <:example>
            <GenericDislike font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <GenericDislike font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_114" class="mt-4">
          <:example>
            <GenericDownload font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <GenericDownload font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_115" class="mt-4">
          <:example>
            <GenericDragHandle font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <GenericDragHandle font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_116" class="mt-4">
          <:example>
            <GenericEdit font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <GenericEdit font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_117" class="mt-4">
          <:example>
            <GenericGlobe font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <GenericGlobe font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_118" class="mt-4">
          <:example>
            <GenericHeart font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <GenericHeart font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_119" class="mt-4">
          <:example>
            <GenericHelp font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <GenericHelp font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_120" class="mt-4">
          <:example>
            <GenericHome font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <GenericHome font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_121" class="mt-4">
          <:example>
            <GenericIdea font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <GenericIdea font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_122" class="mt-4">
          <:example>
            <GenericInfoAlternative font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <GenericInfoAlternative font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_123" class="mt-4">
          <:example>
            <GenericInfo font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <GenericInfo font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_124" class="mt-4">
          <:example>
            <GenericLike font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <GenericLike font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_125" class="mt-4">
          <:example>
            <GenericLink font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <GenericLink font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_126" class="mt-4">
          <:example>
            <GenericLogIn font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <GenericLogIn font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_127" class="mt-4">
          <:example>
            <GenericLogOut font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <GenericLogOut font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_128" class="mt-4">
          <:example>
            <GenericLoyalty font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <GenericLoyalty font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_129" class="mt-4">
          <:example>
            <GenericMention font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <GenericMention font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_130" class="mt-4">
          <:example>
            <GenericMenu font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <GenericMenu font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_131" class="mt-4">
          <:example>
            <GenericMinus font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <GenericMinus font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_132" class="mt-4">
          <:example>
            <GenericMultiBet font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <GenericMultiBet font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_133" class="mt-4">
          <:example>
            <GenericNews font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <GenericNews font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_134" class="mt-4">
          <:example>
            <GenericPicture font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <GenericPicture font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_135" class="mt-4">
          <:example>
            <GenericPlus font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <GenericPlus font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_136" class="mt-4">
          <:example>
            <GenericSearch font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <GenericSearch font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_137" class="mt-4">
          <:example>
            <GenericSettings font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <GenericSettings font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_138" class="mt-4">
          <:example>
            <GenericShareAndroid font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <GenericShareAndroid font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_139" class="mt-4">
          <:example>
            <GenericShareIosBig font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <GenericShareIosBig font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_140" class="mt-4">
          <:example>
            <GenericShareIos font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <GenericShareIos font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_141" class="mt-4">
          <:example>
            <GenericStar font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <GenericStar font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_142" class="mt-4">
          <:example>
            <GenericTag font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <GenericTag font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_143" class="mt-4">
          <:example>
            <GenericTicket font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <GenericTicket font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_144" class="mt-4">
          <:example>
            <GenericUpload font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <GenericUpload font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_145" class="mt-4">
          <:example>
            <GenericUser font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <GenericUser font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_146" class="mt-4">
          <:example>
            <GenericUsers font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <GenericUsers font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_147" class="mt-4">
          <:example>
            <MailBox font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <MailBox font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_148" class="mt-4">
          <:example>
            <MailEmailStats font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <MailEmailStats font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_149" class="mt-4">
          <:example>
            <MailEnvelope font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <MailEnvelope font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_150" class="mt-4">
          <:example>
            <MailFilterCrossed font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <MailFilterCrossed font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_151" class="mt-4">
          <:example>
            <MailFilter font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <MailFilter font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_152" class="mt-4">
          <:example>
            <MailFlag font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <MailFlag font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_153" class="mt-4">
          <:example>
            <MailLink font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <MailLink font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_154" class="mt-4">
          <:example>
            <MailSend font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <MailSend font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_155" class="mt-4">
          <:example>
            <MapsCompas font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <MapsCompas font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_156" class="mt-4">
          <:example>
            <MapsLocation font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <MapsLocation font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_157" class="mt-4">
          <:example>
            <MapsMap font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <MapsMap font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_158" class="mt-4">
          <:example>
            <MapsMarker font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <MapsMarker font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_159" class="mt-4">
          <:example>
            <MapsPanorama font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <MapsPanorama font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_160" class="mt-4">
          <:example>
            <MapsPinAdd font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <MapsPinAdd font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_161" class="mt-4">
          <:example>
            <MapsPinLocation font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <MapsPinLocation font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_162" class="mt-4">
          <:example>
            <MapsPin font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <MapsPin font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_163" class="mt-4">
          <:example>
            <MapsWorld font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <MapsWorld font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_164" class="mt-4">
          <:example>
            <MediaFastBack font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <MediaFastBack font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_165" class="mt-4">
          <:example>
            <MediaFastForward font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <MediaFastForward font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_166" class="mt-4">
          <:example>
            <MediaGif font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <MediaGif font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_167" class="mt-4">
          <:example>
            <MediaHeadphones font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <MediaHeadphones font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_168" class="mt-4">
          <:example>
            <MediaMegaphone font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <MediaMegaphone font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_169" class="mt-4">
          <:example>
            <MediaMiceAlternative font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <MediaMiceAlternative font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_170" class="mt-4">
          <:example>
            <MediaMice font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <MediaMice font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_171" class="mt-4">
          <:example>
            <MediaMonitor font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <MediaMonitor font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_172" class="mt-4">
          <:example>
            <MediaMusic font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <MediaMusic font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_173" class="mt-4">
          <:example>
            <MediaNoVolume font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <MediaNoVolume font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_174" class="mt-4">
          <:example>
            <MediaPause font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <MediaPause font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_175" class="mt-4">
          <:example>
            <MediaPhoto font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <MediaPhoto font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_176" class="mt-4">
          <:example>
            <MediaPlay font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <MediaPlay font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_177" class="mt-4">
          <:example>
            <MediaSoundwave font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <MediaSoundwave font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_178" class="mt-4">
          <:example>
            <MediaStop font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <MediaStop font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_179" class="mt-4">
          <:example>
            <MediaTunerAlternative font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <MediaTunerAlternative font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_180" class="mt-4">
          <:example>
            <MediaTuner font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <MediaTuner font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_181" class="mt-4">
          <:example>
            <MediaVideo font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <MediaVideo font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_182" class="mt-4">
          <:example>
            <MediaVolume font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <MediaVolume font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_183" class="mt-4">
          <:example>
            <NotificationsActivity font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <NotificationsActivity font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_184" class="mt-4">
          <:example>
            <NotificationsAddBell font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <NotificationsAddBell font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_185" class="mt-4">
          <:example>
            <NotificationsAlert font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <NotificationsAlert font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_186" class="mt-4">
          <:example>
            <NotificationsApp font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <NotificationsApp font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_187" class="mt-4">
          <:example>
            <NotificationsBellAlarm font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <NotificationsBellAlarm font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_188" class="mt-4">
          <:example>
            <NotificationsBellCross font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <NotificationsBellCross font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_189" class="mt-4">
          <:example>
            <NotificationsBellRingingAlternative font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <NotificationsBellRingingAlternative font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_190" class="mt-4">
          <:example>
            <NotificationsBellRinging font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <NotificationsBellRinging font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_191" class="mt-4">
          <:example>
            <NotificationsBell font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <NotificationsBell font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_192" class="mt-4">
          <:example>
            <NotificationsError font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <NotificationsError font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_193" class="mt-4">
          <:example>
            <NotificationsNotifications font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <NotificationsNotifications font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_194" class="mt-4">
          <:example>
            <NotificationsQuestionMark font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <NotificationsQuestionMark font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_195" class="mt-4">
          <:example>
            <NotificationsSettings font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <NotificationsSettings font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_196" class="mt-4">
          <:example>
            <OtherFrame font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <OtherFrame font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_197" class="mt-4">
          <:example>
            <OtherId font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <OtherId font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_198" class="mt-4">
          <:example>
            <OtherLightning font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <OtherLightning font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_199" class="mt-4">
          <:example>
            <OtherMoon font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <OtherMoon font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_200" class="mt-4">
          <:example>
            <OtherOther font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <OtherOther font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_201" class="mt-4">
          <:example>
            <OtherPlug font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <OtherPlug font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_202" class="mt-4">
          <:example>
            <OtherRewards font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <OtherRewards font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_203" class="mt-4">
          <:example>
            <OtherSad font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <OtherSad font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_204" class="mt-4">
          <:example>
            <OtherSmile font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <OtherSmile font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_205" class="mt-4">
          <:example>
            <OtherSun font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <OtherSun font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_206" class="mt-4">
          <:example>
            <OtherWater font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <OtherWater font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_207" class="mt-4">
          <:example>
            <Other3DotsHorizontal font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Other3DotsHorizontal font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_208" class="mt-4">
          <:example>
            <Other3Dots font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Other3Dots font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_209" class="mt-4">
          <:example>
            <SecurityKey font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SecurityKey font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_210" class="mt-4">
          <:example>
            <SecurityLock font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SecurityLock font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_211" class="mt-4">
          <:example>
            <SecurityMagnet font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SecurityMagnet font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_212" class="mt-4">
          <:example>
            <SecurityShieldSecured font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SecurityShieldSecured font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_213" class="mt-4">
          <:example>
            <SecurityShield font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SecurityShield font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_214" class="mt-4">
          <:example>
            <SecurityUmbrella font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SecurityUmbrella font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_215" class="mt-4">
          <:example>
            <SecurityUnlock font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SecurityUnlock font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_216" class="mt-4">
          <:example>
            <SecurityVerifiedFace font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SecurityVerifiedFace font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_217" class="mt-4">
          <:example>
            <SecurityVerified font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SecurityVerified font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_218" class="mt-4">
          <:example>
            <ShopBag font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ShopBag font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_219" class="mt-4">
          <:example>
            <ShopBasket font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ShopBasket font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_220" class="mt-4">
          <:example>
            <ShopCard font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ShopCard font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_221" class="mt-4">
          <:example>
            <ShopCart font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ShopCart font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_222" class="mt-4">
          <:example>
            <ShopCryptoCoin font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ShopCryptoCoin font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_223" class="mt-4">
          <:example>
            <ShopCrypto font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ShopCrypto font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_224" class="mt-4">
          <:example>
            <ShopWallet font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ShopWallet font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_225" class="mt-4">
          <:example>
            <ShopWirelessPay font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <ShopWirelessPay font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_226" class="mt-4">
          <:example>
            <SoftwareBug font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SoftwareBug font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_227" class="mt-4">
          <:example>
            <SoftwareCode font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SoftwareCode font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_228" class="mt-4">
          <:example>
            <SoftwareCursor font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SoftwareCursor font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_229" class="mt-4">
          <:example>
            <SoftwareDashboard font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SoftwareDashboard font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_230" class="mt-4">
          <:example>
            <SoftwareData font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SoftwareData font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_231" class="mt-4">
          <:example>
            <SoftwareDownload font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SoftwareDownload font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_232" class="mt-4">
          <:example>
            <SoftwareHand font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SoftwareHand font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_233" class="mt-4">
          <:example>
            <SoftwareLogOut font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SoftwareLogOut font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_234" class="mt-4">
          <:example>
            <SoftwareLogin font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SoftwareLogin font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_235" class="mt-4">
          <:example>
            <SoftwareNut font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SoftwareNut font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_236" class="mt-4">
          <:example>
            <SoftwarePlate font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SoftwarePlate font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_237" class="mt-4">
          <:example>
            <SoftwarePuzzle font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SoftwarePuzzle font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_238" class="mt-4">
          <:example>
            <SoftwareSettings font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SoftwareSettings font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_239" class="mt-4">
          <:example>
            <SoftwareShutdown font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SoftwareShutdown font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_240" class="mt-4">
          <:example>
            <SoftwareSorting font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SoftwareSorting font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_241" class="mt-4">
          <:example>
            <SoftwareWrench font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SoftwareWrench font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_242" class="mt-4">
          <:example>
            <SportAmericanFootball font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SportAmericanFootball font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_243" class="mt-4">
          <:example>
            <SportBadminton font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SportBadminton font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_244" class="mt-4">
          <:example>
            <SportBaseball font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SportBaseball font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_245" class="mt-4">
          <:example>
            <SportBasketball font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SportBasketball font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_246" class="mt-4">
          <:example>
            <SportBeachVolley font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SportBeachVolley font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_247" class="mt-4">
          <:example>
            <SportBeachVolleyball font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SportBeachVolleyball font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_248" class="mt-4">
          <:example>
            <SportBombay font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SportBombay font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_249" class="mt-4">
          <:example>
            <SportBoxing font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SportBoxing font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_250" class="mt-4">
          <:example>
            <SportCSGO font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SportCSGO font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_251" class="mt-4">
          <:example>
            <SportCasino font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SportCasino font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_252" class="mt-4">
          <:example>
            <SportCricket font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SportCricket font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_253" class="mt-4">
          <:example>
            <SportCrossCountry font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SportCrossCountry font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_254" class="mt-4">
          <:example>
            <SportCycling font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SportCycling font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_255" class="mt-4">
          <:example>
            <SportDarts font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SportDarts font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_256" class="mt-4">
          <:example>
            <SportDota2 font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SportDota2 font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_257" class="mt-4">
          <:example>
            <SportEsportGeneric font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SportEsportGeneric font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_258" class="mt-4">
          <:example>
            <SportFeatured font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SportFeatured font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_259" class="mt-4">
          <:example>
            <SportFieldHockey font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SportFieldHockey font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_260" class="mt-4">
          <:example>
            <SportFloorball font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SportFloorball font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_261" class="mt-4">
          <:example>
            <SportFutsal font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SportFutsal font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_262" class="mt-4">
          <:example>
            <SportGolf font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SportGolf font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_263" class="mt-4">
          <:example>
            <SportGreyhound font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SportGreyhound font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_264" class="mt-4">
          <:example>
            <SportHandball font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SportHandball font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_265" class="mt-4">
          <:example>
            <SportHarness font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SportHarness font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_266" class="mt-4">
          <:example>
            <SportHorseRacing font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SportHorseRacing font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_267" class="mt-4">
          <:example>
            <SportIceHockey font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SportIceHockey font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_268" class="mt-4">
          <:example>
            <SportLoL font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SportLoL font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_269" class="mt-4">
          <:example>
            <SportMMA font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SportMMA font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_270" class="mt-4">
          <:example>
            <SportMotor font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SportMotor font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_271" class="mt-4">
          <:example>
            <SportOverwatch font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SportOverwatch font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_272" class="mt-4">
          <:example>
            <SportRugby font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SportRugby font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_273" class="mt-4">
          <:example>
            <SportSetTennis font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SportSetTennis font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_274" class="mt-4">
          <:example>
            <SportSnooker font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SportSnooker font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_275" class="mt-4">
          <:example>
            <SportSoccer font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SportSoccer font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_276" class="mt-4">
          <:example>
            <SportSpecials font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SportSpecials font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_277" class="mt-4">
          <:example>
            <SportSportsbet font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SportSportsbet font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_278" class="mt-4">
          <:example>
            <SportTableTennis font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SportTableTennis font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_279" class="mt-4">
          <:example>
            <SportTennis font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SportTennis font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_280" class="mt-4">
          <:example>
            <SportWaterpolo font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <SportWaterpolo font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_281" class="mt-4">
          <:example>
            <TextAncor font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <TextAncor font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_282" class="mt-4">
          <:example>
            <TextAttach font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <TextAttach font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_283" class="mt-4">
          <:example>
            <TextBold font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <TextBold font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_284" class="mt-4">
          <:example>
            <TextBulletsList font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <TextBulletsList font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_285" class="mt-4">
          <:example>
            <TextCards font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <TextCards font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_286" class="mt-4">
          <:example>
            <TextCenter font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <TextCenter font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_287" class="mt-4">
          <:example>
            <TextClearFormatting font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <TextClearFormatting font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_288" class="mt-4">
          <:example>
            <TextCut font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <TextCut font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_289" class="mt-4">
          <:example>
            <TextDescreaseIndent font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <TextDescreaseIndent font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_290" class="mt-4">
          <:example>
            <TextIncertLine font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <TextIncertLine font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_291" class="mt-4">
          <:example>
            <TextIncreaseIndent font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <TextIncreaseIndent font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_292" class="mt-4">
          <:example>
            <TextItalic font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <TextItalic font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_293" class="mt-4">
          <:example>
            <TextLeftAlign font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <TextLeftAlign font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_294" class="mt-4">
          <:example>
            <TextMarker font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <TextMarker font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_295" class="mt-4">
          <:example>
            <TextMath font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <TextMath font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_296" class="mt-4">
          <:example>
            <TextNumbersList font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <TextNumbersList font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_297" class="mt-4">
          <:example>
            <TextRightAlign font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <TextRightAlign font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_298" class="mt-4">
          <:example>
            <TextSize font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <TextSize font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_299" class="mt-4">
          <:example>
            <TextStrikethrough font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <TextStrikethrough font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_300" class="mt-4">
          <:example>
            <TextStyle font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <TextStyle font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_301" class="mt-4">
          <:example>
            <TextTableAlternative font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <TextTableAlternative font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_302" class="mt-4">
          <:example>
            <TextTable font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <TextTable font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_303" class="mt-4">
          <:example>
            <TextUnderline font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <TextUnderline font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_304" class="mt-4">
          <:example>
            <TimeAlarm font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <TimeAlarm font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_305" class="mt-4">
          <:example>
            <TimeCalendarAdd font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <TimeCalendarAdd font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_306" class="mt-4">
          <:example>
            <TimeCalendarAlternative font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <TimeCalendarAlternative font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_307" class="mt-4">
          <:example>
            <TimeCalendarDate font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <TimeCalendarDate font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_308" class="mt-4">
          <:example>
            <TimeCalendarRemove font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <TimeCalendarRemove font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_309" class="mt-4">
          <:example>
            <TimeCalendarSucsess font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <TimeCalendarSucsess font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_310" class="mt-4">
          <:example>
            <TimeCalendar font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <TimeCalendar font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_311" class="mt-4">
          <:example>
            <TimeClock font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <TimeClock font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_312" class="mt-4">
          <:example>
            <TimeSandglass font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <TimeSandglass font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_313" class="mt-4">
          <:example>
            <TimeStopwatchTimer font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <TimeStopwatchTimer font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_314" class="mt-4">
          <:example>
            <TimeStopwatch font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <TimeStopwatch font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_315" class="mt-4">
          <:example>
            <TimeTime font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <TimeTime font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_316" class="mt-4">
          <:example>
            <TimeWatch font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <TimeWatch font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_317" class="mt-4">
          <:example>
            <TypeClosedHand font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <TypeClosedHand font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_318" class="mt-4">
          <:example>
            <TypeDefault font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <TypeDefault font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_319" class="mt-4">
          <:example>
            <TypeHandPointing font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <TypeHandPointing font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_320" class="mt-4">
          <:example>
            <TypeHelp font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <TypeHelp font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_321" class="mt-4">
          <:example>
            <TypeMove font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <TypeMove font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_322" class="mt-4">
          <:example>
            <TypeNotAllowed font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <TypeNotAllowed font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_323" class="mt-4">
          <:example>
            <TypeOpenedHand font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <TypeOpenedHand font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_324" class="mt-4">
          <:example>
            <TypeText font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <TypeText font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_325" class="mt-4">
          <:example>
            <TypeZoomIn font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <TypeZoomIn font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="icon_326" class="mt-4">
          <:example>
            <TypeZoomOut font_size="5rem" />
          </:example>

          <:code>
            <#CodePreview>
              <TypeZoomOut font_size="5rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>
      </TopToDown>
    </Page>
    """
  end
end
