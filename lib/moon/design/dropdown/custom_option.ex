defmodule Moon.Design.Dropdown.CustomOption do
  @moduledoc "Single oprion for the dropdown component. Renders as a button"

  use Moon.StatelessComponent, slot: "option"

  alias Moon.Design.Dropdown.Option

  @doc "Data-testid attribute for button"
  prop(testid, :string)
  @doc "Id attribute for buttons"
  prop(id, :string)
  @doc "Title to be shown when no default slot is given"
  prop(title, :string)
  @doc "Additional CSS classes for the button tag"
  prop(class, :css_class)
  @doc "If the button is disabled"
  prop(disabled, :boolean)

  @doc "On click event, in most cases got from context"
  prop(on_click, :event, from_context: :on_click)
  @doc "Value of the option, in most cases got from context"
  prop(value, :any, from_context: :value)
  @doc "If the option is selected, in most cases got from context"
  prop(is_selected, :boolean, from_context: :is_selected)
  @doc "Adds section divider after the option"
  prop(is_last, :boolean, default: false)

  @doc "Inner content of the option"
  slot(default)

  def render(assigns) do
    ~F"""
    <Option
      {=@id}
      {=@on_click}
      {=@value}
      {=@disabled}
      {=@is_selected}
      size="lg"
      class={merge([
        [
          "px-4 gap-3 rounded-none",
          "border-b border-beerus": @is_last
        ],
        @class
      ])}
      {=@testid}
    >
      <#slot>{@title}</#slot>
    </Option>
    """
  end
end
