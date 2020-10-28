defmodule Moon.Components.Checkbox do
  use Moon.StatelessComponent

  import Moon.Utils.Rem

  def style(
        %{color: color, background_color: background_color, size: size},
        %Moon.Theme{} = theme
      ) do
    [
      %{
        display: "inline-flex",
        font_weight: theme.font_weight.semibold,
        text_transform: "uppercase",
        border_radius: rem(theme.radius.largest),
        letter_spacing: rem(1)
      },
      %{
        padding: "0 #{(size == "small" && rem(8)) || rem(4)}",
        font_size: (size == "small" && rem(10)) || rem(8),
        line_height: (size == "small" && rem(16)) || rem(12)
      },
      %{
        color: get_color(color, theme),
        background_color: get_color(background_color, theme)
      }
    ]
  end

  def render(assigns) do
    class_name =
      get_class_name(
        "components-checkbox-#{assigns.color}-#{assigns.background_color}-#{assigns.size}"
      )

    ~H"""
    <Context get={{ theme: theme }}>
      <style>
        {{ raw (style(assigns, theme) |> get_css_for_maps(".#{class_name}")) }}
      </style>

      <span class={{ class_name }}>
        <slot />
      </span>
    </Context>
    """
  end
end
