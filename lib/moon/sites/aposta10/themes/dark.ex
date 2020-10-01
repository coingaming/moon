
defmodule Moon.Sites.Aposta10.Themes.Light do
  defstruct "base": %Moon.Sites.Aposta10.Themes.Light.Base{},
    "border_style": "solid",
    "border_width": 1,
    "border": "1px solid",
    "box_shadow": "0px 1.2px 3.6px rgba(0, 0, 0, 0.108), 0px 6.4px 14.4px rgba(0, 0, 0, 0.132)",
    "breakpoint": %Moon.Sites.Aposta10.Themes.Light.Breakpoint{},
    "font_face": %Moon.Sites.Aposta10.Themes.Light.FontFace{},
    "font_family": "Averta Std, -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, Oxygen-Sans, Ubuntu, Cantarell, \"Helvetica Neue\", sans-serif",
    "font_size": %Moon.Sites.Aposta10.Themes.Light.FontSize{},
    "font_weight": %Moon.Sites.Aposta10.Themes.Light.FontWeight{},
    "max_width": %Moon.Sites.Aposta10.Themes.Light.MaxWidth{},
    "opacity": %Moon.Sites.Aposta10.Themes.Light.Opacity{},
    "radius": %Moon.Sites.Aposta10.Themes.Light.Radius{},
    "space": %Moon.Sites.Aposta10.Themes.Light.Space{},
    "transition_duration": %Moon.Sites.Aposta10.Themes.Light.TransitionDuration{},
    "z_index": %Moon.Sites.Aposta10.Themes.Light.ZIndex{},
    "brand": "Aposta10",
    "color": %Moon.Sites.Aposta10.Themes.Light.Color{},
    "color_scheme": "dark"
end


defmodule Moon.Sites.Aposta10.Themes.Light.Base do
  defstruct "space": 16,
    "font_size": 16,
    "line_height": 20
end



defmodule Moon.Sites.Aposta10.Themes.Light.Breakpoint do
  defstruct "small": 500,
    "medium": 800,
    "large": 1080,
    "xlarge": 1200
end



defmodule Moon.Sites.Aposta10.Themes.Light.FontFace do
  defstruct "0": %Moon.Sites.Aposta10.Themes.Light.FontFace."0"{},
    "1": %Moon.Sites.Aposta10.Themes.Light.FontFace."1"{}
end


defmodule Moon.Sites.Aposta10.Themes.Light.FontFace.0 do
  defstruct "@font-face": %Moon.Sites.Aposta10.Themes.Light.FontFace."0".@fontFace{}
end


defmodule Moon.Sites.Aposta10.Themes.Light.FontFace.0.@fontFace do
  defstruct "font_family": "Averta Std",
    "font_style": "normal",
    "font_display": "swap",
    "unicode_range": "U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF, U+FFFD",
    "font_weight": 400,
    "src": "local(\"AvertaStd-Regular\"), local(\"Averta Std Regular\"), url(https://sportsbet.io/sportsbet-io/files/fonts/averta-std/regular.woff2) format(\"woff2\")"
end




defmodule Moon.Sites.Aposta10.Themes.Light.FontFace.1 do
  defstruct "@font-face": %Moon.Sites.Aposta10.Themes.Light.FontFace.1.@fontFace{}
end


defmodule Moon.Sites.Aposta10.Themes.Light.FontFace.1.@fontFace do
  defstruct "font_family": "Averta Std",
    "font_style": "normal",
    "font_display": "swap",
    "unicode_range": "U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF, U+FFFD",
    "font_weight": 500,
    "src": "local(\"AvertaStd-Semibold\"), local(\"Averta Std Semibold\"), url(https://sportsbet.io/sportsbet-io/files/fonts/averta-std/semibold.woff2) format(\"woff2\")"
end





defmodule Moon.Sites.Aposta10.Themes.Light.FontSize do
  defstruct "body": 14
end



defmodule Moon.Sites.Aposta10.Themes.Light.FontWeight do
  defstruct "normal": 400,
    "semibold": 500
end



defmodule Moon.Sites.Aposta10.Themes.Light.MaxWidth do
  defstruct "default": 1024,
    "large": 1440
end



defmodule Moon.Sites.Aposta10.Themes.Light.Opacity do
  defstruct "disabled": 0.35
end



defmodule Moon.Sites.Aposta10.Themes.Light.Radius do
  defstruct "small": 4,
    "default": 8,
    "largest": 100
end



defmodule Moon.Sites.Aposta10.Themes.Light.Space do
  defstruct "xsmall": 4,
    "small": 8,
    "default": 16,
    "medium": 24,
    "large": 32,
    "xlarge": 40
end



defmodule Moon.Sites.Aposta10.Themes.Light.TransitionDuration do
  defstruct "slow": 0.4,
    "default": 0.2
