defmodule Moon.Design.Form do
  @moduledoc false

  use Moon.StatelessComponent

  slot(default, required: true)
  slot(trigger, required: true)

  def render(assigns) do
    ~F"""
    Under construction
    """
  end
end
