defmodule Moon.Lego.ChevronUpDown do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Icon

  prop(is_selected, :boolean, from_context: :is_selected)
  prop(class, :css_class)

  def render(assigns) do
    ~F"""
    <Icon
      name="controls_chevron_down"
      class={merge([
        [
          "transition-transform transition-200",
          "rotate-180": @is_selected
        ],
        @class
      ])}
    />
    """
  end
end
