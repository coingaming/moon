defmodule Moon.Components.Avatar do
  use Moon.StatelessComponent

  alias Moon.Assets.Icons.IconUser

  import Moon.Utils.Rem

  prop(image_url, :string)
  prop(name, :string)
  prop(color, :string)
  prop(background_color, :string)
  prop(size, :string, default: "medium", values: ["xsmall", "small", "medium", "large"])

  def style(
        %{size: size, image_url: image_url, color: color, background_color: background_color},
        theme
      ) do
    [
      %{
        color: get_color(color, theme),
        background_color: get_color(background_color, theme),
        border_radius: "50%",
        overflow: "hidden",
        text_transform: "uppercase",
        font_weight: theme.font_weight.semibold,
        display: "flex",
        align_items: "center",
        justify_content: "center",
        background_image: "url(#{image_url})",
        background_size: "cover"
      },
      size == "xsmall" &&
        %{
          height: rem(24),
          width: rem(24),
          font_size: rem(14)
        },
      size == "small" &&
        %{
          height: rem(32),
          width: rem(32),
          font_size: rem(18)
        },
      size == "medium" &&
        %{
          height: rem(40),
          width: rem(40),
          font_size: rem(20)
        },
      size == "large" &&
        %{
          height: rem(48),
          width: rem(48),
          font_size: rem(24)
        }
    ]
  end

  def render(assigns) do
    class_name =
      get_class_name(
        "avatar-#{assigns.size}-#{assigns.image_url}-#{assigns.color}-#{assigns.background_color}"
      )

    ~H"""
    <Context get={{ theme: theme }}>
      <style>
        {{ style(assigns, theme) |> get_css_for_maps(".#{class_name}") }}
      </style>

      <div class={{ class_name }}>
        <span :if={{ @name && !@image_url }}>{{ @name }}</span>
        <IconUser color={{ @color }} :if={{ !@name && !@image_url }}/>
      </div>
    </Context>
    """
  end
end
