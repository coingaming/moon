defmodule Moon.Icon do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Helpers.Icons

  prop(name, :string, required: true, values: Icons.list_all())
  prop(color, :string, values: Moon.colors())
  prop(background_color, :string, values: Moon.colors())
  prop(font_size, :string)
  prop(click, :event)
  prop(class, :string)

  def render(assigns) do
    ~F"""
    <svg
      class={"moon-icon #{@class}", "cursor-pointer": @click}
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
