defmodule Moon.Design.Dropdown.Trigger do
  @moduledoc "Element that triggers Dropdown component, renders with no HTML tag"

  use Moon.StatelessComponent, slot: "trigger"

  @doc "Title to be shown when no defaul slot given"
  prop(title, :string)
  @doc "If the trigger is open. Should be taken from context"
  prop(is_open, :boolean, from_context: :is_open)
  @doc "Event that fired when trigger is clicked"
  prop(on_click, :event, from_context: :on_trigger)
  @doc "Data-testid attribute for HTML tag"
  prop(testid, :string)
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "If the item should be marked as disabled"
  prop(disabled, :boolean, from_context: :disabled)

  @doc "Inner content of the component"
  slot(default)

  def render(assigns) do
    ~F"""
    <div
      :on-click={(!@disabled && @on_click) || nil}
      data-testid={@testid}
      aria-haspopup="true"
      aria-expanded={@is_open}
      class={merge([["cursor-pointer": !@disabled], @class])}
    >
      <#slot>{@title}</#slot>
    </div>
    """
  end
end
