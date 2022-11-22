defmodule Moon.Components.Lego.ChevronUpDown do
  @moduledoc false

  use Moon.StatelessComponent

  # TODO
  # Use the original icon after https://github.com/coingaming/moon/pull/450 is merged
  # and class is changed from :string to :css_class
  # alias Moon.Icons.ControlsChevronDown
  alias Moon.Components.Lego.TempControlsChevronDown

  prop(is_selected, :boolean, from_context: {Moon.Components.Lego, :is_selected})

  def render(assigns) do
    ~F"""
    <span>
      <TempControlsChevronDown class={
        "transition-transform transition-200",
        "rotate-180": @is_selected
      } />
    </span>
    """
  end
end
