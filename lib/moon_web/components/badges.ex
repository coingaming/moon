defmodule Moon.Components.Badges do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Components.Label

  prop(title, :string)
  prop(color, :string)
  prop(background_color, :string)

  def render(assigns) do
    ~F"""
    <Label
      color={@color}
      background_color={@background_color}
      class="2xs select-none py-0 px-2 text-moon-9-caption uppercase font-medium h-4"
    >{@title}</Label>
    """
  end
end
