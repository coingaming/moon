defmodule Moon.Themes.MissionsLight do
  def get_config do
    %Moon.Theme{
      id: "missions-light",
      base: %Moon.Theme.Base{
        space: 16,
        font_size: 16,
        line_height: 20
      },
      border_style: "solid",
      border_width: 1,
      border: "1px solid",
      box_shadow: "0px 2.4px 7.2px rgba(0, 0, 0, 0.18), 0px 12.8px 28.8px rgba(0, 0, 0, 0.22)",
      breakpoint: %Moon.Theme.Breakpoint{
        small: 500,
        medium: 800,
        large: 1080,
        xlarge: 1200
      },
      font_face: %Moon.Theme.FontFace{
        regular: %Moon.Theme.FontFace.Normal{
          font_family: "Averta Std",
          font_style: "normal",
          font_display: "swap",
          unicode_range:
            "U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF, U+FFFD",
          font_weight: 400,
          src:
            "local(\"AvertaStd-Regular\"), local(\"Averta Std Regular\"), url(https://sportsbet.io/sportsbet-io/files/fonts/averta-std/regular.woff2) format(\"woff2\")"
        },
        semibold: %Moon.Theme.FontFace.Semibold{
          font_family: "Averta Std",
          font_style: "normal",
          font_display: "swap",
          unicode_range:
            "U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF, U+FFFD",
          font_weight: 500,
          src:
            "local(\"AvertaStd-Semibold\"), local(\"Averta Std Semibold\"), url(https://sportsbet.io/sportsbet-io/files/fonts/averta-std/semibold.woff2) format(\"woff2\")"
        }
      },
      font_family:
        "Averta Std, -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, Oxygen-Sans, Ubuntu, Cantarell, \"Helvetica Neue\", sans-serif",
      font_size: 14,
      font_weight: %Moon.Theme.FontWeight{
        normal: 400,
        semibold: 500
      },
      max_width: %Moon.Theme.MaxWidth{
        default: 1024,
        large: 1440
      },
      opacity: %Moon.Theme.Opacity{
        disabled: 0.35
      },
      radius: %Moon.Theme.Radius{
        small: 4,
        default: 8,
        largest: 100
      },
      space: %Moon.Theme.Space{
        xsmall: 4,
        small: 8,
        default: 16,
        medium: 24,
        large: 32,
        xlarge: 40
      },
      transition_duration: %Moon.Theme.TransitionDuration{
        slow: 0.4,
        default: 0.2
      },
      z_index: %Moon.Theme.ZIndex{
        carousel_control: 5,
        dialog: 5,
        toggle: 1
      },
      brand: "Sportsbet.io",
      color: %Moon.Theme.Color{
        text: "#010812",
        background: "#FFFFFF",
        krillin_10: "#FFD580",
        krillin_100: "#FFB319",
        chi_chi_10: "#FF8392",
        chi_chi_100: "#FF4E64",
        roshi_10: "#B6F3D0",
        roshi_100: "#0CD664",
        dodoria_10: "#E99797",
        dodoria_100: "#D33030",
        cell_10: "#84DBAB",
        cell_100: "#0AB758",
        raditz_10: "#D9BFA4",
        raditz_100: "#B3804A",
        whis_10: "#87BADE",
        whis_100: "#0F75BD",
        frieza_10: "#B6A3E9",
        frieza_100: "#5C33CF",
        nappa_10: "#B8AAA7",
        nappa_100: "#725550",
        piccolo_80: "#6A36CA",
        piccolo_100: "#885ED5",
        piccolo_120: "#9C79DC",
        hit_80: "#9EACB5",
        hit_100: "#AAB6BE",
        hit_120: "#C5CDD3",
        beerus_100: "#E2E6E9",
        goku_10: "#E9EDEF",
        goku_40: "#D6DDE0",
        goku_80: "#AAB6BE",
        goku_100: "#F3F5F6",
        gohan_10: "#F7F8F9",
        gohan_40: "#F4F7FF",
        gohan_80: "#F3F6FF",
        gohan_100: "#FFFFFF",
        goten_100: "#FFFFFF",
        bulma_100: "#010812",
        trunks_100: "#8697A2"
      },
      color_scheme: "light"
    }
  end
end
