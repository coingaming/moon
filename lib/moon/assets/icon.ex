defmodule Moon.Assets.Icon do
  @moduledoc """
  This module is deprecated. Please use `Moon.Icon` instead.
  """

  use Moon.StatelessComponent

  import Moon.Helpers.Assets, only: [asset_name_to_filename: 1]

  prop name, :string
  prop color, :string, values: Moon.colors()
  prop background_color, :string, values: Moon.colors()
  prop font_size, :string
  prop click, :event
  prop class, :string

  def render(assigns) do
    ~F"""
    <svg
      class={"moon-icon #{@class} #{@click && "cursor-pointer"}"}
      :on-click={@click}
      style={get_style(color: @color, background_color: @background_color, font_size: @font_size)}
    >
      <use href={"/moon/assets/svgs/icons/#{asset_name_to_filename(@name)}.svg#item"} />
    </svg>
    """
  end
end
