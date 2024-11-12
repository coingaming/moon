defmodule Moon.Design.Dropdown.Option do
  @moduledoc "Single oprion for the dropdown component. Renders as a button"

  use Moon.StatelessComponent, slot: "option"

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

  @doc "Attribute phx-hook. Used for dependant components"
  prop(hook, :string)
  @doc "On click event, in most cases got from context"
  prop(on_click, :event, from_context: :on_click)
  @doc "Value of the option, in most cases got from context"
  prop(value, :any, from_context: :value)
  @doc "If the option is selected, in most cases got from context"
  prop(is_selected, :boolean, from_context: :is_selected)
  @doc "Text size & paddings for the option. Is set by Dropdown.Options in most cases"
  prop(size, :string, values!: ~w(sm md lg), from_context: :size)
  @doc "Additional values to be passed"
  prop(values, :map, from_context: :values)
  @doc "Inner content of the option"
  slot(default)

  def render(assigns) do
    ~F"""
    <button
      {=@id}
      :on-click={@on_click}
      {=@value}
      :values={@values}
      type="button"
      role="option"
      {=@disabled}
      class={merge([
        [
          "bg-transparent text-moon-14 text-bulma whitespace-nowrap flex",
          "focus:outline-none focus:bg-heles cursor-pointer hover:bg-heles transition w-full",
          "bg-heles": @is_selected,
          "opacity-60 cursor-not-allowed": @disabled,
          "h-12 p-3 rounded-moon-i-sm": @size == "lg",
          "h-8 py-1 px-2 rounded-moon-i-xs": @size == "sm",
          "h-10 py-2 px-3 rounded-moon-i-sm": @size == "md"
        ],
        get_config(:default_class),
        @class
      ])}
      data-testid={@testid}
      phx-hook={@hook}
    >
      <#slot>{@title}</#slot>
    </button>
    """
  end
end
