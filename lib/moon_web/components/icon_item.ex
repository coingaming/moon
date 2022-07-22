defmodule MoonWeb.Components.IconItem do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Components.Button

  alias Moon.Icon

  prop name, :string
  prop click, :event
  prop value, :string

  def render(assigns) do
    ~F"""
    <Button variant="ghost" on_click={@click} value={@value} value_name="icon_value">
      <Icon name={@name} font_size="2rem" />
    </Button>
    """
  end
end
