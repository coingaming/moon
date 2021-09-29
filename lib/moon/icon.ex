defmodule Moon.Icon do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Icons

  prop name, :string

  prop color, :string, values: Moon.colors()
  prop background_color, :string, values: Moon.colors()
  prop font_size, :string
  prop click, :event
  prop class, :string

  @assets_map %{
    arrows_bottom_left: Icons.ArrowsBottomLeft,
    arrows_bottom_right: Icons.ArrowsBottomRight,
    arrows_chevron_down_double: Icons.ArrowsChevronDownDouble,
    arrows_chevron_left_double: Icons.ArrowsChevronLeftDouble,
    arrows_chevron_right_double: Icons.ArrowsChevronRightDouble,
    arrows_chevron_up_double: Icons.ArrowsChevronUpDouble,
    arrows_diagonals_bltr: Icons.ArrowsDiagonalsBltr,
    arrows_diagonals_tlbr: Icons.ArrowsDiagonalsTlbr,
    arrows_down: Icons.ArrowsDown,
    arrows_forward: Icons.ArrowsForward,
    arrows_left_curved: Icons.ArrowsLeftCurved,
    arrows_left: Icons.ArrowsLeft,
    arrows_refresh: Icons.ArrowsRefresh,
    arrows_reply: Icons.ArrowsReply,
    arrows_right_curved: Icons.ArrowsRightCurved,
    arrows_right: Icons.ArrowsRight,
    arrows_top_left: Icons.ArrowsTopLeft,
    arrows_top_right: Icons.ArrowsTopRight,
    arrows_transfer: Icons.ArrowsTransfer,
    arrows_up: Icons.ArrowsUp,
    arrows_update: Icons.ArrowsUpdate,
    chart_area: Icons.ChartArea,
    chart_bar_alternitive: Icons.ChartBarAlternitive,
    chart_bar_vertical: Icons.ChartBarVertical,
    chart_bar: Icons.ChartBar,
    chart_dashboard: Icons.ChartDashboard,
    chart_fin: Icons.ChartFin,
    chart_line: Icons.ChartLine,
    chart_pie_chart: Icons.ChartPieChart,
    chart_relation: Icons.ChartRelation,
    chart_round: Icons.ChartRound,
    chat_chat: Icons.ChatChat,
    chat_comment_add: Icons.ChatCommentAdd,
    chat_comment_bubble_alert: Icons.ChatCommentBubbleAlert,
    chat_comment_bubble_question_mark: Icons.ChatCommentBubbleQuestionMark,
    chat_comment_bubble: Icons.ChatCommentBubble,
    chat_comment_remove: Icons.ChatCommentRemove,
    chat_comment_text: Icons.ChatCommentText,
    chat_comment: Icons.ChatComment,
    chat_double_bubble: Icons.ChatDoubleBubble,
    chat_stats_chat: Icons.ChatStatsChat,
    controls_chevron_down_small: Icons.ControlsChevronDownSmall,
    controls_chevron_down: Icons.ControlsChevronDown,
    controls_chevron_left_small: Icons.ControlsChevronLeftSmall,
    controls_chevron_left: Icons.ControlsChevronLeft,
    controls_chevron_right_small: Icons.ControlsChevronRightSmall,
    controls_chevron_right: Icons.ControlsChevronRight,
    controls_chevron_up_small: Icons.ControlsChevronUpSmall,
    controls_chevron_up: Icons.ControlsChevronUp,
    controls_clear: Icons.ControlsClear,
    controls_close_small: Icons.ControlsCloseSmall,
    controls_close: Icons.ControlsClose,
    controls_collapse: Icons.ControlsCollapse,
    controls_diagonals_insight: Icons.ControlsDiagonalsInsight,
    controls_diagonals_outsight: Icons.ControlsDiagonalsOutsight,
    controls_expand: Icons.ControlsExpand,
    controls_eye_crossed: Icons.ControlsEyeCrossed,
    controls_eye: Icons.ControlsEye,
    controls_minus: Icons.ControlsMinus,
    controls_plus: Icons.ControlsPlus,
    controls_vertical_double_chevron: Icons.ControlsVerticalDoubleChevron,
    devices_bluetooth: Icons.DevicesBluetooth,
    devices_joystick: Icons.DevicesJoystick,
    devices_keyboard: Icons.DevicesKeyboard,
    devices_mac: Icons.DevicesMac,
    devices_macbook_and_iphone: Icons.DevicesMacbookAndIphone,
    devices_macbook: Icons.DevicesMacbook,
    devices_mouse: Icons.DevicesMouse,
    devices_phone: Icons.DevicesPhone,
    devices_smartphone: Icons.DevicesSmartphone,
    devices_tv_box: Icons.DevicesTvBox,
    files_add: Icons.FilesAdd,
    files_case: Icons.FilesCase,
    files_clipboard_text: Icons.FilesClipboardText,
    files_clipboard: Icons.FilesClipboard,
    files_code: Icons.FilesCode,
    files_copy: Icons.FilesCopy,
    files_delete: Icons.FilesDelete,
    files_draft: Icons.FilesDraft,
    files_export: Icons.FilesExport,
    files_external_link: Icons.FilesExternalLink,
    files_file: Icons.FilesFile,
    files_folder_closed: Icons.FilesFolderClosed,
    files_folder_open_alternative: Icons.FilesFolderOpenAlternative,
    files_folder_open: Icons.FilesFolderOpen,
    files_folder_zip: Icons.FilesFolderZip,
    files_glasses: Icons.FilesGlasses,
    files_import: Icons.FilesImport,
    files_magazine: Icons.FilesMagazine,
    files_print: Icons.FilesPrint,
    files_remove: Icons.FilesRemove,
    files_save: Icons.FilesSave,
    files_scan: Icons.FilesScan,
    files_share: Icons.FilesShare,
    files_sticker: Icons.FilesSticker,
    files_stickers: Icons.FilesStickers,
    files_table: Icons.FilesTable,
    files_text: Icons.FilesText,
    generic_about: Icons.GenericAbout,
    generic_alarm_round: Icons.GenericAlarmRound,
    generic_alarm: Icons.GenericAlarm,
    generic_amount_number: Icons.GenericAmountNumber,
    generic_bet: Icons.GenericBet,
    generic_block: Icons.GenericBlock,
    generic_bookmark: Icons.GenericBookmark,
    generic_browser: Icons.GenericBrowser,
    generic_burger_regular: Icons.GenericBurgerRegular,
    generic_burger_zig: Icons.GenericBurgerZig,
    generic_check_alternative: Icons.GenericCheckAlternative,
    generic_check_rounded: Icons.GenericCheckRounded,
    generic_close: Icons.GenericClose,
    generic_delete: Icons.GenericDelete,
    generic_dislike: Icons.GenericDislike,
    generic_download: Icons.GenericDownload,
    generic_drag_handle: Icons.GenericDragHandle,
    generic_edit: Icons.GenericEdit,
    generic_globe: Icons.GenericGlobe,
    generic_heart: Icons.GenericHeart,
    generic_help: Icons.GenericHelp,
    generic_home: Icons.GenericHome,
    generic_idea: Icons.GenericIdea,
    generic_info_alternative: Icons.GenericInfoAlternative,
    generic_info: Icons.GenericInfo,
    generic_like: Icons.GenericLike,
    generic_link: Icons.GenericLink,
    generic_log_in: Icons.GenericLogIn,
    generic_log_out: Icons.GenericLogOut,
    generic_loyalty: Icons.GenericLoyalty,
    generic_mention: Icons.GenericMention,
    generic_menu: Icons.GenericMenu,
    generic_minus: Icons.GenericMinus,
    generic_multi_bet: Icons.GenericMultiBet,
    generic_news: Icons.GenericNews,
    generic_picture: Icons.GenericPicture,
    generic_plus: Icons.GenericPlus,
    generic_search: Icons.GenericSearch,
    generic_settings: Icons.GenericSettings,
    generic_share_android: Icons.GenericShareAndroid,
    generic_share_ios_big: Icons.GenericShareIosBig,
    generic_share_ios: Icons.GenericShareIos,
    generic_star: Icons.GenericStar,
    generic_tag: Icons.GenericTag,
    generic_ticket: Icons.GenericTicket,
    generic_upload: Icons.GenericUpload,
    generic_user: Icons.GenericUser,
    generic_users: Icons.GenericUsers,
    mail_box: Icons.MailBox,
    mail_email_stats: Icons.MailEmailStats,
    mail_envelope: Icons.MailEnvelope,
    mail_filter_crossed: Icons.MailFilterCrossed,
    mail_filter: Icons.MailFilter,
    mail_flag: Icons.MailFlag,
    mail_link: Icons.MailLink,
    mail_send: Icons.MailSend,
    maps_compas: Icons.MapsCompas,
    maps_location: Icons.MapsLocation,
    maps_map: Icons.MapsMap,
    maps_marker: Icons.MapsMarker,
    maps_panorama: Icons.MapsPanorama,
    maps_pin_add: Icons.MapsPinAdd,
    maps_pin_location: Icons.MapsPinLocation,
    maps_pin: Icons.MapsPin,
    maps_world: Icons.MapsWorld,
    media_fast_back: Icons.MediaFastBack,
    media_fast_forward: Icons.MediaFastForward,
    media_gif: Icons.MediaGif,
    media_headphones: Icons.MediaHeadphones,
    media_megaphone: Icons.MediaMegaphone,
    media_mice_alternative: Icons.MediaMiceAlternative,
    media_mice: Icons.MediaMice,
    media_monitor: Icons.MediaMonitor,
    media_music: Icons.MediaMusic,
    media_no_volume: Icons.MediaNoVolume,
    media_pause: Icons.MediaPause,
    media_photo: Icons.MediaPhoto,
    media_play: Icons.MediaPlay,
    media_soundwave: Icons.MediaSoundwave,
    media_stop: Icons.MediaStop,
    media_tuner_alternative: Icons.MediaTunerAlternative,
    media_tuner: Icons.MediaTuner,
    media_video: Icons.MediaVideo,
    media_volume: Icons.MediaVolume,
    notifications_activity: Icons.NotificationsActivity,
    notifications_add_bell: Icons.NotificationsAddBell,
    notifications_alert: Icons.NotificationsAlert,
    notifications_app: Icons.NotificationsApp,
    notifications_bell_alarm: Icons.NotificationsBellAlarm,
    notifications_bell_cross: Icons.NotificationsBellCross,
    notifications_bell_ringing_alternative: Icons.NotificationsBellRingingAlternative,
    notifications_bell_ringing: Icons.NotificationsBellRinging,
    notifications_bell: Icons.NotificationsBell,
    notifications_error: Icons.NotificationsError,
    notifications_notifications: Icons.NotificationsNotifications,
    notifications_question_mark: Icons.NotificationsQuestionMark,
    notifications_settings: Icons.NotificationsSettings,
    other_frame: Icons.OtherFrame,
    other_id: Icons.OtherId,
    other_lightning: Icons.OtherLightning,
    other_moon: Icons.OtherMoon,
    other_other: Icons.OtherOther,
    other_plug: Icons.OtherPlug,
    other_rewards: Icons.OtherRewards,
    other_sad: Icons.OtherSad,
    other_smile: Icons.OtherSmile,
    other_sun: Icons.OtherSun,
    other_water: Icons.OtherWater,
    other3_dots_horizontal: Icons.Other3DotsHorizontal,
    other3_dots: Icons.Other3Dots,
    security_key: Icons.SecurityKey,
    security_lock: Icons.SecurityLock,
    security_magnet: Icons.SecurityMagnet,
    security_shield_secured: Icons.SecurityShieldSecured,
    security_shield: Icons.SecurityShield,
    security_umbrella: Icons.SecurityUmbrella,
    security_unlock: Icons.SecurityUnlock,
    security_verified_face: Icons.SecurityVerifiedFace,
    security_verified: Icons.SecurityVerified,
    shop_bag: Icons.ShopBag,
    shop_basket: Icons.ShopBasket,
    shop_card: Icons.ShopCard,
    shop_cart: Icons.ShopCart,
    shop_crypto_coin: Icons.ShopCryptoCoin,
    shop_crypto: Icons.ShopCrypto,
    shop_wallet: Icons.ShopWallet,
    shop_wireless_pay: Icons.ShopWirelessPay,
    software_bug: Icons.SoftwareBug,
    software_code: Icons.SoftwareCode,
    software_cursor: Icons.SoftwareCursor,
    software_dashboard: Icons.SoftwareDashboard,
    software_data: Icons.SoftwareData,
    software_download: Icons.SoftwareDownload,
    software_hand: Icons.SoftwareHand,
    software_log_out: Icons.SoftwareLogOut,
    software_login: Icons.SoftwareLogin,
    software_nut: Icons.SoftwareNut,
    software_plate: Icons.SoftwarePlate,
    software_puzzle: Icons.SoftwarePuzzle,
    software_settings: Icons.SoftwareSettings,
    software_shutdown: Icons.SoftwareShutdown,
    software_sorting: Icons.SoftwareSorting,
    software_wrench: Icons.SoftwareWrench,
    sport_american_football: Icons.SportAmericanFootball,
    sport_badminton: Icons.SportBadminton,
    sport_baseball: Icons.SportBaseball,
    sport_basketball: Icons.SportBasketball,
    sport_beach_volley: Icons.SportBeachVolley,
    sport_beach_volleyball: Icons.SportBeachVolleyball,
    sport_bombay: Icons.SportBombay,
    sport_boxing: Icons.SportBoxing,
    sport_c_s_g_o: Icons.SportCSGO,
    sport_casino: Icons.SportCasino,
    sport_cricket: Icons.SportCricket,
    sport_cross_country: Icons.SportCrossCountry,
    sport_cycling: Icons.SportCycling,
    sport_darts: Icons.SportDarts,
    sport_dota2: Icons.SportDota2,
    sport_esport_generic: Icons.SportEsportGeneric,
    sport_featured: Icons.SportFeatured,
    sport_field_hockey: Icons.SportFieldHockey,
    sport_floorball: Icons.SportFloorball,
    sport_futsal: Icons.SportFutsal,
    sport_golf: Icons.SportGolf,
    sport_greyhound: Icons.SportGreyhound,
    sport_handball: Icons.SportHandball,
    sport_harness: Icons.SportHarness,
    sport_horse_racing: Icons.SportHorseRacing,
    sport_ice_hockey: Icons.SportIceHockey,
    sport_lo_l: Icons.SportLoL,
    sport_m_m_a: Icons.SportMMA,
    sport_motor: Icons.SportMotor,
    sport_overwatch: Icons.SportOverwatch,
    sport_rugby: Icons.SportRugby,
    sport_set_tennis: Icons.SportSetTennis,
    sport_snooker: Icons.SportSnooker,
    sport_soccer: Icons.SportSoccer,
    sport_specials: Icons.SportSpecials,
    sport_sportsbet: Icons.SportSportsbet,
    sport_table_tennis: Icons.SportTableTennis,
    sport_tennis: Icons.SportTennis,
    sport_waterpolo: Icons.SportWaterpolo,
    text_ancor: Icons.TextAncor,
    text_attach: Icons.TextAttach,
    text_bold: Icons.TextBold,
    text_bullets_list: Icons.TextBulletsList,
    text_cards: Icons.TextCards,
    text_center: Icons.TextCenter,
    text_clear_formatting: Icons.TextClearFormatting,
    text_cut: Icons.TextCut,
    text_descrease_indent: Icons.TextDescreaseIndent,
    text_incert_line: Icons.TextIncertLine,
    text_increase_indent: Icons.TextIncreaseIndent,
    text_italic: Icons.TextItalic,
    text_left_align: Icons.TextLeftAlign,
    text_marker: Icons.TextMarker,
    text_math: Icons.TextMath,
    text_numbers_list: Icons.TextNumbersList,
    text_right_align: Icons.TextRightAlign,
    text_size: Icons.TextSize,
    text_strikethrough: Icons.TextStrikethrough,
    text_style: Icons.TextStyle,
    text_table_alternative: Icons.TextTableAlternative,
    text_table: Icons.TextTable,
    text_underline: Icons.TextUnderline,
    time_alarm: Icons.TimeAlarm,
    time_calendar_add: Icons.TimeCalendarAdd,
    time_calendar_alternative: Icons.TimeCalendarAlternative,
    time_calendar_date: Icons.TimeCalendarDate,
    time_calendar_remove: Icons.TimeCalendarRemove,
    time_calendar_sucsess: Icons.TimeCalendarSucsess,
    time_calendar: Icons.TimeCalendar,
    time_clock: Icons.TimeClock,
    time_sandglass: Icons.TimeSandglass,
    time_stopwatch_timer: Icons.TimeStopwatchTimer,
    time_stopwatch: Icons.TimeStopwatch,
    time_time: Icons.TimeTime,
    time_watch: Icons.TimeWatch,
    type_closed_hand: Icons.TypeClosedHand,
    type_default: Icons.TypeDefault,
    type_hand_pointing: Icons.TypeHandPointing,
    type_help: Icons.TypeHelp,
    type_move: Icons.TypeMove,
    type_not_allowed: Icons.TypeNotAllowed,
    type_opened_hand: Icons.TypeOpenedHand,
    type_text: Icons.TypeText,
    type_zoom_in: Icons.TypeZoomIn,
    type_zoom_out: Icons.TypeZoomOut
  }
  def icon_name_to_module(icon_name) do
    icon_name = String.to_existing_atom(icon_name)
    @assets_map[icon_name]
  end

  def render(assigns) do
    ~F"""
    {@name && icon_name_to_module(@name) &&
      live_component(@socket, icon_name_to_module(@name),
        color: @color,
        background_color: @background_color,
        font_size: @font_size,
        click: @click,
        class: @class
      )}
    """
  end
end
