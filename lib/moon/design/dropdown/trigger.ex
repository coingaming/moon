defmodule Moon.Design.Dropdown.Trigger do
  @moduledoc "Element that triggers Dropdown component, renders with no HTML tag"

  use Surface.Component, slot: "trigger"

  @doc "Title to be shown when no defaul slot given"
  prop(title, :string)
  @doc "Inner content of the component"
  slot(default)

  def render(assigns) do
    ~F"""
    <#slot>{@title}</#slot>
    """
  end
end
