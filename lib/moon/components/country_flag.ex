defmodule Moon.CountryFlag do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Helpers.CountryFlags

  prop(name, :string, required: true, values: CountryFlags.list_all())
  prop(color, :string, values: Moon.colors())
  prop(background_color, :string, values: Moon.colors())
  prop(font_size, :string)
  prop(click, :event)
  prop(class, :string)

  def render(assigns) do
    ~F"""
    <img
      class={"moon-country-flag", @class, "cursor-pointer": @click}
      :on-click={@click}
      style={get_style(color: @color, background_color: @background_color, font_size: @font_size)}
      src={"/moon_icons/svgs/country_flags/#{country_flag_name_to_filename(@name)}.svg"}
    />
    """
  end

  defp country_flag_name_to_filename(name) do
    name
    |> to_string()
    |> String.replace("_", "-")
  end
end
