defmodule MoonWeb.Components.Badges.AriaSupport do
  @moduledoc false

  use MoonWeb, :stateless_component

  alias Moon.Components.Badges

  def render(assigns) do
    ~F"""
    <Badges title="ARIA" color="text-goten" background_color="bg-nappa" />
    """
  end
end
