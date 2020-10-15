defmodule Moon.Components.Inline do
  use Moon.StatelessComponent

  prop(space, :string)
  prop(font_size, :string)

  def style(%{space: space, font_size: font_size}, theme) do
    %{
      display: "flex",
      flex_wrap: "wrap",
      overflow: "hidden",
      justify_content: "flex-start",
      align_items: "center",
      margin: space && is_number(space) && (space / 2) * -1 || "calc(${space} / 2 * -1)",
      "& > *": %{
        margin: space && is_number(space) && space / 2 || "calc(${space} / 2)",
      },
      "& > li": style_list_item_style_type_none,
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
      <style>
        .{{ class_name }} {
          {{ raw (style(assigns, theme) |> get_css_for_map(".#{class_name}")) }}
        }
      </style>

      <div class={{ class_name }}>
        <slot />
      </div>
    </Context>
    """
  end
end
