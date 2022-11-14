defmodule Moon.Components.MenuItem.Switch do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Icons.{
    ControlsChevronDown,
    ControlsChevronUp
  }

  prop(is_selected, :boolean, from_context: {Moon.Components.MenuItem, :is_selected})

  def render(assigns) do
    ~F"""
    <span>
      <ControlsChevronDown :if={!@is_selected} />
      <ControlsChevronUp :if={@is_selected} />
    </span>
    """
  end
end
