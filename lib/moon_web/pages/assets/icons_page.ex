defmodule MoonWeb.Pages.Assets.IconsPage do
  use MoonWeb, :live_view

  alias MoonWeb.Components.Breadcrumbs
  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Heading
  alias MoonWeb.Components.ExampleAndCode
  alias Moon.Components.CodePreview
  alias Moon.Assets.Icons
  alias MoonWeb.Components.Footer
  alias MoonWeb.Components.ThemesSelect

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

  alias Icons.Arrowsbottomleft
  alias Icons.Arrowsbottomright
  alias Icons.Arrowschevrondowndouble
  alias Icons.Arrowschevronleftdouble
  alias Icons.Arrowschevronrightdouble
  alias Icons.Arrowschevronupdouble
  alias Icons.Arrowsdiagonalsbltr
  alias Icons.Arrowsdiagonalstlbr
  alias Icons.Arrowsdown
  alias Icons.Arrowsforward
  alias Icons.Arrowsleft
  alias Icons.Arrowsleftcurved
  alias Icons.Arrowsrefresh
  alias Icons.Arrowsreply
  alias Icons.Arrowsright
  alias Icons.Arrowsrightcurved
  alias Icons.Arrowstopleft
  alias Icons.Arrowstopright
  alias Icons.Arrowstransfer
  alias Icons.Arrowsup
  alias Icons.Arrowsupdate
  alias Icons.Chartarea
  alias Icons.Chartbar
  alias Icons.Chartbaralternitive
  alias Icons.Chartbarvertical
  alias Icons.Chartdashboard
  alias Icons.Chartfin
  alias Icons.Chartline
  alias Icons.Chartpiechart
  alias Icons.Chartrelation
  alias Icons.Chartround
  alias Icons.Chatchat
  alias Icons.Chatcomment
  alias Icons.Chatcommentadd
  alias Icons.Chatcommentbubble
  alias Icons.Chatcommentbubblealert
  alias Icons.Chatcommentbubblequestionmark
  alias Icons.Chatcommentremove
  alias Icons.Chatcommenttext
  alias Icons.Chatdoublebubble
  alias Icons.Chatstatschat
  alias Icons.Controlschevrondown
  alias Icons.Controlschevrondownsmall
  alias Icons.Controlschevronleft
  alias Icons.Controlschevronleftsmall
  alias Icons.Controlschevronright
  alias Icons.Controlschevronrightsmall
  alias Icons.Controlschevronup
  alias Icons.Controlschevronupsmall
  alias Icons.Controlsclear
  alias Icons.Controlsclose
  alias Icons.Controlsclosesmall
  alias Icons.Controlscollapse
  alias Icons.Controlsdiagonalsinsight
  alias Icons.Controlsdiagonalsoutsight
  alias Icons.Controlsexpand
  alias Icons.Controlseye
  alias Icons.Controlseyecrossed
  alias Icons.Controlsminus
  alias Icons.Controlsplus
  alias Icons.Controlsverticaldoublechevron
  alias Icons.Devicesbluetooth
  alias Icons.Devicesjoystick
  alias Icons.Deviceskeyboard
  alias Icons.Devicesmac
  alias Icons.Devicesmacbook
  alias Icons.Devicesmacbookandiphone
  alias Icons.Devicesmouse
  alias Icons.Devicesphone
  alias Icons.Devicessmartphone
  alias Icons.Devicestvbox
  alias Icons.Filesadd
  alias Icons.Filescase
  alias Icons.Filesclipboard
  alias Icons.Filesclipboardtext
  alias Icons.Filescode
  alias Icons.Filescopy
  alias Icons.Filesdelete
  alias Icons.Filesdraft
  alias Icons.Filesexport
  alias Icons.Filesexternallink
  alias Icons.Filesfile
  alias Icons.Filesfolderclosed
  alias Icons.Filesfolderopen
  alias Icons.Filesfolderopenalternative
  alias Icons.Filesfolderzip
  alias Icons.Filesglasses
  alias Icons.Filesimport
  alias Icons.Filesmagazine
  alias Icons.Filesprint
  alias Icons.Filesremove
  alias Icons.Filessave
  alias Icons.Filesscan
  alias Icons.Filesshare
  alias Icons.Filessticker
  alias Icons.Filesstickers
  alias Icons.Filestable
  alias Icons.Filestext
  alias Icons.Genericabout
  alias Icons.Genericalarm
  alias Icons.Genericalarmround
  alias Icons.Genericamountnumber
  alias Icons.Genericbet
  alias Icons.Genericblock
  alias Icons.Genericbookmark
  alias Icons.Genericbrowser
  alias Icons.Genericburgerregular
  alias Icons.Genericburgerzig
  alias Icons.Genericcheckalternative
  alias Icons.Genericcheckrounded
  alias Icons.Genericclose
  alias Icons.Genericdelete
  alias Icons.Genericdislike
  alias Icons.Genericdownload
  alias Icons.Genericdraghandle
  alias Icons.Genericedit
  alias Icons.Genericglobe
  alias Icons.Genericheart
  alias Icons.Generichelp
  alias Icons.Generichome
  alias Icons.Genericidea
  alias Icons.Genericinfo
  alias Icons.Genericinfoalternative
  alias Icons.Genericlike
  alias Icons.Genericlink
  alias Icons.Genericlogin
  alias Icons.Genericlogout
  alias Icons.Genericloyalty
  alias Icons.Genericmention
  alias Icons.Genericmenu
  alias Icons.Genericminus
  alias Icons.Genericmultibet
  alias Icons.Genericnews
  alias Icons.Genericpicture
  alias Icons.Genericplus
  alias Icons.Genericsearch
  alias Icons.Genericsettings
  alias Icons.Genericshareandroid
  alias Icons.Genericshareios
  alias Icons.Genericshareiosbig
  alias Icons.Genericstar
  alias Icons.Generictag
  alias Icons.Genericticket
  alias Icons.Genericupload
  alias Icons.Genericuser
  alias Icons.Genericusers
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
  alias Icons.Mailbox
  alias Icons.Mailemailstats
  alias Icons.Mailenvelope
  alias Icons.Mailfilter
  alias Icons.Mailfiltercrossed
  alias Icons.Mailflag
  alias Icons.Maillink
  alias Icons.Mailsend
  alias Icons.Mapscompas
  alias Icons.Mapslocation
  alias Icons.Mapsmap
  alias Icons.Mapsmarker
  alias Icons.Mapspanorama
  alias Icons.Mapspin
  alias Icons.Mapspinadd
  alias Icons.Mapspinlocation
  alias Icons.Mapsworld
  alias Icons.Mediafastback
  alias Icons.Mediafastforward
  alias Icons.Mediagif
  alias Icons.Mediaheadphones
  alias Icons.Mediamegaphone
  alias Icons.Mediamice
  alias Icons.Mediamicealternative
  alias Icons.Mediamonitor
  alias Icons.Mediamusic
  alias Icons.Medianovolume
  alias Icons.Mediapause
  alias Icons.Mediaphoto
  alias Icons.Mediaplay
  alias Icons.Mediasoundwave
  alias Icons.Mediastop
  alias Icons.Mediatuner
  alias Icons.Mediatuneralternative
  alias Icons.Mediavideo
  alias Icons.Mediavolume
  alias Icons.Notificationsactivity
  alias Icons.Notificationsaddbell
  alias Icons.Notificationsalert
  alias Icons.Notificationsapp
  alias Icons.Notificationsbell
  alias Icons.Notificationsbellalarm
  alias Icons.Notificationsbellcross
  alias Icons.Notificationsbellringing
  alias Icons.Notificationsbellringingalternative
  alias Icons.Notificationserror
  alias Icons.Notificationsnotifications
  alias Icons.Notificationsquestionmark
  alias Icons.Notificationssettings
  alias Icons.Other3dots
  alias Icons.Other3dotshorizontal
  alias Icons.Otherframe
  alias Icons.Otherid
  alias Icons.Otherlightning
  alias Icons.Othermoon
  alias Icons.Otherother
  alias Icons.Otherplug
  alias Icons.Otherrewards
  alias Icons.Othersad
  alias Icons.Othersmile
  alias Icons.Othersun
  alias Icons.Otherwater
  alias Icons.Securitykey
  alias Icons.Securitylock
  alias Icons.Securitymagnet
  alias Icons.Securityshield
  alias Icons.Securityshieldsecured
  alias Icons.Securityumbrella
  alias Icons.Securityunlock
  alias Icons.Securityverified
  alias Icons.Securityverifiedface
  alias Icons.Shopbag
  alias Icons.Shopbasket
  alias Icons.Shopcard
  alias Icons.Shopcart
  alias Icons.Shopcrypto
  alias Icons.Shopcryptocoin
  alias Icons.Shopwallet
  alias Icons.Shopwirelesspay
  alias Icons.Softwarebug
  alias Icons.Softwarecode
  alias Icons.Softwarecursor
  alias Icons.Softwaredashboard
  alias Icons.Softwaredata
  alias Icons.Softwaredownload
  alias Icons.Softwarehand
  alias Icons.Softwarelogin
  alias Icons.Softwarelogout
  alias Icons.Softwarenut
  alias Icons.Softwareplate
  alias Icons.Softwarepuzzle
  alias Icons.Softwaresettings
  alias Icons.Softwareshutdown
  alias Icons.Softwaresorting
  alias Icons.Softwarewrench
  alias Icons.Sportamericanfootball
  alias Icons.Sportbadminton
  alias Icons.Sportbaseball
  alias Icons.Sportbasketball
  alias Icons.Sportbeachvolley
  alias Icons.Sportbeachvolleyball
  alias Icons.Sportbombay
  alias Icons.Sportboxing
  alias Icons.Sportcasino
  alias Icons.Sportcricket
  alias Icons.Sportcrosscountry
  alias Icons.Sportcsgo
  alias Icons.Sportcycling
  alias Icons.Sportdarts
  alias Icons.Sportdota2
  alias Icons.Sportesportgeneric
  alias Icons.Sportfeatured
  alias Icons.Sportfieldhockey
  alias Icons.Sportfloorball
  alias Icons.Sportfutsal
  alias Icons.Sportgolf
  alias Icons.Sportgreyhound
  alias Icons.Sporthandball
  alias Icons.Sportharness
  alias Icons.Sporthorseracing
  alias Icons.Sporticehockey
  alias Icons.Sportlol
  alias Icons.Sportmma
  alias Icons.Sportmotor
  alias Icons.Sportoverwatch
  alias Icons.Sportrugby
  alias Icons.Sportsettennis
  alias Icons.Sportsnooker
  alias Icons.Sportsoccer
  alias Icons.Sportspecials
  alias Icons.Sportsportsbet
  alias Icons.Sporttabletennis
  alias Icons.Sporttennis
  alias Icons.Sportwaterpolo
  alias Icons.Textancor
  alias Icons.Textattach
  alias Icons.Textbold
  alias Icons.Textbulletslist
  alias Icons.Textcards
  alias Icons.Textcenter
  alias Icons.Textclearformatting
  alias Icons.Textcut
  alias Icons.Textdescreaseindent
  alias Icons.Textincertline
  alias Icons.Textincreaseindent
  alias Icons.Textitalic
  alias Icons.Textleftalign
  alias Icons.Textmarker
  alias Icons.Textmath
  alias Icons.Textnumberslist
  alias Icons.Textrightalign
  alias Icons.Textsize
  alias Icons.Textstrikethrough
  alias Icons.Textstyle
  alias Icons.Texttable
  alias Icons.Texttablealternative
  alias Icons.Textunderline
  alias Icons.Timealarm
  alias Icons.Timecalendar
  alias Icons.Timecalendaradd
  alias Icons.Timecalendaralternative
  alias Icons.Timecalendardate
  alias Icons.Timecalendarremove
  alias Icons.Timecalendarsucsess
  alias Icons.Timeclock
  alias Icons.Timesandglass
  alias Icons.Timestopwatch
  alias Icons.Timestopwatchtimer
  alias Icons.Timetime
  alias Icons.Timewatch
  alias Icons.Typeclosedhand
  alias Icons.Typedefault
  alias Icons.Typehandpointing
  alias Icons.Typehelp
  alias Icons.Typemove
  alias Icons.Typenotallowed
  alias Icons.Typeopenedhand
  alias Icons.Typetext
  alias Icons.Typezoomin
  alias Icons.Typezoomout

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
          <Arrowsbottomleft font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Arrowsbottomleft font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_2" class="mt-4">
        <:example>
          <Arrowsbottomright font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Arrowsbottomright font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_3" class="mt-4">
        <:example>
          <Arrowschevrondowndouble font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Arrowschevrondowndouble font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_4" class="mt-4">
        <:example>
          <Arrowschevronleftdouble font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Arrowschevronleftdouble font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_5" class="mt-4">
        <:example>
          <Arrowschevronrightdouble font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Arrowschevronrightdouble font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_6" class="mt-4">
        <:example>
          <Arrowschevronupdouble font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Arrowschevronupdouble font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_7" class="mt-4">
        <:example>
          <Arrowsdiagonalsbltr font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Arrowsdiagonalsbltr font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_8" class="mt-4">
        <:example>
          <Arrowsdiagonalstlbr font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Arrowsdiagonalstlbr font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_9" class="mt-4">
        <:example>
          <Arrowsdown font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Arrowsdown font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_10" class="mt-4">
        <:example>
          <Arrowsforward font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Arrowsforward font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_11" class="mt-4">
        <:example>
          <Arrowsleft font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Arrowsleft font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_12" class="mt-4">
        <:example>
          <Arrowsleftcurved font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Arrowsleftcurved font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_13" class="mt-4">
        <:example>
          <Arrowsrefresh font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Arrowsrefresh font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_14" class="mt-4">
        <:example>
          <Arrowsreply font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Arrowsreply font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_15" class="mt-4">
        <:example>
          <Arrowsright font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Arrowsright font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_16" class="mt-4">
        <:example>
          <Arrowsrightcurved font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Arrowsrightcurved font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_17" class="mt-4">
        <:example>
          <Arrowstopleft font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Arrowstopleft font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_18" class="mt-4">
        <:example>
          <Arrowstopright font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Arrowstopright font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_19" class="mt-4">
        <:example>
          <Arrowstransfer font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Arrowstransfer font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_20" class="mt-4">
        <:example>
          <Arrowsup font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Arrowsup font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_21" class="mt-4">
        <:example>
          <Arrowsupdate font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Arrowsupdate font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_22" class="mt-4">
        <:example>
          <Chartarea font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Chartarea font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_23" class="mt-4">
        <:example>
          <Chartbar font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Chartbar font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_24" class="mt-4">
        <:example>
          <Chartbaralternitive font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Chartbaralternitive font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_25" class="mt-4">
        <:example>
          <Chartbarvertical font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Chartbarvertical font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_26" class="mt-4">
        <:example>
          <Chartdashboard font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Chartdashboard font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_27" class="mt-4">
        <:example>
          <Chartfin font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Chartfin font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_28" class="mt-4">
        <:example>
          <Chartline font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Chartline font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_29" class="mt-4">
        <:example>
          <Chartpiechart font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Chartpiechart font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_30" class="mt-4">
        <:example>
          <Chartrelation font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Chartrelation font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_31" class="mt-4">
        <:example>
          <Chartround font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Chartround font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_32" class="mt-4">
        <:example>
          <Chatchat font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Chatchat font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_33" class="mt-4">
        <:example>
          <Chatcomment font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Chatcomment font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_34" class="mt-4">
        <:example>
          <Chatcommentadd font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Chatcommentadd font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_35" class="mt-4">
        <:example>
          <Chatcommentbubble font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Chatcommentbubble font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_36" class="mt-4">
        <:example>
          <Chatcommentbubblealert font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Chatcommentbubblealert font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_37" class="mt-4">
        <:example>
          <Chatcommentbubblequestionmark font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Chatcommentbubblequestionmark font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_38" class="mt-4">
        <:example>
          <Chatcommentremove font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Chatcommentremove font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_39" class="mt-4">
        <:example>
          <Chatcommenttext font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Chatcommenttext font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_40" class="mt-4">
        <:example>
          <Chatdoublebubble font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Chatdoublebubble font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_41" class="mt-4">
        <:example>
          <Chatstatschat font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Chatstatschat font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_42" class="mt-4">
        <:example>
          <Controlschevrondown font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Controlschevrondown font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_43" class="mt-4">
        <:example>
          <Controlschevrondownsmall font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Controlschevrondownsmall font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_44" class="mt-4">
        <:example>
          <Controlschevronleft font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Controlschevronleft font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_45" class="mt-4">
        <:example>
          <Controlschevronleftsmall font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Controlschevronleftsmall font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_46" class="mt-4">
        <:example>
          <Controlschevronright font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Controlschevronright font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_47" class="mt-4">
        <:example>
          <Controlschevronrightsmall font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Controlschevronrightsmall font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_48" class="mt-4">
        <:example>
          <Controlschevronup font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Controlschevronup font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_49" class="mt-4">
        <:example>
          <Controlschevronupsmall font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Controlschevronupsmall font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_50" class="mt-4">
        <:example>
          <Controlsclear font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Controlsclear font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_51" class="mt-4">
        <:example>
          <Controlsclose font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Controlsclose font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_52" class="mt-4">
        <:example>
          <Controlsclosesmall font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Controlsclosesmall font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_53" class="mt-4">
        <:example>
          <Controlscollapse font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Controlscollapse font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_54" class="mt-4">
        <:example>
          <Controlsdiagonalsinsight font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Controlsdiagonalsinsight font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_55" class="mt-4">
        <:example>
          <Controlsdiagonalsoutsight font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Controlsdiagonalsoutsight font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_56" class="mt-4">
        <:example>
          <Controlsexpand font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Controlsexpand font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_57" class="mt-4">
        <:example>
          <Controlseye font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Controlseye font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_58" class="mt-4">
        <:example>
          <Controlseyecrossed font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Controlseyecrossed font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_59" class="mt-4">
        <:example>
          <Controlsminus font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Controlsminus font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_60" class="mt-4">
        <:example>
          <Controlsplus font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Controlsplus font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_61" class="mt-4">
        <:example>
          <Controlsverticaldoublechevron font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Controlsverticaldoublechevron font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_62" class="mt-4">
        <:example>
          <Devicesbluetooth font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Devicesbluetooth font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_63" class="mt-4">
        <:example>
          <Devicesjoystick font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Devicesjoystick font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_64" class="mt-4">
        <:example>
          <Deviceskeyboard font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Deviceskeyboard font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_65" class="mt-4">
        <:example>
          <Devicesmac font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Devicesmac font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_66" class="mt-4">
        <:example>
          <Devicesmacbook font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Devicesmacbook font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_67" class="mt-4">
        <:example>
          <Devicesmacbookandiphone font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Devicesmacbookandiphone font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_68" class="mt-4">
        <:example>
          <Devicesmouse font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Devicesmouse font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_69" class="mt-4">
        <:example>
          <Devicesphone font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Devicesphone font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_70" class="mt-4">
        <:example>
          <Devicessmartphone font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Devicessmartphone font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_71" class="mt-4">
        <:example>
          <Devicestvbox font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Devicestvbox font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_72" class="mt-4">
        <:example>
          <Filesadd font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Filesadd font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_73" class="mt-4">
        <:example>
          <Filescase font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Filescase font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_74" class="mt-4">
        <:example>
          <Filesclipboard font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Filesclipboard font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_75" class="mt-4">
        <:example>
          <Filesclipboardtext font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Filesclipboardtext font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_76" class="mt-4">
        <:example>
          <Filescode font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Filescode font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_77" class="mt-4">
        <:example>
          <Filescopy font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Filescopy font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_78" class="mt-4">
        <:example>
          <Filesdelete font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Filesdelete font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_79" class="mt-4">
        <:example>
          <Filesdraft font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Filesdraft font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_80" class="mt-4">
        <:example>
          <Filesexport font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Filesexport font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_81" class="mt-4">
        <:example>
          <Filesexternallink font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Filesexternallink font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_82" class="mt-4">
        <:example>
          <Filesfile font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Filesfile font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_83" class="mt-4">
        <:example>
          <Filesfolderclosed font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Filesfolderclosed font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_84" class="mt-4">
        <:example>
          <Filesfolderopen font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Filesfolderopen font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_85" class="mt-4">
        <:example>
          <Filesfolderopenalternative font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Filesfolderopenalternative font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_86" class="mt-4">
        <:example>
          <Filesfolderzip font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Filesfolderzip font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_87" class="mt-4">
        <:example>
          <Filesglasses font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Filesglasses font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_88" class="mt-4">
        <:example>
          <Filesimport font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Filesimport font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_89" class="mt-4">
        <:example>
          <Filesmagazine font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Filesmagazine font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_90" class="mt-4">
        <:example>
          <Filesprint font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Filesprint font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_91" class="mt-4">
        <:example>
          <Filesremove font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Filesremove font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_92" class="mt-4">
        <:example>
          <Filessave font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Filessave font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_93" class="mt-4">
        <:example>
          <Filesscan font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Filesscan font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_94" class="mt-4">
        <:example>
          <Filesshare font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Filesshare font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_95" class="mt-4">
        <:example>
          <Filessticker font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Filessticker font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_96" class="mt-4">
        <:example>
          <Filesstickers font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Filesstickers font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_97" class="mt-4">
        <:example>
          <Filestable font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Filestable font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_98" class="mt-4">
        <:example>
          <Filestext font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Filestext font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_99" class="mt-4">
        <:example>
          <Genericabout font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Genericabout font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_100" class="mt-4">
        <:example>
          <Genericalarm font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Genericalarm font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_101" class="mt-4">
        <:example>
          <Genericalarmround font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Genericalarmround font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_102" class="mt-4">
        <:example>
          <Genericamountnumber font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Genericamountnumber font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_103" class="mt-4">
        <:example>
          <Genericbet font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Genericbet font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_104" class="mt-4">
        <:example>
          <Genericblock font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Genericblock font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_105" class="mt-4">
        <:example>
          <Genericbookmark font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Genericbookmark font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_106" class="mt-4">
        <:example>
          <Genericbrowser font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Genericbrowser font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_107" class="mt-4">
        <:example>
          <Genericburgerregular font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Genericburgerregular font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_108" class="mt-4">
        <:example>
          <Genericburgerzig font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Genericburgerzig font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_109" class="mt-4">
        <:example>
          <Genericcheckalternative font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Genericcheckalternative font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_110" class="mt-4">
        <:example>
          <Genericcheckrounded font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Genericcheckrounded font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_111" class="mt-4">
        <:example>
          <Genericclose font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Genericclose font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_112" class="mt-4">
        <:example>
          <Genericdelete font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Genericdelete font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_113" class="mt-4">
        <:example>
          <Genericdislike font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Genericdislike font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_114" class="mt-4">
        <:example>
          <Genericdownload font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Genericdownload font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_115" class="mt-4">
        <:example>
          <Genericdraghandle font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Genericdraghandle font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_116" class="mt-4">
        <:example>
          <Genericedit font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Genericedit font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_117" class="mt-4">
        <:example>
          <Genericglobe font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Genericglobe font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_118" class="mt-4">
        <:example>
          <Genericheart font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Genericheart font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_119" class="mt-4">
        <:example>
          <Generichelp font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Generichelp font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_120" class="mt-4">
        <:example>
          <Generichome font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Generichome font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_121" class="mt-4">
        <:example>
          <Genericidea font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Genericidea font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_122" class="mt-4">
        <:example>
          <Genericinfo font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Genericinfo font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_123" class="mt-4">
        <:example>
          <Genericinfoalternative font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Genericinfoalternative font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_124" class="mt-4">
        <:example>
          <Genericlike font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Genericlike font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_125" class="mt-4">
        <:example>
          <Genericlink font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Genericlink font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_126" class="mt-4">
        <:example>
          <Genericlogin font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Genericlogin font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_127" class="mt-4">
        <:example>
          <Genericlogout font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Genericlogout font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_128" class="mt-4">
        <:example>
          <Genericloyalty font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Genericloyalty font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_129" class="mt-4">
        <:example>
          <Genericmention font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Genericmention font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_130" class="mt-4">
        <:example>
          <Genericmenu font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Genericmenu font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_131" class="mt-4">
        <:example>
          <Genericminus font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Genericminus font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_132" class="mt-4">
        <:example>
          <Genericmultibet font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Genericmultibet font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_133" class="mt-4">
        <:example>
          <Genericnews font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Genericnews font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_134" class="mt-4">
        <:example>
          <Genericpicture font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Genericpicture font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_135" class="mt-4">
        <:example>
          <Genericplus font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Genericplus font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_136" class="mt-4">
        <:example>
          <Genericsearch font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Genericsearch font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_137" class="mt-4">
        <:example>
          <Genericsettings font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Genericsettings font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_138" class="mt-4">
        <:example>
          <Genericshareandroid font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Genericshareandroid font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_139" class="mt-4">
        <:example>
          <Genericshareios font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Genericshareios font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_140" class="mt-4">
        <:example>
          <Genericshareiosbig font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Genericshareiosbig font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_141" class="mt-4">
        <:example>
          <Genericstar font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Genericstar font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_142" class="mt-4">
        <:example>
          <Generictag font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Generictag font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_143" class="mt-4">
        <:example>
          <Genericticket font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Genericticket font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_144" class="mt-4">
        <:example>
          <Genericupload font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Genericupload font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_145" class="mt-4">
        <:example>
          <Genericuser font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Genericuser font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_146" class="mt-4">
        <:example>
          <Genericusers font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Genericusers font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_147" class="mt-4">
        <:example>
          <IconAbout font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconAbout font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_148" class="mt-4">
        <:example>
          <IconAdd font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconAdd font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_149" class="mt-4">
        <:example>
          <IconAlertCircle font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconAlertCircle font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_150" class="mt-4">
        <:example>
          <IconAlignLeft font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconAlignLeft font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_151" class="mt-4">
        <:example>
          <IconAllSports font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconAllSports font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_152" class="mt-4">
        <:example>
          <IconArrowDiagonalDownLeft font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconArrowDiagonalDownLeft font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_153" class="mt-4">
        <:example>
          <IconArrowDiagonalUpRight font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconArrowDiagonalUpRight font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_154" class="mt-4">
        <:example>
          <IconArrowDiagonals font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconArrowDiagonals font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_155" class="mt-4">
        <:example>
          <IconArrowDown font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconArrowDown font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_156" class="mt-4">
        <:example>
          <IconArrowLDown font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconArrowLDown font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_157" class="mt-4">
        <:example>
          <IconArrowLUp font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconArrowLUp font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_158" class="mt-4">
        <:example>
          <IconArrowLeftRight font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconArrowLeftRight font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_159" class="mt-4">
        <:example>
          <IconArrowLeft font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconArrowLeft font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_160" class="mt-4">
        <:example>
          <IconArrowRight font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconArrowRight font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_161" class="mt-4">
        <:example>
          <IconArrowTopRight font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconArrowTopRight font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_162" class="mt-4">
        <:example>
          <IconArrowUpDown font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconArrowUpDown font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_163" class="mt-4">
        <:example>
          <IconArrowUp font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconArrowUp font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_164" class="mt-4">
        <:example>
          <IconAsianView font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconAsianView font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_165" class="mt-4">
        <:example>
          <IconAttache font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconAttache font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_166" class="mt-4">
        <:example>
          <IconAward font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconAward font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_167" class="mt-4">
        <:example>
          <IconBannerInfo font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconBannerInfo font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_168" class="mt-4">
        <:example>
          <IconBell font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconBell font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_169" class="mt-4">
        <:example>
          <IconBitcoinTalk font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconBitcoinTalk font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_170" class="mt-4">
        <:example>
          <IconBombayClub font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconBombayClub font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_171" class="mt-4">
        <:example>
          <IconBurger font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconBurger font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_172" class="mt-4">
        <:example>
          <IconCalendarEmpty font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCalendarEmpty font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_173" class="mt-4">
        <:example>
          <IconCalendar font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCalendar font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_174" class="mt-4">
        <:example>
          <IconCard font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCard font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_175" class="mt-4">
        <:example>
          <IconCase font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCase font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_176" class="mt-4">
        <:example>
          <IconCashOut font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCashOut font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_177" class="mt-4">
        <:example>
          <IconCasinoBell font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCasinoBell font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_178" class="mt-4">
        <:example>
          <IconCasino font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCasino font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_179" class="mt-4">
        <:example>
          <IconChartArea font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconChartArea font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_180" class="mt-4">
        <:example>
          <IconChartBar font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconChartBar font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_181" class="mt-4">
        <:example>
          <IconChartPies font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconChartPies font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_182" class="mt-4">
        <:example>
          <IconChartRound font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconChartRound font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_183" class="mt-4">
        <:example>
          <IconChartSegment font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconChartSegment font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_184" class="mt-4">
        <:example>
          <IconChevronDownRounded font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconChevronDownRounded font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_185" class="mt-4">
        <:example>
          <IconChevronDown font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconChevronDown font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_186" class="mt-4">
        <:example>
          <IconChevronLeftRounded font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconChevronLeftRounded font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_187" class="mt-4">
        <:example>
          <IconChevronLeft font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconChevronLeft font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_188" class="mt-4">
        <:example>
          <IconChevronRightRounded font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconChevronRightRounded font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_189" class="mt-4">
        <:example>
          <IconChevronRight font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconChevronRight font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_190" class="mt-4">
        <:example>
          <IconChevronUpDown font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconChevronUpDown font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_191" class="mt-4">
        <:example>
          <IconChevronUpRounded font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconChevronUpRounded font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_192" class="mt-4">
        <:example>
          <IconChevronUp font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconChevronUp font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_193" class="mt-4">
        <:example>
          <IconCircle font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCircle font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_194" class="mt-4">
        <:example>
          <IconClaps font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconClaps font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_195" class="mt-4">
        <:example>
          <IconClock font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconClock font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_196" class="mt-4">
        <:example>
          <IconCloseRounded font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCloseRounded font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_197" class="mt-4">
        <:example>
          <IconCloseSmall font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCloseSmall font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_198" class="mt-4">
        <:example>
          <IconClose font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconClose font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_199" class="mt-4">
        <:example>
          <IconCode font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCode font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_200" class="mt-4">
        <:example>
          <IconCollapse font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCollapse font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_201" class="mt-4">
        <:example>
          <IconCopy font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCopy font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_202" class="mt-4">
        <:example>
          <IconCredit font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCredit font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_203" class="mt-4">
        <:example>
          <IconCrypto font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCrypto font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_204" class="mt-4">
        <:example>
          <IconCurrencyAda font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyAda font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_205" class="mt-4">
        <:example>
          <IconCurrencyArs font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyArs font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_206" class="mt-4">
        <:example>
          <IconCurrencyBdt font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyBdt font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_207" class="mt-4">
        <:example>
          <IconCurrencyBob font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyBob font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_208" class="mt-4">
        <:example>
          <IconCurrencyBrl font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyBrl font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_209" class="mt-4">
        <:example>
          <IconCurrencyBtc font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyBtc font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_210" class="mt-4">
        <:example>
          <IconCurrencyCad font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyCad font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_211" class="mt-4">
        <:example>
          <IconCurrencyClp font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyClp font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_212" class="mt-4">
        <:example>
          <IconCurrencyCny font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyCny font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_213" class="mt-4">
        <:example>
          <IconCurrencyCrc font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyCrc font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_214" class="mt-4">
        <:example>
          <IconCurrencyEth font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyEth font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_215" class="mt-4">
        <:example>
          <IconCurrencyEur font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyEur font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_216" class="mt-4">
        <:example>
          <IconCurrencyGel font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyGel font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_217" class="mt-4">
        <:example>
          <IconCurrencyHkd font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyHkd font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_218" class="mt-4">
        <:example>
          <IconCurrencyIdr font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyIdr font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_219" class="mt-4">
        <:example>
          <IconCurrencyInr font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyInr font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_220" class="mt-4">
        <:example>
          <IconCurrencyIqd font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyIqd font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_221" class="mt-4">
        <:example>
          <IconCurrencyJpy font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyJpy font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_222" class="mt-4">
        <:example>
          <IconCurrencyKrw font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyKrw font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_223" class="mt-4">
        <:example>
          <IconCurrencyLtc font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyLtc font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_224" class="mt-4">
        <:example>
          <IconCurrencyMxn font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyMxn font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_225" class="mt-4">
        <:example>
          <IconCurrencyMyr font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyMyr font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_226" class="mt-4">
        <:example>
          <IconCurrencyPen font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyPen font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_227" class="mt-4">
        <:example>
          <IconCurrencyPkr font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyPkr font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_228" class="mt-4">
        <:example>
          <IconCurrencyRub font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyRub font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_229" class="mt-4">
        <:example>
          <IconCurrencySoc font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencySoc font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_230" class="mt-4">
        <:example>
          <IconCurrencyThb font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyThb font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_231" class="mt-4">
        <:example>
          <IconCurrencyTrx font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyTrx font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_232" class="mt-4">
        <:example>
          <IconCurrencyTry font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyTry font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_233" class="mt-4">
        <:example>
          <IconCurrencyUah font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyUah font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_234" class="mt-4">
        <:example>
          <IconCurrencyUsd font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyUsd font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_235" class="mt-4">
        <:example>
          <IconCurrencyUsdt font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyUsdt font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_236" class="mt-4">
        <:example>
          <IconCurrencyVes font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyVes font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_237" class="mt-4">
        <:example>
          <IconCurrencyVnd font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyVnd font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_238" class="mt-4">
        <:example>
          <IconCurrencyXrp font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCurrencyXrp font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_239" class="mt-4">
        <:example>
          <IconCursor font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconCursor font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_240" class="mt-4">
        <:example>
          <IconData font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconData font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_241" class="mt-4">
        <:example>
          <IconDelete font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconDelete font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_242" class="mt-4">
        <:example>
          <IconDesktop font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconDesktop font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_243" class="mt-4">
        <:example>
          <IconDetails font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconDetails font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_244" class="mt-4">
        <:example>
          <IconDouble font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconDouble font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_245" class="mt-4">
        <:example>
          <IconDownload font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconDownload font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_246" class="mt-4">
        <:example>
          <IconDuotoneArrows font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconDuotoneArrows font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_247" class="mt-4">
        <:example>
          <IconDuotoneChat font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconDuotoneChat font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_248" class="mt-4">
        <:example>
          <IconDuotoneCoins font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconDuotoneCoins font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_249" class="mt-4">
        <:example>
          <IconDuotoneMail font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconDuotoneMail font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_250" class="mt-4">
        <:example>
          <IconESportsCallOfDuty font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconESportsCallOfDuty font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_251" class="mt-4">
        <:example>
          <IconESportsCounterStrike font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconESportsCounterStrike font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_252" class="mt-4">
        <:example>
          <IconESportsDota2 font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconESportsDota2 font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_253" class="mt-4">
        <:example>
          <IconESportsENba font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconESportsENba font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_254" class="mt-4">
        <:example>
          <IconESportsESport font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconESportsESport font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_255" class="mt-4">
        <:example>
          <IconESportsFootball font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconESportsFootball font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_256" class="mt-4">
        <:example>
          <IconESportsHearthstone font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconESportsHearthstone font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_257" class="mt-4">
        <:example>
          <IconESportsLeagueOfLegends font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconESportsLeagueOfLegends font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_258" class="mt-4">
        <:example>
          <IconESportsOverwatch font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconESportsOverwatch font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_259" class="mt-4">
        <:example>
          <IconESportsRainbow font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconESportsRainbow font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_260" class="mt-4">
        <:example>
          <IconESportsRocketLeague font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconESportsRocketLeague font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_261" class="mt-4">
        <:example>
          <IconESportsStarCraft font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconESportsStarCraft font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_262" class="mt-4">
        <:example>
          <IconEdit font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconEdit font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_263" class="mt-4">
        <:example>
          <IconErrorCircle font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconErrorCircle font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_264" class="mt-4">
        <:example>
          <IconError font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconError font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_265" class="mt-4">
        <:example>
          <IconExpand font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconExpand font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_266" class="mt-4">
        <:example>
          <IconEyeClosed font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconEyeClosed font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_267" class="mt-4">
        <:example>
          <IconEye font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconEye font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_268" class="mt-4">
        <:example>
          <IconFacebook font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconFacebook font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_269" class="mt-4">
        <:example>
          <IconFilter font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconFilter font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_270" class="mt-4">
        <:example>
          <IconForward font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconForward font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_271" class="mt-4">
        <:example>
          <IconFreebet font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconFreebet font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_272" class="mt-4">
        <:example>
          <IconFullScreen font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconFullScreen font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_273" class="mt-4">
        <:example>
          <IconGamepad font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGamepad font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_274" class="mt-4">
        <:example>
          <IconGeneralInfo font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGeneralInfo font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_275" class="mt-4">
        <:example>
          <IconGift font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGift font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_276" class="mt-4">
        <:example>
          <IconGlasses font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGlasses font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_277" class="mt-4">
        <:example>
          <IconGlobe font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGlobe font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_278" class="mt-4">
        <:example>
          <IconGoogleAuth font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGoogleAuth font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_279" class="mt-4">
        <:example>
          <IconGoogle font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconGoogle font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_280" class="mt-4">
        <:example>
          <IconHamburger font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconHamburger font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_281" class="mt-4">
        <:example>
          <IconHelp font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconHelp font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_282" class="mt-4">
        <:example>
          <IconHistory font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconHistory font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_283" class="mt-4">
        <:example>
          <IconHome font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconHome font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_284" class="mt-4">
        <:example>
          <IconHub88 font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconHub88 font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_285" class="mt-4">
        <:example>
          <IconHyperlink font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconHyperlink font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_286" class="mt-4">
        <:example>
          <IconInPlay font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconInPlay font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_287" class="mt-4">
        <:example>
          <IconInfoCircle font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconInfoCircle font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_288" class="mt-4">
        <:example>
          <IconInfo font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconInfo font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_289" class="mt-4">
        <:example>
          <IconInstagram font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconInstagram font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_290" class="mt-4">
        <:example>
          <IconLeftArrowCurveRight font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconLeftArrowCurveRight font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_291" class="mt-4">
        <:example>
          <IconLifeRing font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconLifeRing font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_292" class="mt-4">
        <:example>
          <IconLightbulb font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconLightbulb font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_293" class="mt-4">
        <:example>
          <IconLimit font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconLimit font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_294" class="mt-4">
        <:example>
          <IconLine font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconLine font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_295" class="mt-4">
        <:example>
          <IconLink font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconLink font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_296" class="mt-4">
        <:example>
          <IconListNumbered font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconListNumbered font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_297" class="mt-4">
        <:example>
          <IconLiveCasino font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconLiveCasino font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_298" class="mt-4">
        <:example>
          <IconLiveChat font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconLiveChat font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_299" class="mt-4">
        <:example>
          <IconLiveStream font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconLiveStream font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_300" class="mt-4">
        <:example>
          <IconLock font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconLock font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_301" class="mt-4">
        <:example>
          <IconLogin font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconLogin font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_302" class="mt-4">
        <:example>
          <IconLogoPlain font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconLogoPlain font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_303" class="mt-4">
        <:example>
          <IconLogout font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconLogout font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_304" class="mt-4">
        <:example>
          <IconLoyalty0 font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconLoyalty0 font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_305" class="mt-4">
        <:example>
          <IconMail font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconMail font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_306" class="mt-4">
        <:example>
          <IconMenuHome font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconMenuHome font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_307" class="mt-4">
        <:example>
          <IconMenu font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconMenu font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_308" class="mt-4">
        <:example>
          <IconMinus font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconMinus font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_309" class="mt-4">
        <:example>
          <IconMobile font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconMobile font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_310" class="mt-4">
        <:example>
          <IconMoney font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconMoney font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_311" class="mt-4">
        <:example>
          <IconMoneybag font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconMoneybag font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_312" class="mt-4">
        <:example>
          <IconMoon font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconMoon font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_313" class="mt-4">
        <:example>
          <IconMore font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconMore font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_314" class="mt-4">
        <:example>
          <IconNews font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconNews font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_315" class="mt-4">
        <:example>
          <IconNotificationUnread font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconNotificationUnread font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_316" class="mt-4">
        <:example>
          <IconNotification font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconNotification font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_317" class="mt-4">
        <:example>
          <IconPadlock font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconPadlock font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_318" class="mt-4">
        <:example>
          <IconPencil font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconPencil font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_319" class="mt-4">
        <:example>
          <IconPhoto font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconPhoto font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_320" class="mt-4">
        <:example>
          <IconPicture font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconPicture font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_321" class="mt-4">
        <:example>
          <IconPin font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconPin font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_322" class="mt-4">
        <:example>
          <IconPlay font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconPlay font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_323" class="mt-4">
        <:example>
          <IconPlus font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconPlus font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_324" class="mt-4">
        <:example>
          <IconPriceBoost font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconPriceBoost font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_325" class="mt-4">
        <:example>
          <IconPrint font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconPrint font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_326" class="mt-4">
        <:example>
          <IconProfile font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconProfile font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_327" class="mt-4">
        <:example>
          <IconPromotions font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconPromotions font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_328" class="mt-4">
        <:example>
          <IconRefresh font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconRefresh font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_329" class="mt-4">
        <:example>
          <IconReward font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconReward font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_330" class="mt-4">
        <:example>
          <IconRow font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconRow font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_331" class="mt-4">
        <:example>
          <IconSbShield font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSbShield font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_332" class="mt-4">
        <:example>
          <IconSearch font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSearch font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_333" class="mt-4">
        <:example>
          <IconSettings font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSettings font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_334" class="mt-4">
        <:example>
          <IconShare font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconShare font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_335" class="mt-4">
        <:example>
          <IconSliders font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSliders font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_336" class="mt-4">
        <:example>
          <IconSlots font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSlots font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_337" class="mt-4">
        <:example>
          <IconSnackbarSuccess font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSnackbarSuccess font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_338" class="mt-4">
        <:example>
          <IconSportWidget font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportWidget font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_339" class="mt-4">
        <:example>
          <IconSportsAfl font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsAfl font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_340" class="mt-4">
        <:example>
          <IconSportsAmericanFootBall font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsAmericanFootBall font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_341" class="mt-4">
        <:example>
          <IconSportsBadminton font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsBadminton font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_342" class="mt-4">
        <:example>
          <IconSportsBaseBall font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsBaseBall font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_343" class="mt-4">
        <:example>
          <IconSportsBasketBall font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsBasketBall font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_344" class="mt-4">
        <:example>
          <IconSportsBiathlon font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsBiathlon font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_345" class="mt-4">
        <:example>
          <IconSportsBoxing font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsBoxing font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_346" class="mt-4">
        <:example>
          <IconSportsCenter font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsCenter font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_347" class="mt-4">
        <:example>
          <IconSportsCricket font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsCricket font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_348" class="mt-4">
        <:example>
          <IconSportsCycling font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsCycling font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_349" class="mt-4">
        <:example>
          <IconSportsDarts font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsDarts font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_350" class="mt-4">
        <:example>
          <IconSportsESports font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsESports font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_351" class="mt-4">
        <:example>
          <IconSportsFantasy font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsFantasy font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_352" class="mt-4">
        <:example>
          <IconSportsFeatured font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsFeatured font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_353" class="mt-4">
        <:example>
          <IconSportsFootBall font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsFootBall font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_354" class="mt-4">
        <:example>
          <IconSportsGolf font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsGolf font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_355" class="mt-4">
        <:example>
          <IconSportsGreyhound font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsGreyhound font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_356" class="mt-4">
        <:example>
          <IconSportsHandBall font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsHandBall font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_357" class="mt-4">
        <:example>
          <IconSportsHarness font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsHarness font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_358" class="mt-4">
        <:example>
          <IconSportsHorseRacing font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsHorseRacing font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_359" class="mt-4">
        <:example>
          <IconSportsHorse font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsHorse font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_360" class="mt-4">
        <:example>
          <IconSportsIceHockey font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsIceHockey font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_361" class="mt-4">
        <:example>
          <IconSportsMma font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsMma font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_362" class="mt-4">
        <:example>
          <IconSportsMotorSports font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsMotorSports font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_363" class="mt-4">
        <:example>
          <IconSportsPoker font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsPoker font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_364" class="mt-4">
        <:example>
          <IconSportsPolitics font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsPolitics font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_365" class="mt-4">
        <:example>
          <IconSportsPool font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsPool font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_366" class="mt-4">
        <:example>
          <IconSportsPopular font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsPopular font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_367" class="mt-4">
        <:example>
          <IconSportsRugby font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsRugby font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_368" class="mt-4">
        <:example>
          <IconSportsSki font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsSki font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_369" class="mt-4">
        <:example>
          <IconSportsSnooker font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsSnooker font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_370" class="mt-4">
        <:example>
          <IconSportsSpecial font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsSpecial font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_371" class="mt-4">
        <:example>
          <IconSportsSquash font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsSquash font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_372" class="mt-4">
        <:example>
          <IconSportsTableTennis font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsTableTennis font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_373" class="mt-4">
        <:example>
          <IconSportsTennis font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsTennis font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_374" class="mt-4">
        <:example>
          <IconSportsVolleyBall font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsVolleyBall font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_375" class="mt-4">
        <:example>
          <IconSportsWaterPolo font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSportsWaterPolo font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_376" class="mt-4">
        <:example>
          <IconStarEmpty font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconStarEmpty font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_377" class="mt-4">
        <:example>
          <IconStarFilled font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconStarFilled font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_378" class="mt-4">
        <:example>
          <IconStarFlag font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconStarFlag font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_379" class="mt-4">
        <:example>
          <IconStars font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconStars font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_380" class="mt-4">
        <:example>
          <IconStart font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconStart font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_381" class="mt-4">
        <:example>
          <IconStats font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconStats font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_382" class="mt-4">
        <:example>
          <IconStop font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconStop font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_383" class="mt-4">
        <:example>
          <IconStopwatch font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconStopwatch font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_384" class="mt-4">
        <:example>
          <IconSuccessCircle font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSuccessCircle font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_385" class="mt-4">
        <:example>
          <IconSun font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSun font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_386" class="mt-4">
        <:example>
          <IconSupport font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconSupport font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_387" class="mt-4">
        <:example>
          <IconTable font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconTable font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_388" class="mt-4">
        <:example>
          <IconTag font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconTag font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_389" class="mt-4">
        <:example>
          <IconTelegram font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconTelegram font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_390" class="mt-4">
        <:example>
          <IconText font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconText font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_391" class="mt-4">
        <:example>
          <IconTimer font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconTimer font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_392" class="mt-4">
        <:example>
          <IconTwitter font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconTwitter font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_393" class="mt-4">
        <:example>
          <IconUpload font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconUpload font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_394" class="mt-4">
        <:example>
          <IconUser font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconUser font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_395" class="mt-4">
        <:example>
          <IconUsers font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconUsers font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_396" class="mt-4">
        <:example>
          <IconVerify font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconVerify font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_397" class="mt-4">
        <:example>
          <IconVirtualSports font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconVirtualSports font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_398" class="mt-4">
        <:example>
          <IconVkontakte font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconVkontakte font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_399" class="mt-4">
        <:example>
          <IconVolatility font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconVolatility font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_400" class="mt-4">
        <:example>
          <IconWalletRounded font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconWalletRounded font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_401" class="mt-4">
        <:example>
          <IconWallet font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconWallet font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_402" class="mt-4">
        <:example>
          <IconWand font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconWand font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_403" class="mt-4">
        <:example>
          <IconWarning font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconWarning font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_404" class="mt-4">
        <:example>
          <IconWhatsapp font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconWhatsapp font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_405" class="mt-4">
        <:example>
          <IconYoutube font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconYoutube font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_406" class="mt-4">
        <:example>
          <IconZoom font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <IconZoom font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_407" class="mt-4">
        <:example>
          <Mailbox font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Mailbox font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_408" class="mt-4">
        <:example>
          <Mailemailstats font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Mailemailstats font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_409" class="mt-4">
        <:example>
          <Mailenvelope font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Mailenvelope font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_410" class="mt-4">
        <:example>
          <Mailfilter font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Mailfilter font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_411" class="mt-4">
        <:example>
          <Mailfiltercrossed font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Mailfiltercrossed font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_412" class="mt-4">
        <:example>
          <Mailflag font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Mailflag font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_413" class="mt-4">
        <:example>
          <Maillink font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Maillink font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_414" class="mt-4">
        <:example>
          <Mailsend font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Mailsend font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_415" class="mt-4">
        <:example>
          <Mapscompas font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Mapscompas font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_416" class="mt-4">
        <:example>
          <Mapslocation font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Mapslocation font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_417" class="mt-4">
        <:example>
          <Mapsmap font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Mapsmap font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_418" class="mt-4">
        <:example>
          <Mapsmarker font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Mapsmarker font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_419" class="mt-4">
        <:example>
          <Mapspanorama font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Mapspanorama font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_420" class="mt-4">
        <:example>
          <Mapspin font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Mapspin font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_421" class="mt-4">
        <:example>
          <Mapspinadd font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Mapspinadd font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_422" class="mt-4">
        <:example>
          <Mapspinlocation font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Mapspinlocation font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_423" class="mt-4">
        <:example>
          <Mapsworld font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Mapsworld font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_424" class="mt-4">
        <:example>
          <Mediafastback font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Mediafastback font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_425" class="mt-4">
        <:example>
          <Mediafastforward font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Mediafastforward font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_426" class="mt-4">
        <:example>
          <Mediagif font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Mediagif font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_427" class="mt-4">
        <:example>
          <Mediaheadphones font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Mediaheadphones font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_428" class="mt-4">
        <:example>
          <Mediamegaphone font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Mediamegaphone font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_429" class="mt-4">
        <:example>
          <Mediamice font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Mediamice font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_430" class="mt-4">
        <:example>
          <Mediamicealternative font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Mediamicealternative font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_431" class="mt-4">
        <:example>
          <Mediamonitor font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Mediamonitor font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_432" class="mt-4">
        <:example>
          <Mediamusic font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Mediamusic font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_433" class="mt-4">
        <:example>
          <Medianovolume font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Medianovolume font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_434" class="mt-4">
        <:example>
          <Mediapause font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Mediapause font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_435" class="mt-4">
        <:example>
          <Mediaphoto font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Mediaphoto font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_436" class="mt-4">
        <:example>
          <Mediaplay font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Mediaplay font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_437" class="mt-4">
        <:example>
          <Mediasoundwave font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Mediasoundwave font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_438" class="mt-4">
        <:example>
          <Mediastop font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Mediastop font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_439" class="mt-4">
        <:example>
          <Mediatuner font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Mediatuner font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_440" class="mt-4">
        <:example>
          <Mediatuneralternative font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Mediatuneralternative font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_441" class="mt-4">
        <:example>
          <Mediavideo font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Mediavideo font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_442" class="mt-4">
        <:example>
          <Mediavolume font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Mediavolume font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_443" class="mt-4">
        <:example>
          <Notificationsactivity font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Notificationsactivity font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_444" class="mt-4">
        <:example>
          <Notificationsaddbell font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Notificationsaddbell font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_445" class="mt-4">
        <:example>
          <Notificationsalert font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Notificationsalert font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_446" class="mt-4">
        <:example>
          <Notificationsapp font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Notificationsapp font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_447" class="mt-4">
        <:example>
          <Notificationsbell font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Notificationsbell font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_448" class="mt-4">
        <:example>
          <Notificationsbellalarm font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Notificationsbellalarm font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_449" class="mt-4">
        <:example>
          <Notificationsbellcross font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Notificationsbellcross font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_450" class="mt-4">
        <:example>
          <Notificationsbellringing font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Notificationsbellringing font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_451" class="mt-4">
        <:example>
          <Notificationsbellringingalternative font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Notificationsbellringingalternative font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_452" class="mt-4">
        <:example>
          <Notificationserror font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Notificationserror font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_453" class="mt-4">
        <:example>
          <Notificationsnotifications font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Notificationsnotifications font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_454" class="mt-4">
        <:example>
          <Notificationsquestionmark font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Notificationsquestionmark font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_455" class="mt-4">
        <:example>
          <Notificationssettings font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Notificationssettings font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_456" class="mt-4">
        <:example>
          <Other3dots font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Other3dots font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_457" class="mt-4">
        <:example>
          <Other3dotshorizontal font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Other3dotshorizontal font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_458" class="mt-4">
        <:example>
          <Otherframe font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Otherframe font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_459" class="mt-4">
        <:example>
          <Otherid font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Otherid font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_460" class="mt-4">
        <:example>
          <Otherlightning font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Otherlightning font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_461" class="mt-4">
        <:example>
          <Othermoon font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Othermoon font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_462" class="mt-4">
        <:example>
          <Otherother font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Otherother font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_463" class="mt-4">
        <:example>
          <Otherplug font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Otherplug font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_464" class="mt-4">
        <:example>
          <Otherrewards font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Otherrewards font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_465" class="mt-4">
        <:example>
          <Othersad font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Othersad font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_466" class="mt-4">
        <:example>
          <Othersmile font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Othersmile font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_467" class="mt-4">
        <:example>
          <Othersun font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Othersun font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_468" class="mt-4">
        <:example>
          <Otherwater font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Otherwater font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_469" class="mt-4">
        <:example>
          <Securitykey font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Securitykey font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_470" class="mt-4">
        <:example>
          <Securitylock font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Securitylock font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_471" class="mt-4">
        <:example>
          <Securitymagnet font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Securitymagnet font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_472" class="mt-4">
        <:example>
          <Securityshield font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Securityshield font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_473" class="mt-4">
        <:example>
          <Securityshieldsecured font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Securityshieldsecured font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_474" class="mt-4">
        <:example>
          <Securityumbrella font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Securityumbrella font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_475" class="mt-4">
        <:example>
          <Securityunlock font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Securityunlock font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_476" class="mt-4">
        <:example>
          <Securityverified font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Securityverified font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_477" class="mt-4">
        <:example>
          <Securityverifiedface font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Securityverifiedface font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_478" class="mt-4">
        <:example>
          <Shopbag font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Shopbag font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_479" class="mt-4">
        <:example>
          <Shopbasket font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Shopbasket font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_480" class="mt-4">
        <:example>
          <Shopcard font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Shopcard font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_481" class="mt-4">
        <:example>
          <Shopcart font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Shopcart font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_482" class="mt-4">
        <:example>
          <Shopcrypto font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Shopcrypto font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_483" class="mt-4">
        <:example>
          <Shopcryptocoin font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Shopcryptocoin font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_484" class="mt-4">
        <:example>
          <Shopwallet font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Shopwallet font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_485" class="mt-4">
        <:example>
          <Shopwirelesspay font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Shopwirelesspay font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_486" class="mt-4">
        <:example>
          <Softwarebug font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Softwarebug font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_487" class="mt-4">
        <:example>
          <Softwarecode font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Softwarecode font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_488" class="mt-4">
        <:example>
          <Softwarecursor font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Softwarecursor font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_489" class="mt-4">
        <:example>
          <Softwaredashboard font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Softwaredashboard font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_490" class="mt-4">
        <:example>
          <Softwaredata font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Softwaredata font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_491" class="mt-4">
        <:example>
          <Softwaredownload font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Softwaredownload font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_492" class="mt-4">
        <:example>
          <Softwarehand font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Softwarehand font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_493" class="mt-4">
        <:example>
          <Softwarelogin font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Softwarelogin font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_494" class="mt-4">
        <:example>
          <Softwarelogout font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Softwarelogout font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_495" class="mt-4">
        <:example>
          <Softwarenut font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Softwarenut font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_496" class="mt-4">
        <:example>
          <Softwareplate font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Softwareplate font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_497" class="mt-4">
        <:example>
          <Softwarepuzzle font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Softwarepuzzle font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_498" class="mt-4">
        <:example>
          <Softwaresettings font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Softwaresettings font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_499" class="mt-4">
        <:example>
          <Softwareshutdown font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Softwareshutdown font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_500" class="mt-4">
        <:example>
          <Softwaresorting font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Softwaresorting font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_501" class="mt-4">
        <:example>
          <Softwarewrench font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Softwarewrench font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_502" class="mt-4">
        <:example>
          <Sportamericanfootball font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Sportamericanfootball font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_503" class="mt-4">
        <:example>
          <Sportbadminton font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Sportbadminton font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_504" class="mt-4">
        <:example>
          <Sportbaseball font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Sportbaseball font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_505" class="mt-4">
        <:example>
          <Sportbasketball font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Sportbasketball font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_506" class="mt-4">
        <:example>
          <Sportbeachvolley font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Sportbeachvolley font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_507" class="mt-4">
        <:example>
          <Sportbeachvolleyball font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Sportbeachvolleyball font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_508" class="mt-4">
        <:example>
          <Sportbombay font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Sportbombay font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_509" class="mt-4">
        <:example>
          <Sportboxing font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Sportboxing font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_510" class="mt-4">
        <:example>
          <Sportcasino font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Sportcasino font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_511" class="mt-4">
        <:example>
          <Sportcricket font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Sportcricket font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_512" class="mt-4">
        <:example>
          <Sportcrosscountry font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Sportcrosscountry font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_513" class="mt-4">
        <:example>
          <Sportcsgo font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Sportcsgo font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_514" class="mt-4">
        <:example>
          <Sportcycling font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Sportcycling font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_515" class="mt-4">
        <:example>
          <Sportdarts font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Sportdarts font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_516" class="mt-4">
        <:example>
          <Sportdota2 font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Sportdota2 font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_517" class="mt-4">
        <:example>
          <Sportesportgeneric font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Sportesportgeneric font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_518" class="mt-4">
        <:example>
          <Sportfeatured font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Sportfeatured font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_519" class="mt-4">
        <:example>
          <Sportfieldhockey font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Sportfieldhockey font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_520" class="mt-4">
        <:example>
          <Sportfloorball font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Sportfloorball font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_521" class="mt-4">
        <:example>
          <Sportfutsal font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Sportfutsal font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_522" class="mt-4">
        <:example>
          <Sportgolf font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Sportgolf font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_523" class="mt-4">
        <:example>
          <Sportgreyhound font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Sportgreyhound font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_524" class="mt-4">
        <:example>
          <Sporthandball font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Sporthandball font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_525" class="mt-4">
        <:example>
          <Sportharness font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Sportharness font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_526" class="mt-4">
        <:example>
          <Sporthorseracing font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Sporthorseracing font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_527" class="mt-4">
        <:example>
          <Sporticehockey font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Sporticehockey font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_528" class="mt-4">
        <:example>
          <Sportlol font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Sportlol font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_529" class="mt-4">
        <:example>
          <Sportmma font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Sportmma font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_530" class="mt-4">
        <:example>
          <Sportmotor font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Sportmotor font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_531" class="mt-4">
        <:example>
          <Sportoverwatch font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Sportoverwatch font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_532" class="mt-4">
        <:example>
          <Sportrugby font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Sportrugby font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_533" class="mt-4">
        <:example>
          <Sportsettennis font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Sportsettennis font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_534" class="mt-4">
        <:example>
          <Sportsnooker font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Sportsnooker font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_535" class="mt-4">
        <:example>
          <Sportsoccer font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Sportsoccer font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_536" class="mt-4">
        <:example>
          <Sportspecials font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Sportspecials font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_537" class="mt-4">
        <:example>
          <Sportsportsbet font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Sportsportsbet font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_538" class="mt-4">
        <:example>
          <Sporttabletennis font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Sporttabletennis font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_539" class="mt-4">
        <:example>
          <Sporttennis font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Sporttennis font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_540" class="mt-4">
        <:example>
          <Sportwaterpolo font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Sportwaterpolo font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_541" class="mt-4">
        <:example>
          <Textancor font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Textancor font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_542" class="mt-4">
        <:example>
          <Textattach font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Textattach font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_543" class="mt-4">
        <:example>
          <Textbold font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Textbold font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_544" class="mt-4">
        <:example>
          <Textbulletslist font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Textbulletslist font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_545" class="mt-4">
        <:example>
          <Textcards font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Textcards font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_546" class="mt-4">
        <:example>
          <Textcenter font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Textcenter font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_547" class="mt-4">
        <:example>
          <Textclearformatting font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Textclearformatting font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_548" class="mt-4">
        <:example>
          <Textcut font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Textcut font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_549" class="mt-4">
        <:example>
          <Textdescreaseindent font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Textdescreaseindent font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_550" class="mt-4">
        <:example>
          <Textincertline font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Textincertline font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_551" class="mt-4">
        <:example>
          <Textincreaseindent font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Textincreaseindent font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_552" class="mt-4">
        <:example>
          <Textitalic font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Textitalic font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_553" class="mt-4">
        <:example>
          <Textleftalign font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Textleftalign font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_554" class="mt-4">
        <:example>
          <Textmarker font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Textmarker font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_555" class="mt-4">
        <:example>
          <Textmath font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Textmath font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_556" class="mt-4">
        <:example>
          <Textnumberslist font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Textnumberslist font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_557" class="mt-4">
        <:example>
          <Textrightalign font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Textrightalign font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_558" class="mt-4">
        <:example>
          <Textsize font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Textsize font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_559" class="mt-4">
        <:example>
          <Textstrikethrough font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Textstrikethrough font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_560" class="mt-4">
        <:example>
          <Textstyle font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Textstyle font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_561" class="mt-4">
        <:example>
          <Texttable font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Texttable font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_562" class="mt-4">
        <:example>
          <Texttablealternative font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Texttablealternative font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_563" class="mt-4">
        <:example>
          <Textunderline font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Textunderline font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_564" class="mt-4">
        <:example>
          <Timealarm font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Timealarm font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_565" class="mt-4">
        <:example>
          <Timecalendar font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Timecalendar font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_566" class="mt-4">
        <:example>
          <Timecalendaradd font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Timecalendaradd font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_567" class="mt-4">
        <:example>
          <Timecalendaralternative font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Timecalendaralternative font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_568" class="mt-4">
        <:example>
          <Timecalendardate font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Timecalendardate font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_569" class="mt-4">
        <:example>
          <Timecalendarremove font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Timecalendarremove font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_570" class="mt-4">
        <:example>
          <Timecalendarsucsess font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Timecalendarsucsess font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_571" class="mt-4">
        <:example>
          <Timeclock font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Timeclock font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_572" class="mt-4">
        <:example>
          <Timesandglass font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Timesandglass font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_573" class="mt-4">
        <:example>
          <Timestopwatch font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Timestopwatch font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_574" class="mt-4">
        <:example>
          <Timestopwatchtimer font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Timestopwatchtimer font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_575" class="mt-4">
        <:example>
          <Timetime font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Timetime font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_576" class="mt-4">
        <:example>
          <Timewatch font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Timewatch font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_577" class="mt-4">
        <:example>
          <Typeclosedhand font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Typeclosedhand font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_578" class="mt-4">
        <:example>
          <Typedefault font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Typedefault font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_579" class="mt-4">
        <:example>
          <Typehandpointing font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Typehandpointing font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_580" class="mt-4">
        <:example>
          <Typehelp font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Typehelp font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_581" class="mt-4">
        <:example>
          <Typemove font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Typemove font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_582" class="mt-4">
        <:example>
          <Typenotallowed font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Typenotallowed font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_583" class="mt-4">
        <:example>
          <Typeopenedhand font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Typeopenedhand font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_584" class="mt-4">
        <:example>
          <Typetext font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Typetext font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_585" class="mt-4">
        <:example>
          <Typezoomin font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Typezoomin font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="icon_586" class="mt-4">
        <:example>
          <Typezoomout font_size="5rem" />
        </:example>

        <:code>
          <#CodePreview>
            <Typezoomout font_size="5rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <Footer />
      <ThemesSelect id="themes_select" theme_name={@theme_name} active_page={@active_page} />
    </TopToDown>
    """
  end
end
