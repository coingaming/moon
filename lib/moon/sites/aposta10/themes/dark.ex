

defmodule Moon.Sites.Aposta10.Themes.Dark.Base do 
  defstruct space: 16,
    font_size: 16,
    line_height: 20
end

defmodule Moon.Sites.Aposta10.Themes.Dark.Breakpoint do 
  defstruct small: 500,
    medium: 800,
    large: 1080,
    xlarge: 1200
end

defmodule Moon.Sites.Aposta10.Themes.Dark.FontFace.Normal do 
  defstruct font_family: "Averta Std",
    font_style: "normal",
    font_display: "swap",
    unicode_range: "U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF, U+FFFD",
    font_weight: 400,
    src: "local(\"AvertaStd-Regular\"), local(\"Averta Std Regular\"), url(https://sportsbet.io/sportsbet-io/files/fonts/averta-std/regular.woff2) format(\"woff2\")"
end

defmodule Moon.Sites.Aposta10.Themes.Dark.FontFace.Semibold do 
  defstruct font_family: "Averta Std",
    font_style: "normal",
    font_display: "swap",
    unicode_range: "U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF, U+FFFD",
    font_weight: 500,
    src: "local(\"AvertaStd-Semibold\"), local(\"Averta Std Semibold\"), url(https://sportsbet.io/sportsbet-io/files/fonts/averta-std/semibold.woff2) format(\"woff2\")"
end

defmodule Moon.Sites.Aposta10.Themes.Dark.FontFace do 
  defstruct regular: %Moon.Sites.Aposta10.Themes.Dark.FontFace.Normal{},
    bold: %Moon.Sites.Aposta10.Themes.Dark.FontFace.Semibold{}
end

defmodule Moon.Sites.Aposta10.Themes.Dark.FontWeight do 
  defstruct normal: 400,
    semibold: 500
end

defmodule Moon.Sites.Aposta10.Themes.Dark.MaxWidth do 
  defstruct default: 1024,
    large: 1440
end

defmodule Moon.Sites.Aposta10.Themes.Dark.Opacity do 
  defstruct disabled: 0.35
end

defmodule Moon.Sites.Aposta10.Themes.Dark.Radius do 
  defstruct small: 4,
    default: 8,
    largest: 100
end

defmodule Moon.Sites.Aposta10.Themes.Dark.Space do 
  defstruct xsmall: 4,
    small: 8,
    default: 16,
    medium: 24,
    large: 32,
    xlarge: 40
end

defmodule Moon.Sites.Aposta10.Themes.Dark.TransitionDuration do 
  defstruct slow: 0.4,
    default: 0.2
end

defmodule Moon.Sites.Aposta10.Themes.Dark.ZIndex do 
  defstruct carousel_control: 5,
    dialog: 5,
    toggle: 1
end

defmodule Moon.Sites.Aposta10.Themes.Dark.Color do 
  defstruct text: "#FFFFFF",
    background: "#070A0D",
    krillin_10: "#FFE4AD",    
    krillin_100: "#FFB319",    
    chi_chi_10: "#FFA7B2",    
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
    piccolo_80: "#46AF81",    
    piccolo_100: "#39A275",    
    piccolo_120: "#2E9468",    
    hit_80: "#6f7785",    
    hit_100: "#636b79",    
    hit_120: "#565e6c",    
    goten_100: "#FFFFFF",    
    goku_10: "#3D4957",    
    goku_40: "#262F3B",    
    goku_80: "#11161D",    
    goku_100: "#070A0D",    
    gohan_10: "#636B79",    
    gohan_40: "#4A515E",    
    gohan_80: "#323843",    
    gohan_100: "#272C35",    
    beerus_100: "#4E535A",    
    bulma_100: "#FFFFFF",    
    trunks_100: "#C8D0D5"
end

defmodule Moon.Sites.Aposta10.Themes.Dark do 
  defstruct id: "aposta10_dark",
    base: %Moon.Sites.Aposta10.Themes.Dark.Base{},
    border_style: "solid",
    border_width: 1,
    border: "1px solid",
    box_shadow: "0px 1.2px 3.6px rgba(0, 0, 0, 0.108), 0px 6.4px 14.4px rgba(0, 0, 0, 0.132)",
    breakpoint: %Moon.Sites.Aposta10.Themes.Dark.Breakpoint{},
    font_face: %Moon.Sites.Aposta10.Themes.Dark.FontFace{},
    font_family: "Averta Std, -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, Oxygen-Sans, Ubuntu, Cantarell, \"Helvetica Neue\", sans-serif",
    font_size: 14,
    font_weight: %Moon.Sites.Aposta10.Themes.Dark.FontWeight{},
    max_width: %Moon.Sites.Aposta10.Themes.Dark.MaxWidth{},
    opacity: %Moon.Sites.Aposta10.Themes.Dark.Opacity{},
    radius: %Moon.Sites.Aposta10.Themes.Dark.Radius{},
    space: %Moon.Sites.Aposta10.Themes.Dark.Space{},
    transition_duration: %Moon.Sites.Aposta10.Themes.Dark.TransitionDuration{},
    z_index: %Moon.Sites.Aposta10.Themes.Dark.ZIndex{},
    brand: "Aposta10",
    color: %Moon.Sites.Aposta10.Themes.Dark.Color{},
    color_scheme: "dark"
end
    