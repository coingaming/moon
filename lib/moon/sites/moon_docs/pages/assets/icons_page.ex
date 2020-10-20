defmodule Moon.Sites.MoonDocs.Pages.Assets.IconsPage do
  use Moon.LiveView
  use Moon.Components.Context

  alias Moon.Sites.MoonDocs.Layouts.DefaultLayout
  alias Moon.Themed
  alias Moon.Components.Inline
  alias Moon.Components.CodePreview

  alias Moon.Assets.Icons
  alias Icons.IconAbout
  alias Icons.IconAdd
  alias Icons.IconAlertCircle
  alias Icons.IconAlignLeft
  alias Icons.IconAllSports
  alias Icons.IconArrowDiagonalBottomLeft
  alias Icons.IconArrowDiagonalTopRight
  alias Icons.IconArrowDown
  alias Icons.IconArrowLeftRight
  alias Icons.IconArrowLeft
  alias Icons.IconArrowRight
  alias Icons.IconArrowTopRight
  alias Icons.IconArrowUpDown
  alias Icons.IconArrowUp
  alias Icons.IconAsianView
  alias Icons.IconAward
  alias Icons.IconBannerInfo
  alias Icons.IconBell
  alias Icons.IconBitcoinTalk
  alias Icons.IconBombayClub
  alias Icons.IconCalendarEmpty
  alias Icons.IconCalendar
  alias Icons.IconCard
  alias Icons.IconCashOut
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
  alias Icons.IconClock
  alias Icons.IconCloseRounded
  alias Icons.IconCloseSmall
  alias Icons.IconClose
  alias Icons.IconCode
  alias Icons.IconCopy
  alias Icons.IconCrypto
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
  alias Icons.IconGamepad
  alias Icons.IconGift
  alias Icons.IconGlobe
  alias Icons.IconGoogle
  alias Icons.IconHamburger
  alias Icons.IconHelp
  alias Icons.IconHistory
  alias Icons.IconHome
  alias Icons.IconHyperlink
  alias Icons.IconInPlay
  alias Icons.IconInfoCircle
  alias Icons.IconInfo
  alias Icons.IconInstagram
  alias Icons.IconLeftArrowCurveRight
  alias Icons.IconLifeRing
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
  alias Icons.IconMinus
  alias Icons.IconMoon
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
  alias Icons.IconSbShield
  alias Icons.IconSearch
  alias Icons.IconSettings
  alias Icons.IconShare
  alias Icons.IconSliders
  alias Icons.IconSlots
  alias Icons.IconSnackbarSuccess
  alias Icons.IconSportWidget
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
  alias Icons.IconVirtualSports
  alias Icons.IconVkontakte
  alias Icons.IconWalletRounded
  alias Icons.IconWallet
  alias Icons.IconWand
  alias Icons.IconWarning
  alias Icons.IconWhatsapp
  alias Icons.IconYoutube
  alias Icons.IconError
  alias Icons.IconGeneralInfo
  alias Icons.IconGoogleAuth
  alias Icons.IconLiveCasino
  alias Icons.IconLock
  alias Icons.IconSportsGreyhound
  alias Icons.IconSportsHarness
  alias Icons.IconSportsHorse
  alias Icons.IconVerify

  def render(assigns) do
    ~H"""
    <Themed theme={{ Moon.Themes.SportsbetLight.get_config }}>
      <DefaultLayout id="moondocs" user_token={{ "user_token" }}>
        <Inline>
          <IconAbout color="piccolo_100" background_color="gohan_100" />
            <IconAdd color="piccolo_100" background_color="gohan_100" />
            <IconAlertCircle color="piccolo_100" background_color="gohan_100" />
            <IconAlignLeft color="piccolo_100" background_color="gohan_100" />
            <IconAllSports color="piccolo_100" background_color="gohan_100" />
            <IconArrowDiagonalBottomLeft color="piccolo_100" background_color="gohan_100" />
            <IconArrowDiagonalTopRight color="piccolo_100" background_color="gohan_100" />
            <IconArrowDown color="piccolo_100" background_color="gohan_100" />
            <IconArrowLeftRight color="piccolo_100" background_color="gohan_100" />
            <IconArrowLeft color="piccolo_100" background_color="gohan_100" />
            <IconArrowRight color="piccolo_100" background_color="gohan_100" />
            <IconArrowTopRight color="piccolo_100" background_color="gohan_100" />
            <IconArrowUpDown color="piccolo_100" background_color="gohan_100" />
            <IconArrowUp color="piccolo_100" background_color="gohan_100" />
            <IconAsianView color="piccolo_100" background_color="gohan_100" />
            <IconAward color="piccolo_100" background_color="gohan_100" />
            <IconBannerInfo color="piccolo_100" background_color="gohan_100" />
            <IconBell color="piccolo_100" background_color="gohan_100" />
            <IconBitcoinTalk color="piccolo_100" background_color="gohan_100" />
            <IconBombayClub color="piccolo_100" background_color="gohan_100" />
            <IconCalendarEmpty color="piccolo_100" background_color="gohan_100" />
            <IconCalendar color="piccolo_100" background_color="gohan_100" />
            <IconCard color="piccolo_100" background_color="gohan_100" />
            <IconCashOut color="piccolo_100" background_color="gohan_100" />
            <IconCasino color="piccolo_100" background_color="gohan_100" />
            <IconChartArea color="piccolo_100" background_color="gohan_100" />
            <IconChartBar color="piccolo_100" background_color="gohan_100" />
            <IconChartPies color="piccolo_100" background_color="gohan_100" />
            <IconChartRound color="piccolo_100" background_color="gohan_100" />
            <IconChartSegment color="piccolo_100" background_color="gohan_100" />
            <IconChevronDownRounded color="piccolo_100" background_color="gohan_100" />
            <IconChevronDown color="piccolo_100" background_color="gohan_100" />
            <IconChevronLeftRounded color="piccolo_100" background_color="gohan_100" />
            <IconChevronLeft color="piccolo_100" background_color="gohan_100" />
            <IconChevronRightRounded color="piccolo_100" background_color="gohan_100" />
            <IconChevronRight color="piccolo_100" background_color="gohan_100" />
            <IconChevronUpDown color="piccolo_100" background_color="gohan_100" />
            <IconChevronUpRounded color="piccolo_100" background_color="gohan_100" />
            <IconChevronUp color="piccolo_100" background_color="gohan_100" />
            <IconCircle color="piccolo_100" background_color="gohan_100" />
            <IconClock color="piccolo_100" background_color="gohan_100" />
            <IconCloseRounded color="piccolo_100" background_color="gohan_100" />
            <IconCloseSmall color="piccolo_100" background_color="gohan_100" />
            <IconClose color="piccolo_100" background_color="gohan_100" />
            <IconCode color="piccolo_100" background_color="gohan_100" />
            <IconCopy color="piccolo_100" background_color="gohan_100" />
            <IconCrypto color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyARS color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyBDT color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyBOB color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyBRL color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyBTC color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyCAD color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyCLP color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyCNY color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyCRC color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyETH color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyEUR color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyGEL color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyHKD color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyIDR color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyINR color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyIQD color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyJPY color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyKRW color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyLTC color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyMXN color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyMYR color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyPEN color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyPKR color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyRUB color="piccolo_100" background_color="gohan_100" />
            <IconCurrencySOC color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyTHB color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyTRX color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyTRY color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyUAH color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyUSD color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyUSDT color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyVES color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyVND color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyXRP color="piccolo_100" background_color="gohan_100" />
            <IconCursor color="piccolo_100" background_color="gohan_100" />
            <IconData color="piccolo_100" background_color="gohan_100" />
            <IconDelete color="piccolo_100" background_color="gohan_100" />
            <IconDownload color="piccolo_100" background_color="gohan_100" />
            <IconDuotoneArrows color="piccolo_100" background_color="gohan_100" />
            <IconDuotoneChat color="piccolo_100" background_color="gohan_100" />
            <IconDuotoneCoins color="piccolo_100" background_color="gohan_100" />
            <IconDuotoneMail color="piccolo_100" background_color="gohan_100" />
            <IconESportsCallOfDuty color="piccolo_100" background_color="gohan_100" />
            <IconESportsCounterStrike color="piccolo_100" background_color="gohan_100" />
            <IconESportsDota2 color="piccolo_100" background_color="gohan_100" />
            <IconESportsENba color="piccolo_100" background_color="gohan_100" />
            <IconESportsESport color="piccolo_100" background_color="gohan_100" />
            <IconESportsFootball color="piccolo_100" background_color="gohan_100" />
            <IconESportsHearthstone color="piccolo_100" background_color="gohan_100" />
            <IconESportsLeagueOfLegends color="piccolo_100" background_color="gohan_100" />
            <IconESportsOverwatch color="piccolo_100" background_color="gohan_100" />
            <IconESportsRainbow color="piccolo_100" background_color="gohan_100" />
            <IconESportsRocketLeague color="piccolo_100" background_color="gohan_100" />
            <IconESportsStarCraft color="piccolo_100" background_color="gohan_100" />
            <IconEdit color="piccolo_100" background_color="gohan_100" />
            <IconErrorCircle color="piccolo_100" background_color="gohan_100" />
            <IconExpand color="piccolo_100" background_color="gohan_100" />
            <IconEyeClosed color="piccolo_100" background_color="gohan_100" />
            <IconEye color="piccolo_100" background_color="gohan_100" />
            <IconFacebook color="piccolo_100" background_color="gohan_100" />
            <IconFilter color="piccolo_100" background_color="gohan_100" />
            <IconForward color="piccolo_100" background_color="gohan_100" />
            <IconFreebet color="piccolo_100" background_color="gohan_100" />
            <IconGamepad color="piccolo_100" background_color="gohan_100" />
            <IconGift color="piccolo_100" background_color="gohan_100" />
            <IconGlobe color="piccolo_100" background_color="gohan_100" />
            <IconGoogle color="piccolo_100" background_color="gohan_100" />
            <IconHamburger color="piccolo_100" background_color="gohan_100" />
            <IconHelp color="piccolo_100" background_color="gohan_100" />
            <IconHistory color="piccolo_100" background_color="gohan_100" />
            <IconHome color="piccolo_100" background_color="gohan_100" />
            <IconHyperlink color="piccolo_100" background_color="gohan_100" />
            <IconInPlay color="piccolo_100" background_color="gohan_100" />
            <IconInfoCircle color="piccolo_100" background_color="gohan_100" />
            <IconInfo color="piccolo_100" background_color="gohan_100" />
            <IconInstagram color="piccolo_100" background_color="gohan_100" />
            <IconLeftArrowCurveRight color="piccolo_100" background_color="gohan_100" />
            <IconLifeRing color="piccolo_100" background_color="gohan_100" />
            <IconLine color="piccolo_100" background_color="gohan_100" />
            <IconLink color="piccolo_100" background_color="gohan_100" />
            <IconListNumbered color="piccolo_100" background_color="gohan_100" />
            <IconLiveChat color="piccolo_100" background_color="gohan_100" />
            <IconLiveStream color="piccolo_100" background_color="gohan_100" />
            <IconLogin color="piccolo_100" background_color="gohan_100" />
            <IconLogoPlain color="piccolo_100" background_color="gohan_100" />
            <IconLogout color="piccolo_100" background_color="gohan_100" />
            <IconLoyalty0 color="piccolo_100" background_color="gohan_100" />
            <IconMail color="piccolo_100" background_color="gohan_100" />
            <IconMenuHome color="piccolo_100" background_color="gohan_100" />
            <IconMinus color="piccolo_100" background_color="gohan_100" />
            <IconMoon color="piccolo_100" background_color="gohan_100" />
            <IconNews color="piccolo_100" background_color="gohan_100" />
            <IconNotificationUnread color="piccolo_100" background_color="gohan_100" />
            <IconNotification color="piccolo_100" background_color="gohan_100" />
            <IconPadlock color="piccolo_100" background_color="gohan_100" />
            <IconPencil color="piccolo_100" background_color="gohan_100" />
            <IconPhoto color="piccolo_100" background_color="gohan_100" />
            <IconPicture color="piccolo_100" background_color="gohan_100" />
            <IconPin color="piccolo_100" background_color="gohan_100" />
            <IconPlay color="piccolo_100" background_color="gohan_100" />
            <IconPlus color="piccolo_100" background_color="gohan_100" />
            <IconPriceBoost color="piccolo_100" background_color="gohan_100" />
            <IconPrint color="piccolo_100" background_color="gohan_100" />
            <IconProfile color="piccolo_100" background_color="gohan_100" />
            <IconPromotions color="piccolo_100" background_color="gohan_100" />
            <IconRefresh color="piccolo_100" background_color="gohan_100" />
            <IconSbShield color="piccolo_100" background_color="gohan_100" />
            <IconSearch color="piccolo_100" background_color="gohan_100" />
            <IconSettings color="piccolo_100" background_color="gohan_100" />
            <IconShare color="piccolo_100" background_color="gohan_100" />
            <IconSliders color="piccolo_100" background_color="gohan_100" />
            <IconSlots color="piccolo_100" background_color="gohan_100" />
            <IconSnackbarSuccess color="piccolo_100" background_color="gohan_100" />
            <IconSportWidget color="piccolo_100" background_color="gohan_100" />
            <IconSportsAmericanFootBall color="piccolo_100" background_color="gohan_100" />
            <IconSportsBadminton color="piccolo_100" background_color="gohan_100" />
            <IconSportsBaseBall color="piccolo_100" background_color="gohan_100" />
            <IconSportsBasketBall color="piccolo_100" background_color="gohan_100" />
            <IconSportsBiathlon color="piccolo_100" background_color="gohan_100" />
            <IconSportsBoxing color="piccolo_100" background_color="gohan_100" />
            <IconSportsCenter color="piccolo_100" background_color="gohan_100" />
            <IconSportsCricket color="piccolo_100" background_color="gohan_100" />
            <IconSportsCycling color="piccolo_100" background_color="gohan_100" />
            <IconSportsDarts color="piccolo_100" background_color="gohan_100" />
            <IconSportsESports color="piccolo_100" background_color="gohan_100" />
            <IconSportsFantasy color="piccolo_100" background_color="gohan_100" />
            <IconSportsFeatured color="piccolo_100" background_color="gohan_100" />
            <IconSportsFootBall color="piccolo_100" background_color="gohan_100" />
            <IconSportsGolf color="piccolo_100" background_color="gohan_100" />
            <IconSportsHandBall color="piccolo_100" background_color="gohan_100" />
            <IconSportsHorseRacing color="piccolo_100" background_color="gohan_100" />
            <IconSportsIceHockey color="piccolo_100" background_color="gohan_100" />
            <IconSportsMma color="piccolo_100" background_color="gohan_100" />
            <IconSportsMotorSports color="piccolo_100" background_color="gohan_100" />
            <IconSportsPoker color="piccolo_100" background_color="gohan_100" />
            <IconSportsPolitics color="piccolo_100" background_color="gohan_100" />
            <IconSportsPool color="piccolo_100" background_color="gohan_100" />
            <IconSportsPopular color="piccolo_100" background_color="gohan_100" />
            <IconSportsRugby color="piccolo_100" background_color="gohan_100" />
            <IconSportsSki color="piccolo_100" background_color="gohan_100" />
            <IconSportsSnooker color="piccolo_100" background_color="gohan_100" />
            <IconSportsSpecial color="piccolo_100" background_color="gohan_100" />
            <IconSportsSquash color="piccolo_100" background_color="gohan_100" />
            <IconSportsTableTennis color="piccolo_100" background_color="gohan_100" />
            <IconSportsTennis color="piccolo_100" background_color="gohan_100" />
            <IconSportsVolleyBall color="piccolo_100" background_color="gohan_100" />
            <IconSportsWaterPolo color="piccolo_100" background_color="gohan_100" />
            <IconStarEmpty color="piccolo_100" background_color="gohan_100" />
            <IconStarFilled color="piccolo_100" background_color="gohan_100" />
            <IconStarFlag color="piccolo_100" background_color="gohan_100" />
            <IconStars color="piccolo_100" background_color="gohan_100" />
            <IconStats color="piccolo_100" background_color="gohan_100" />
            <IconStopwatch color="piccolo_100" background_color="gohan_100" />
            <IconSuccessCircle color="piccolo_100" background_color="gohan_100" />
            <IconSun color="piccolo_100" background_color="gohan_100" />
            <IconSupport color="piccolo_100" background_color="gohan_100" />
            <IconTable color="piccolo_100" background_color="gohan_100" />
            <IconTag color="piccolo_100" background_color="gohan_100" />
            <IconTelegram color="piccolo_100" background_color="gohan_100" />
            <IconText color="piccolo_100" background_color="gohan_100" />
            <IconTimer color="piccolo_100" background_color="gohan_100" />
            <IconTwitter color="piccolo_100" background_color="gohan_100" />
            <IconUpload color="piccolo_100" background_color="gohan_100" />
            <IconUser color="piccolo_100" background_color="gohan_100" />
            <IconUsers color="piccolo_100" background_color="gohan_100" />
            <IconVirtualSports color="piccolo_100" background_color="gohan_100" />
            <IconVkontakte color="piccolo_100" background_color="gohan_100" />
            <IconWalletRounded color="piccolo_100" background_color="gohan_100" />
            <IconWallet color="piccolo_100" background_color="gohan_100" />
            <IconWand color="piccolo_100" background_color="gohan_100" />
            <IconWarning color="piccolo_100" background_color="gohan_100" />
            <IconWhatsapp color="piccolo_100" background_color="gohan_100" />
            <IconYoutube color="piccolo_100" background_color="gohan_100" />
            <IconError color="piccolo_100" background_color="gohan_100" />
            <IconGeneralInfo color="piccolo_100" background_color="gohan_100" />
            <IconGoogleAuth color="piccolo_100" background_color="gohan_100" />
            <IconLiveCasino color="piccolo_100" background_color="gohan_100" />
            <IconLock color="piccolo_100" background_color="gohan_100" />
            <IconSportsGreyhound color="piccolo_100" background_color="gohan_100" />
            <IconSportsHarness color="piccolo_100" background_color="gohan_100" />
            <IconSportsHorse color="piccolo_100" background_color="gohan_100" />
            <IconVerify color="piccolo_100" background_color="gohan_100" />
          
        </Inline>
        <#CodePreview>
          <Inline>
            <IconAbout color="piccolo_100" background_color="gohan_100" />
            <IconAdd color="piccolo_100" background_color="gohan_100" />
            <IconAlertCircle color="piccolo_100" background_color="gohan_100" />
            <IconAlignLeft color="piccolo_100" background_color="gohan_100" />
            <IconAllSports color="piccolo_100" background_color="gohan_100" />
            <IconArrowDiagonalBottomLeft color="piccolo_100" background_color="gohan_100" />
            <IconArrowDiagonalTopRight color="piccolo_100" background_color="gohan_100" />
            <IconArrowDown color="piccolo_100" background_color="gohan_100" />
            <IconArrowLeftRight color="piccolo_100" background_color="gohan_100" />
            <IconArrowLeft color="piccolo_100" background_color="gohan_100" />
            <IconArrowRight color="piccolo_100" background_color="gohan_100" />
            <IconArrowTopRight color="piccolo_100" background_color="gohan_100" />
            <IconArrowUpDown color="piccolo_100" background_color="gohan_100" />
            <IconArrowUp color="piccolo_100" background_color="gohan_100" />
            <IconAsianView color="piccolo_100" background_color="gohan_100" />
            <IconAward color="piccolo_100" background_color="gohan_100" />
            <IconBannerInfo color="piccolo_100" background_color="gohan_100" />
            <IconBell color="piccolo_100" background_color="gohan_100" />
            <IconBitcoinTalk color="piccolo_100" background_color="gohan_100" />
            <IconBombayClub color="piccolo_100" background_color="gohan_100" />
            <IconCalendarEmpty color="piccolo_100" background_color="gohan_100" />
            <IconCalendar color="piccolo_100" background_color="gohan_100" />
            <IconCard color="piccolo_100" background_color="gohan_100" />
            <IconCashOut color="piccolo_100" background_color="gohan_100" />
            <IconCasino color="piccolo_100" background_color="gohan_100" />
            <IconChartArea color="piccolo_100" background_color="gohan_100" />
            <IconChartBar color="piccolo_100" background_color="gohan_100" />
            <IconChartPies color="piccolo_100" background_color="gohan_100" />
            <IconChartRound color="piccolo_100" background_color="gohan_100" />
            <IconChartSegment color="piccolo_100" background_color="gohan_100" />
            <IconChevronDownRounded color="piccolo_100" background_color="gohan_100" />
            <IconChevronDown color="piccolo_100" background_color="gohan_100" />
            <IconChevronLeftRounded color="piccolo_100" background_color="gohan_100" />
            <IconChevronLeft color="piccolo_100" background_color="gohan_100" />
            <IconChevronRightRounded color="piccolo_100" background_color="gohan_100" />
            <IconChevronRight color="piccolo_100" background_color="gohan_100" />
            <IconChevronUpDown color="piccolo_100" background_color="gohan_100" />
            <IconChevronUpRounded color="piccolo_100" background_color="gohan_100" />
            <IconChevronUp color="piccolo_100" background_color="gohan_100" />
            <IconCircle color="piccolo_100" background_color="gohan_100" />
            <IconClock color="piccolo_100" background_color="gohan_100" />
            <IconCloseRounded color="piccolo_100" background_color="gohan_100" />
            <IconCloseSmall color="piccolo_100" background_color="gohan_100" />
            <IconClose color="piccolo_100" background_color="gohan_100" />
            <IconCode color="piccolo_100" background_color="gohan_100" />
            <IconCopy color="piccolo_100" background_color="gohan_100" />
            <IconCrypto color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyARS color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyBDT color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyBOB color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyBRL color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyBTC color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyCAD color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyCLP color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyCNY color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyCRC color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyETH color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyEUR color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyGEL color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyHKD color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyIDR color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyINR color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyIQD color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyJPY color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyKRW color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyLTC color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyMXN color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyMYR color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyPEN color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyPKR color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyRUB color="piccolo_100" background_color="gohan_100" />
            <IconCurrencySOC color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyTHB color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyTRX color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyTRY color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyUAH color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyUSD color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyUSDT color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyVES color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyVND color="piccolo_100" background_color="gohan_100" />
            <IconCurrencyXRP color="piccolo_100" background_color="gohan_100" />
            <IconCursor color="piccolo_100" background_color="gohan_100" />
            <IconData color="piccolo_100" background_color="gohan_100" />
            <IconDelete color="piccolo_100" background_color="gohan_100" />
            <IconDownload color="piccolo_100" background_color="gohan_100" />
            <IconDuotoneArrows color="piccolo_100" background_color="gohan_100" />
            <IconDuotoneChat color="piccolo_100" background_color="gohan_100" />
            <IconDuotoneCoins color="piccolo_100" background_color="gohan_100" />
            <IconDuotoneMail color="piccolo_100" background_color="gohan_100" />
            <IconESportsCallOfDuty color="piccolo_100" background_color="gohan_100" />
            <IconESportsCounterStrike color="piccolo_100" background_color="gohan_100" />
            <IconESportsDota2 color="piccolo_100" background_color="gohan_100" />
            <IconESportsENba color="piccolo_100" background_color="gohan_100" />
            <IconESportsESport color="piccolo_100" background_color="gohan_100" />
            <IconESportsFootball color="piccolo_100" background_color="gohan_100" />
            <IconESportsHearthstone color="piccolo_100" background_color="gohan_100" />
            <IconESportsLeagueOfLegends color="piccolo_100" background_color="gohan_100" />
            <IconESportsOverwatch color="piccolo_100" background_color="gohan_100" />
            <IconESportsRainbow color="piccolo_100" background_color="gohan_100" />
            <IconESportsRocketLeague color="piccolo_100" background_color="gohan_100" />
            <IconESportsStarCraft color="piccolo_100" background_color="gohan_100" />
            <IconEdit color="piccolo_100" background_color="gohan_100" />
            <IconErrorCircle color="piccolo_100" background_color="gohan_100" />
            <IconExpand color="piccolo_100" background_color="gohan_100" />
            <IconEyeClosed color="piccolo_100" background_color="gohan_100" />
            <IconEye color="piccolo_100" background_color="gohan_100" />
            <IconFacebook color="piccolo_100" background_color="gohan_100" />
            <IconFilter color="piccolo_100" background_color="gohan_100" />
            <IconForward color="piccolo_100" background_color="gohan_100" />
            <IconFreebet color="piccolo_100" background_color="gohan_100" />
            <IconGamepad color="piccolo_100" background_color="gohan_100" />
            <IconGift color="piccolo_100" background_color="gohan_100" />
            <IconGlobe color="piccolo_100" background_color="gohan_100" />
            <IconGoogle color="piccolo_100" background_color="gohan_100" />
            <IconHamburger color="piccolo_100" background_color="gohan_100" />
            <IconHelp color="piccolo_100" background_color="gohan_100" />
            <IconHistory color="piccolo_100" background_color="gohan_100" />
            <IconHome color="piccolo_100" background_color="gohan_100" />
            <IconHyperlink color="piccolo_100" background_color="gohan_100" />
            <IconInPlay color="piccolo_100" background_color="gohan_100" />
            <IconInfoCircle color="piccolo_100" background_color="gohan_100" />
            <IconInfo color="piccolo_100" background_color="gohan_100" />
            <IconInstagram color="piccolo_100" background_color="gohan_100" />
            <IconLeftArrowCurveRight color="piccolo_100" background_color="gohan_100" />
            <IconLifeRing color="piccolo_100" background_color="gohan_100" />
            <IconLine color="piccolo_100" background_color="gohan_100" />
            <IconLink color="piccolo_100" background_color="gohan_100" />
            <IconListNumbered color="piccolo_100" background_color="gohan_100" />
            <IconLiveChat color="piccolo_100" background_color="gohan_100" />
            <IconLiveStream color="piccolo_100" background_color="gohan_100" />
            <IconLogin color="piccolo_100" background_color="gohan_100" />
            <IconLogoPlain color="piccolo_100" background_color="gohan_100" />
            <IconLogout color="piccolo_100" background_color="gohan_100" />
            <IconLoyalty0 color="piccolo_100" background_color="gohan_100" />
            <IconMail color="piccolo_100" background_color="gohan_100" />
            <IconMenuHome color="piccolo_100" background_color="gohan_100" />
            <IconMinus color="piccolo_100" background_color="gohan_100" />
            <IconMoon color="piccolo_100" background_color="gohan_100" />
            <IconNews color="piccolo_100" background_color="gohan_100" />
            <IconNotificationUnread color="piccolo_100" background_color="gohan_100" />
            <IconNotification color="piccolo_100" background_color="gohan_100" />
            <IconPadlock color="piccolo_100" background_color="gohan_100" />
            <IconPencil color="piccolo_100" background_color="gohan_100" />
            <IconPhoto color="piccolo_100" background_color="gohan_100" />
            <IconPicture color="piccolo_100" background_color="gohan_100" />
            <IconPin color="piccolo_100" background_color="gohan_100" />
            <IconPlay color="piccolo_100" background_color="gohan_100" />
            <IconPlus color="piccolo_100" background_color="gohan_100" />
            <IconPriceBoost color="piccolo_100" background_color="gohan_100" />
            <IconPrint color="piccolo_100" background_color="gohan_100" />
            <IconProfile color="piccolo_100" background_color="gohan_100" />
            <IconPromotions color="piccolo_100" background_color="gohan_100" />
            <IconRefresh color="piccolo_100" background_color="gohan_100" />
            <IconSbShield color="piccolo_100" background_color="gohan_100" />
            <IconSearch color="piccolo_100" background_color="gohan_100" />
            <IconSettings color="piccolo_100" background_color="gohan_100" />
            <IconShare color="piccolo_100" background_color="gohan_100" />
            <IconSliders color="piccolo_100" background_color="gohan_100" />
            <IconSlots color="piccolo_100" background_color="gohan_100" />
            <IconSnackbarSuccess color="piccolo_100" background_color="gohan_100" />
            <IconSportWidget color="piccolo_100" background_color="gohan_100" />
            <IconSportsAmericanFootBall color="piccolo_100" background_color="gohan_100" />
            <IconSportsBadminton color="piccolo_100" background_color="gohan_100" />
            <IconSportsBaseBall color="piccolo_100" background_color="gohan_100" />
            <IconSportsBasketBall color="piccolo_100" background_color="gohan_100" />
            <IconSportsBiathlon color="piccolo_100" background_color="gohan_100" />
            <IconSportsBoxing color="piccolo_100" background_color="gohan_100" />
            <IconSportsCenter color="piccolo_100" background_color="gohan_100" />
            <IconSportsCricket color="piccolo_100" background_color="gohan_100" />
            <IconSportsCycling color="piccolo_100" background_color="gohan_100" />
            <IconSportsDarts color="piccolo_100" background_color="gohan_100" />
            <IconSportsESports color="piccolo_100" background_color="gohan_100" />
            <IconSportsFantasy color="piccolo_100" background_color="gohan_100" />
            <IconSportsFeatured color="piccolo_100" background_color="gohan_100" />
            <IconSportsFootBall color="piccolo_100" background_color="gohan_100" />
            <IconSportsGolf color="piccolo_100" background_color="gohan_100" />
            <IconSportsHandBall color="piccolo_100" background_color="gohan_100" />
            <IconSportsHorseRacing color="piccolo_100" background_color="gohan_100" />
            <IconSportsIceHockey color="piccolo_100" background_color="gohan_100" />
            <IconSportsMma color="piccolo_100" background_color="gohan_100" />
            <IconSportsMotorSports color="piccolo_100" background_color="gohan_100" />
            <IconSportsPoker color="piccolo_100" background_color="gohan_100" />
            <IconSportsPolitics color="piccolo_100" background_color="gohan_100" />
            <IconSportsPool color="piccolo_100" background_color="gohan_100" />
            <IconSportsPopular color="piccolo_100" background_color="gohan_100" />
            <IconSportsRugby color="piccolo_100" background_color="gohan_100" />
            <IconSportsSki color="piccolo_100" background_color="gohan_100" />
            <IconSportsSnooker color="piccolo_100" background_color="gohan_100" />
            <IconSportsSpecial color="piccolo_100" background_color="gohan_100" />
            <IconSportsSquash color="piccolo_100" background_color="gohan_100" />
            <IconSportsTableTennis color="piccolo_100" background_color="gohan_100" />
            <IconSportsTennis color="piccolo_100" background_color="gohan_100" />
            <IconSportsVolleyBall color="piccolo_100" background_color="gohan_100" />
            <IconSportsWaterPolo color="piccolo_100" background_color="gohan_100" />
            <IconStarEmpty color="piccolo_100" background_color="gohan_100" />
            <IconStarFilled color="piccolo_100" background_color="gohan_100" />
            <IconStarFlag color="piccolo_100" background_color="gohan_100" />
            <IconStars color="piccolo_100" background_color="gohan_100" />
            <IconStats color="piccolo_100" background_color="gohan_100" />
            <IconStopwatch color="piccolo_100" background_color="gohan_100" />
            <IconSuccessCircle color="piccolo_100" background_color="gohan_100" />
            <IconSun color="piccolo_100" background_color="gohan_100" />
            <IconSupport color="piccolo_100" background_color="gohan_100" />
            <IconTable color="piccolo_100" background_color="gohan_100" />
            <IconTag color="piccolo_100" background_color="gohan_100" />
            <IconTelegram color="piccolo_100" background_color="gohan_100" />
            <IconText color="piccolo_100" background_color="gohan_100" />
            <IconTimer color="piccolo_100" background_color="gohan_100" />
            <IconTwitter color="piccolo_100" background_color="gohan_100" />
            <IconUpload color="piccolo_100" background_color="gohan_100" />
            <IconUser color="piccolo_100" background_color="gohan_100" />
            <IconUsers color="piccolo_100" background_color="gohan_100" />
            <IconVirtualSports color="piccolo_100" background_color="gohan_100" />
            <IconVkontakte color="piccolo_100" background_color="gohan_100" />
            <IconWalletRounded color="piccolo_100" background_color="gohan_100" />
            <IconWallet color="piccolo_100" background_color="gohan_100" />
            <IconWand color="piccolo_100" background_color="gohan_100" />
            <IconWarning color="piccolo_100" background_color="gohan_100" />
            <IconWhatsapp color="piccolo_100" background_color="gohan_100" />
            <IconYoutube color="piccolo_100" background_color="gohan_100" />
            <IconError color="piccolo_100" background_color="gohan_100" />
            <IconGeneralInfo color="piccolo_100" background_color="gohan_100" />
            <IconGoogleAuth color="piccolo_100" background_color="gohan_100" />
            <IconLiveCasino color="piccolo_100" background_color="gohan_100" />
            <IconLock color="piccolo_100" background_color="gohan_100" />
            <IconSportsGreyhound color="piccolo_100" background_color="gohan_100" />
            <IconSportsHarness color="piccolo_100" background_color="gohan_100" />
            <IconSportsHorse color="piccolo_100" background_color="gohan_100" />
            <IconVerify color="piccolo_100" background_color="gohan_100" />
            
          </Inline>
        </#CodePreview>
      </DefaultLayout>
    </Themed>
    """
  end
end
