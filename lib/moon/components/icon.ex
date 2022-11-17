defmodule Moon.Icon do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Helpers.Icons

  prop(click, :event)
  prop(class, :css_class)

  # All the other props below are deprecated!
  # Please use only tailwind classes and the class prop
  prop(name, :string, required: true, values: Icons.list_all())
  prop(color, :string, values: Moon.colors())
  prop(background_color, :string, values: Moon.colors())
  prop(font_size, :string)

  def render(assigns) do
    ~F"""
    <svg
      class={
        "moon-icon",
        @class,
        "text-#{@color}": @color,
        "bg-#{@background_color}": @background_color,
        "text-#{@font_size}": @font_size,
        "cursor-pointer": @click
      }
      :on-click={@click}
      style={get_style(color: @color, background_color: @background_color, font_size: @font_size)}
    >
      <use href={"/moon/assets/svgs/icons_new/#{icon_name_to_filename(@name)}.svg#item"} />
    </svg>
    """
  end

  defp icon_name_to_filename(name) do
    name
    |> to_string()
    |> String.replace("_", "-")
  end
end
