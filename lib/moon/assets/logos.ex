defmodule Moon.Assets.Logos do
  use Moon.StatelessComponent

  alias Moon.Assets.Logos

  property name, :string
  property color, :string
  property background_color, :string

  def icon_name_to_module(icon_name) do
    %{
      sportsbet_sponsor: Logos.LogoSportsbetSponsor,
      sportsbet: Logos.LogoSportsbet
    }[:"#{icon_name}"]
  end

  def render(assigns) do
    ~H"""
    {{ @name && live_component(@socket, icon_name_to_module(@name), color: @color, background_color: @background_color) }}
    """
  end
end
