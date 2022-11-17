defmodule Moon.Components.Lego.ChevronUpDown do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Icons.ControlsChevronDown

  prop(is_selected, :boolean, from_context: {Moon.Components.Lego, :is_selected})

  def render(assigns) do
    ~F"""
    <span>
      <ControlsChevronDown class={
        "transition-transform transition-200",
        "rotate-180": @is_selected
      } />
    </span>
    """
  end
end
