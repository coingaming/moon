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
  prop value_name, :string, default: "icon_value"
  prop value, :string

  def render(assigns) do
    ~F"""
    <svg
      class={"moon-icon #{@class} #{@click && "cursor-pointer"}"}
      :on-click={@click}
      {...phx_val_tag((@value && @value_name) || nil, @value)}
      style={get_style(color: @color, background_color: @background_color, font_size: @font_size)}
    >
      <use href={"/moon/assets/svgs/icons/#{asset_name_to_filename(@name)}.svg#item"} />
    </svg>
    """
  end

  defp phx_val_tag(nil, _), do: []

  defp phx_val_tag(name, value) do
    # credo:disable-for-next-line Credo.Check.Warning.UnsafeToAtom
    key = String.to_atom("phx-value-#{name}")
    [{key, value}]
  end
end