end



defmodule Moon.Sites.Aposta10.Themes.Light.ZIndex do
  defstruct "carousel_control": 5,
    "dialog": 10000,
    "toggle": 1
end



defmodule Moon.Sites.Aposta10.Themes.Light.Color do
  defstruct "text": "#FFFFFF",
    "background": "#070A0D",
    "krillin": %Moon.Sites.Aposta10.Themes.Light.Color.Krillin{},
    "chi_chi": %Moon.Sites.Aposta10.Themes.Light.Color.ChiChi{},
    "roshi": %Moon.Sites.Aposta10.Themes.Light.Color.Roshi{},
    "dodoria": %Moon.Sites.Aposta10.Themes.Light.Color.Dodoria{},
    "cell": %Moon.Sites.Aposta10.Themes.Light.Color.Cell{},
    "raditz": %Moon.Sites.Aposta10.Themes.Light.Color.Raditz{},
    "whis": %Moon.Sites.Aposta10.Themes.Light.Color.Whis{},
    "frieza": %Moon.Sites.Aposta10.Themes.Light.Color.Frieza{},
    "nappa": %Moon.Sites.Aposta10.Themes.Light.Color.Nappa{},
    "piccolo": %Moon.Sites.Aposta10.Themes.Light.Color.Piccolo{},
    "hit": %Moon.Sites.Aposta10.Themes.Light.Color.Hit{},
    "goten": %Moon.Sites.Aposta10.Themes.Light.Color.Goten{},
    "goku": %Moon.Sites.Aposta10.Themes.Light.Color.Goku{},
    "gohan": %Moon.Sites.Aposta10.Themes.Light.Color.Gohan{},
    "beerus": %Moon.Sites.Aposta10.Themes.Light.Color.Beerus{},
    "bulma": %Moon.Sites.Aposta10.Themes.Light.Color.Bulma{},
    "trunks": %Moon.Sites.Aposta10.Themes.Light.Color.Trunks{}
end


defmodule Moon.Sites.Aposta10.Themes.Light.Color.Krillin do
  defstruct "10": "#FFE4AD",
    "100": "#FFB319"
end



defmodule Moon.Sites.Aposta10.Themes.Light.Color.ChiChi do
  defstruct "10": "#FFA7B2",
    "100": "#FF4E64"
end



defmodule Moon.Sites.Aposta10.Themes.Light.Color.Roshi do
  defstruct "10": "#B6F3D0",
    "100": "#0CD664"
end



defmodule Moon.Sites.Aposta10.Themes.Light.Color.Dodoria do
  defstruct "10": "#E99797",
    "100": "#D33030"
end



defmodule Moon.Sites.Aposta10.Themes.Light.Color.Cell do
  defstruct "10": "#84DBAB",
    "100": "#0AB758"
end



defmodule Moon.Sites.Aposta10.Themes.Light.Color.Raditz do
  defstruct "10": "#D9BFA4",
    "100": "#B3804A"
end



defmodule Moon.Sites.Aposta10.Themes.Light.Color.Whis do
  defstruct "10": "#87BADE",
    "100": "#0F75BD"
end



defmodule Moon.Sites.Aposta10.Themes.Light.Color.Frieza do
  defstruct "10": "#B6A3E9",
    "100": "#5C33CF"
end



defmodule Moon.Sites.Aposta10.Themes.Light.Color.Nappa do
  defstruct "10": "#B8AAA7",
    "100": "#725550"
end



defmodule Moon.Sites.Aposta10.Themes.Light.Color.Piccolo do
  defstruct "80": "#46AF81",
    "100": "#39A275",
    "120": "#2E9468"
end



defmodule Moon.Sites.Aposta10.Themes.Light.Color.Hit do
  defstruct "80": "#6f7785",
    "100": "#636b79",
    "120": "#565e6c"
end



defmodule Moon.Sites.Aposta10.Themes.Light.Color.Goten do
  defstruct "100": "#FFFFFF"
end



defmodule Moon.Sites.Aposta10.Themes.Light.Color.Goku do
  defstruct "10": "#3D4957",
    "40": "#262F3B",
    "80": "#11161D",
    "100": "#070A0D"
end



defmodule Moon.Sites.Aposta10.Themes.Light.Color.Gohan do
  defstruct "10": "#636B79",
    "40": "#4A515E",
    "80": "#323843",
    "100": "#272C35"
end



defmodule Moon.Sites.Aposta10.Themes.Light.Color.Beerus do
  defstruct "100": "#4E535A"
end



defmodule Moon.Sites.Aposta10.Themes.Light.Color.Bulma do
  defstruct "100": "#FFFFFF"
end



defmodule Moon.Sites.Aposta10.Themes.Light.Color.Trunks do
  defstruct "100": "#C8D0D5"
end
