defmodule MoonWeb.Components.Badges.RTLSupport do
  @moduledoc false

  use MoonWeb, :stateless_component

  alias Moon.Components.Badges

  def render(assigns) do
    ~F"""
    <Badges title="RTL" color="text-goten" background_color="bg-whis" />
    """
  end
end
