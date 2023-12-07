defmodule Moon.Light do
  @moduledoc false
  use Moon.Light.Component

  attr(:click, :any)
  attr(:class, :any, doc: "Additional classes for the <svg> tag")
  attr(:name, :string, required: true, values: MoonIcons.Helpers.Icons.list_all())
  attr(:color, :string, values: Moon.colors())
  attr(:background_color, :string, values: Moon.colors())
  attr(:font_size, :string)
  attr(:id, :string, doc: "Id HTML attribute")
  attr(:testid, :string, doc: "Data-testid attribute value")

  def icon(assigns) do
    ~H"""
    <svg
      id={@id}
      data-testid={@testid}
      class={
        merge([
          "moon-icon fill-none",
          [
            {:"text-#{@color}", @color},
            {:"bg-#{@background_color}", @background_color},
            {:"text-#{@font_size}", @font_size},
            "cursor-pointer": @click
          ],
          @class
        ])
      }
      phx-on-click={@click}
      style={get_style(color: @color, background_color: @background_color, font_size: @font_size)}
    >
      <use href={"/moon_icons/svgs/icons_new/#{@name |> to_string() |> String.replace("_", "-")}.svg#item"} />
    </svg>
    """
  end
end
