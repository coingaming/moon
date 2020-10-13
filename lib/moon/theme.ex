defmodule Moon.Theme.Base do
  defstruct space: nil,
            font_size: nil,
            line_height: nil
end

defmodule Moon.Theme.Breakpoint do
  defstruct small: nil,
            medium: nil,
            large: nil,
            xlarge: nil
end

defmodule Moon.Theme.FontFace.Normal do
  defstruct font_family: nil,
            font_style: nil,
            font_display: nil,
            unicode_range: nil,
            font_weight: nil,
            src: nil
end

defmodule Moon.Theme.FontFace.Semibold do
  defstruct font_family: nil,
            font_style: nil,
            font_display: nil,
            unicode_range: nil,
            font_weight: nil,
            src: nil
end

defmodule Moon.Theme.FontFace do
  defstruct regular: %Moon.Theme.FontFace.Normal{},
            semibold: %Moon.Theme.FontFace.Semibold{}
end

defmodule Moon.Theme.FontWeight do
  defstruct normal: nil,
            semibold: nil
end

defmodule Moon.Theme.MaxWidth do
  defstruct default: nil,
            large: nil
end

defmodule Moon.Theme.Opacity do
  defstruct disabled: nil
end

defmodule Moon.Theme.Radius do
  defstruct small: nil,
            default: nil,
            largest: nil
end

defmodule Moon.Theme.Space do
  defstruct xsmall: nil,
            small: nil,
            default: nil,
            medium: nil,
            large: nil,
            xlarge: nil
end

defmodule Moon.Theme.TransitionDuration do
  defstruct slow: nil,
            default: nil
end

defmodule Moon.Theme.ZIndex do
  defstruct carousel_control: nil,
            dialog: nil,
            toggle: nil
end

defmodule Moon.Theme.Color do
  defstruct text: nil,
            background: nil,
            krillin_10: nil,
            krillin_100: nil,
            chi_chi_10: nil,
            chi_chi_100: nil,
            roshi_10: nil,
            roshi_100: nil,
            dodoria_10: nil,
            dodoria_100: nil,
            cell_10: nil,
            cell_100: nil,
            raditz_10: nil,
            raditz_100: nil,
            whis_10: nil,
            whis_100: nil,
            frieza_10: nil,
            frieza_100: nil,
            nappa_10: nil,
            nappa_100: nil,
            piccolo_80: nil,
            piccolo_100: nil,
            piccolo_120: nil,
            hit_80: nil,
            hit_100: nil,
            hit_120: nil,
            goten_100: nil,
            goku_10: nil,
            goku_40: nil,
            goku_80: nil,
            goku_100: nil,
            gohan_10: nil,
            gohan_40: nil,
            gohan_80: nil,
            gohan_100: nil,
            beerus_100: nil,
            bulma_100: nil,
            trunks_100: nil
end

defmodule Moon.Theme do
  defstruct id: nil,
            base: %Moon.Theme.Base{},
            border_style: nil,
            border_width: nil,
            border: nil,
            box_shadow: nil,
            breakpoint: %Moon.Theme.Breakpoint{},
            font_face: %Moon.Theme.FontFace{},
            font_family: nil,
            font_size: nil,
            font_weight: nil,
            max_width: %Moon.Theme.MaxWidth{},
            opacity: %Moon.Theme.Opacity{},
            radius: %Moon.Theme.Radius{},
            space: %Moon.Theme.Space{},
            transition_duration: %Moon.Theme.TransitionDuration{},
            z_index: %Moon.Theme.ZIndex{},
            brand: nil,
            color: %Moon.Theme.Color{},
            color_scheme: nil
end
