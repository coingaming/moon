defmodule Moon.Design.Dropdown.Trigger do
  @moduledoc false

  use Surface.Component, slot: "trigger"

  prop(title, :string)
  slot(default)

  def render(assigns) do
    ~F"""
    <#slot>{@title}</#slot>
    """
  end
end
