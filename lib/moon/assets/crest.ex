defmodule Moon.Assets.Crest do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Assets.Crests

  prop name, :string

  prop color, :string, values: Moon.colors()
  prop height, :string
  prop width, :string
  prop font_size, :string
  prop vertical_align, :string
  prop click, :event
  prop class, :string

  @assets_map %{
    crest_arsenal: Crests.CrestArsenal,
    crest_flamengo: Crests.CrestFlamengo,
    crest_sao_paulo: Crests.CrestSaoPaulo,
    crest_southampton: Crests.CrestSouthampton,
    crest_watford: Crests.CrestWatford
  }
  def icon_name_to_module(icon_name) do
    @assets_map[:"#{icon_name}"]
  end

  def render(assigns) do
    ~F"""
    {@name && icon_name_to_module(@name) &&
      live_component(@socket, icon_name_to_module(@name),
        color: @color,
        height: @height,
        width: @width,
        font_size: @font_size,
        vertical_align: @vertical_align,
        click: @click,
        class: @class
      )}
    """
  end
end
