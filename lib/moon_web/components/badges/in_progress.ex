defmodule MoonWeb.Components.Badges.InProgress do
  @moduledoc false

  use MoonWeb, :stateless_component

  alias Moon.Components.Badges

  def render(assigns) do
    ~F"""
    <Badges title="In progress" color="text-popo" background_color="bg-krillin-60" />
    """
  end
end
