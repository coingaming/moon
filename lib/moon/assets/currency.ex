defmodule Moon.Assets.Currency do
  @moduledoc false

  use Moon.StatelessComponent

  import Moon.Helpers.Assets, only: [asset_name_to_filename: 1]

  prop name, :string

  prop color, :string, values: Moon.colors()
  prop height, :string
  prop width, :string
  prop font_size, :string
  prop vertical_align, :string
  prop click, :event
  prop class, :string

  def render(assigns) do
    ~F"""
    <svg
      class={"moon-pattern #{@class} #{@click && "cursor-pointer"}"}
      :on-click={@click}
      style={get_style(
        color: @color,
        height: @height,
        width: @width,
        font_size: @font_size,
        vertical_align: @vertical_align
      )}
    >
      <use href={"/moon/assets/svgs/patterns/#{asset_name_to_filename(@name)}.svg#item"} />
    </svg>
    """
  end
end
