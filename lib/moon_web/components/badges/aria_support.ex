defmodule MoonWeb.Components.Badges.AriaSupport do
  use MoonWeb, :stateless_component

  alias Moon.Components.Label

  def render(assigns) do
    ~F"""
    <Label
      background_color="bg-nappa"
      color="text-goten"
      class="2xs gap-1 select-none py-0 px-2 text-moon-9-caption uppercase font-medium h-4"
    >ARIA</Label>
    """
  end
end
