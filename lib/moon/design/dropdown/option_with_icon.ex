defmodule Moon.Design.Dropdown.IconOption do
  @moduledoc "Single oprion for the dropdown component. Renders as a button"

  use Moon.StatelessComponent, slot: "option"

  alias Moon.Design.Dropdown.Option
  alias Moon.Icon

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
  prop(has_bottom_divider, :boolean, default: false)
  @doc "Additional values to be passed"
  prop(values, :map, from_context: :values)

  @doc "Inner content of the option"
  slot(default)

  def render(assigns) do
    ~F"""
    <Option
      {=@id}
      {=@on_click}
      value={@value.name}
      {=@disabled}
      {=@is_selected}
      values={@values}
      size="lg"
      class={merge([
        [
          "px-4 gap-3 rounded-none",
          "border-b border-beerus": @has_bottom_divider
        ],
        @class
      ])}
      {=@testid}
    >
      <Icon name={@value.icon} class="text-moon-24" />
      {@value.name}
    </Option>
    """
  end
end
