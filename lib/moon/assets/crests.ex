defmodule Moon.Assets.Crests do
  use Moon.StatelessComponent

  alias Moon.Assets.Crests

  property name, :string
  property color, :string
  property background_color, :string

  def icon_name_to_module(icon_name) do
    %{
      arsenal: Crests.CrestArsenal,
      flamengo: Crests.CrestFlamengo,
      southampton: Crests.CrestSouthampton,
      watford: Crests.CrestWatford
    }[:"#{icon_name}"]
  end

  def render(assigns) do
    ~H"""
    {{ @name && live_component(@socket, icon_name_to_module(@name), color: @color, background_color: @background_color) }}
    """
  end
end
