defmodule Moon.Components.Button do
  use Moon.StatelessComponent
  use Moon.Components.Context

  import Moon.Utils.Rem
  alias Moon.Theme

  prop(href, :string)

  prop(variant, :string,
    default: "default",
    values: ["primary", "secondary", "tertiary", "highlight", "default"]
  )

  prop(on_click, :string)

  prop(size, :string, default: "small", values: ["xsmall", "small", "medium", "large"])
  prop(mock_state, :string, values: ["active", "focus", "hover"])
  prop(full_width, :boolean)
  prop(progress, :boolean)
  prop(oops, :boolean)
  prop(success, :boolean)
  prop(pulse, :boolean)
  prop(disabled, :boolean)

  prop(to, :string)
  prop(as, :string)
  prop(active_class_name, :string)
  prop(active_style, :string)
  prop(exact, :boolean)
  prop(string, :boolean)
  prop(is_active, :boolean)
  prop(location, :string)

  prop(style, :string)

  def style(
        %Theme{
          radius: %Theme.Radius{} = radius,
          color: %Theme.Color{} = color,
          font_weight: %Theme.FontWeight{} = font_weight
        } = theme
      ) do
    hover = "&:hover, &.is-hover"
    active = "&:active, &:focus, &.is-active, &.is-focus"

    %{
      display: "inline-block",
      min_height: rem(24),
      font_family: "inherit",
      font_weight: font_weight.semibold,
      text_decoration: "none",
      cursor: "pointer",
      border: theme.border,
      border_color: "transparent",
      border_radius: rem(radius.largest),
      transition: "background-color #{theme.transition_duration.default}s",
      white_space: "nowrap",
      #
      "&[data-full-width=true]": %{
        width: "100%",
        position: "relative"
      },
      #
      "&[data-variant=?]": %{
        primary: %{
          :color => color.goten_100,
          :background_color => color.piccolo_100,
          hover => %{
            background_color: color.piccolo_80
          },
          active => %{
            background_color: color.piccolo_120,
            outline: "none"
          }
        },
        secondary: %{
          :color => color.bulma_100,
          :background_color => color.hit_100,
          hover => %{
            background_color: color.hit_80
          },
          active => %{
            background_color: color.hit_120,
            outline: "none"
          }
        },
        tertiary: %{
          :color => color.bulma_100,
          :background_color => "transparent",
          :border => "1px solid #{color.bulma_100}",
          hover => %{
            background_color: color.hit_80
          },
          active => %{
            background_color: color.hit_120,
            outline: "none"
          }
        },
        highlight: %{
          :color => color.goten_100,
          :background_color => color.whis_100,
          hover => %{
            opacity: 0.9
          },
          active => %{
            opacity: 0.8,
            outline: "none"
          }
        },
        default: %{
          :color => color.bulma_100,
          :background => "none",
          hover => %{
            color: color.bulma_100
          },
          active => %{
            color: color.bulma_100,
            outline: "none"
          }
        }
      },
      #
      "&[data-size=?]": %{
        xsmall: %{
          font_size: rem(12),
          line_height: rem(16),
          height: rem(32),
          padding: "0 #{rem(16)}"
        },
        small: %{
          font_size: rem(14),
          line_height: rem(20),
          height: rem(40),
          padding: "0 #{rem(20)}"
        },
        medium: %{
          font_size: rem(16),
          line_height: rem(24),
          height: rem(48),
          padding: "0 #{rem(24)}"
        },
        large: %{
          font_size: rem(18),
          line_height: rem(24),
          height: rem(56),
          padding: "0 #{rem(32)}"
        }
      }
    }
  end

  def render(assigns) do
    class_name = "moon-button"

    ~H"""
    <Context get={{ theme: theme }}>
      <style>
        {{ style(theme) |> get_css_for_map(".#{class_name}") }}
      </style>

      <button class="{{ class_name }}" data-mock-state={{ @mock_state }} data-variant={{ @variant }} data-size={{ @size }} phx-click={{ @on_click }}>
        <slot />
      </button>
    </Context>
    """
  end
end
