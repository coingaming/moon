defmodule Moon.Components.Button do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(href, :string)

  prop(variant, :string,
    default: "default",
    values: ["primary", "secondary", "tertiary", "highlight", "default"]
  )

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

  def get_size_css(%{size: size, variant: variant}, _theme) do
    case size do
      "xsmall" ->
        %{
          font_size: get_rem(12),
          line_height: get_rem(16),
          height: (variant == "default" && "") || get_rem(32),
          padding: (variant == "default" && 0) || "0 #{get_rem(16)}"
        }

      "small" ->
        %{
          font_size: get_rem(14),
          line_height: get_rem(20),
          height: (variant == "default" && "") || get_rem(40),
          padding: (variant == "default" && 0) || "0 #{get_rem(20)}"
        }

      "medium" ->
        %{
          font_size: get_rem(16),
          line_height: get_rem(24),
          height: (variant == "default" && "") || get_rem(48),
          padding: (variant == "default" && 0) || "0 #{get_rem(24)}"
        }

      "large" ->
        %{
          font_size: get_rem(18),
          line_height: get_rem(24),
          height: (variant == "default" && "") || get_rem(56),
          padding: (variant == "default" && 0) || "0 #{get_rem(32)}"
        }
    end
  end

  def get_variant_css(%{variant: variant}, %{color: color}) do
    hover = "&:hover, &.is-hover"
    active = "&:active, &:focus, &.is-active, &.is-focus"

    case variant do
      "primary" ->
        %{
          :color => color.goten_100,
          :background_color => color.piccolo_100,
          hover => %{
            background_color: color.piccolo_80
          },
          active => %{
            background_color: color.piccolo_120,
            outline: "none"
          }
        }

      "secondary" ->
        %{
          :color => color.bulma_100,
          :background_color => color.hit_100,
          hover => %{
            background_color: color.piccolo_80
          },
          active => %{
            background_color: color.piccolo_120,
            outline: "none"
          }
        }

      "tertiary" ->
        %{
          :color => color.bulma_100,
          :background_color => "transparent",
          :border => "1px solid #{color.bulma_100}",
          hover => %{
            background_color: color.hit_80
          },
          active => %{
            background_color: color.piccolo_120,
            outline: "none"
          }
        }

      "highlight" ->
        %{
          :color => color.goten_100,
          :background_color => color.whis_100,
          hover => %{
            opacity: 0.9
          },
          active => %{
            opacity: 0.8,
            outline: "none"
          }
        }

      "default" ->
        %{
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
    end
  end

  def get_css_maps(assigns, theme) do
    size_css_map = get_size_css(assigns, theme)
    variant_css_map = get_variant_css(assigns, theme)
    [size_css_map, variant_css_map]
  end

  def render(assigns) do
    class_name =
      get_class_name(
        "components-button-#{assigns.variant}-#{assigns.size}-#{assigns.style}-#{
          assigns.full_width
        }"
      )

    ~H"""
    <Context get={{ theme: theme }}>
      <style>
        .{{ class_name }} {
          display: inline-block;
          {{ @full_width && "width: 100%;" || "" }}
          min-height: {{ get_rem(24) }};
          font-family: inherit;
          font-weight: {{ theme.font_weight.semibold }};
          text-decoration: none;
          curson: pointer;
          border: {{ theme.border }};
          border-color: transparent;
          border-radius: {{ get_rem(theme.radius.largest) }};
          transition: background-color {{ theme.transition_duration.default }}s;
          white-space: nowrap;

          {{ @full_width && "position: relative" || "" }}
          {{ @style }}
        }

        {{ get_css_maps(assigns, theme) |> get_css_for_maps(".#{class_name}") }}
      </style>

      <button class="{{ class_name }} {{ @mock_state && "is-#{@mock_state}" }}">
        <slot />
      </button>
    </Context>
    """
  end
end
