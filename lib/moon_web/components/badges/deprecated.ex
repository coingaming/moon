defmodule MoonWeb.Components.Badges.Deprecated do
  @moduledoc false

  use MoonWeb, :stateless_component

  alias Moon.Components.Badges

  def render(assigns) do
    ~F"""
    <Badges title="Deprecated" color="text-popo" background_color="bg-chiChi-60" />
    """
  end
end
