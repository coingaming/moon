defmodule Moon.Icon do
  @moduledoc false

  use Moon.StatelessComponent
  alias MoonIcons.Helpers.Icons

  prop(click, :event)
  @doc "Additional classes for the <select> tag"
  prop(class, :css_class)

  # All the other props below are deprecated!
  # Please use only tailwind classes and the class prop
  prop(name, :string, required: true, values: Icons.list_all())
  prop(color, :string, values: Moon.colors())
  prop(background_color, :string, values: Moon.colors())
  prop(font_size, :string)
  @doc "Id HTML attribute"
  prop(id, :string)
  @doc "Data-testid attribute value"
  prop(testid, :string)

  def render(assigns) do
    ~F"""
    <svg
      {=@id}
      data-testid={@testid}
      class={merge([
        "moon-icon fill-none",
        [
          "text-#{@color}": @color,
          "bg-#{@background_color}": @background_color,
          "text-#{@font_size}": @font_size,
          "cursor-pointer": @click
        ],
        @class
      ])}
      :on-click={@click}
      style={get_style(color: @color, background_color: @background_color, font_size: @font_size)}
    >
      <use href={"/moon_icons/svgs/icons_new/#{icon_name_to_filename(@name)}.svg#item"} />
    </svg>
    """
  end

  defp icon_name_to_filename(name) do
    name
    |> to_string()
    |> String.replace("_", "-")
  end
end
