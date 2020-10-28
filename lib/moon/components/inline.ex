defmodule Moon.Components.Inline do
  use Moon.StatelessComponent

  import Moon.Utils.Rem

  property(space, :string,
    default: "default",
    values: ["xsmall", "small", "default", "medium", "large", "xlarge"]
  )

  property(font_size, :string)

  def style(%{space: space, font_size: font_size}, theme) do
    space = rem(Map.get(theme.space, :"#{space}"))

    %{
      display: "flex",
      flex_wrap: "wrap",
      overflow: "hidden",
      justify_content: "flex-start",
      align_items: "center",
      margin:
        if is_number(space) do
          space / 2 * -1
        else
          "calc(#{space} / 2 * -1)"
        end,
      "& > *": %{
        margin:
          if is_number(space) do
            space / 2
          else
            "calc(#{space} / 2)"
          end
      },
      "& > li": style_list_item_style_type_none(),
      font_size: font_size
    }
  end

  def style_list_item_style_type_none do
    %{
      list_style_type: "none",
      "&:before": %{
        position: "absolute",
        content: "\"\\200B\""
      }
    }
  end

  def render(assigns) do
    class_name = get_class_name("components-inline-#{assigns.space}")

    ~H"""
    <Context get={{ theme: theme }}>
      <div class={{ class_name }}>
        <style>
          {{ raw (style(assigns, theme) |> get_css_for_map(".#{class_name}")) }}
        </style>

        <slot />
      </div>
    </Context>
    """
  end
end
