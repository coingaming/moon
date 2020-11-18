defmodule Moon.Components.Switch do
  use Moon.StatelessComponent

  prop(on_click, :string)
  prop(left_label, :string)
  prop(left_value, :string)
  prop(right_label, :string)
  prop(right_value, :string)
  prop(value, :string)

  def render(assigns) do
    ~H"""
    Not implemented
    """
  end
end
