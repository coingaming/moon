defmodule Moon.Design.Dropdown.Option do
  @moduledoc "Single oprion for the dropdown component. Renders as a button"

  use Moon.StatelessComponent, slot: "option"

  @doc "data-testid attribute for button"
  prop(testid, :string)
  @doc "id attribute for buttons"
  prop(id, :string)
  @doc "title to be shown when no default slot is given"
  prop(title, :string)
  @doc "additional CSS classes for the button tag"
  prop(class, :css_class)
  @doc "if the button is disabled"
  prop(disabled, :boolean)

  prop(on_click, :event, from_context: :on_click)
  prop(value, :any, from_context: :value)
  prop(is_selected, :boolean, from_context: :is_selected)
  prop(size, :string, values!: ~w(sm md lg), from_context: :size)

  @doc "inner content of the option"
  slot(default)

  def render(assigns) do
    ~F"""
    <button
      {=@id}
      :on-click={@on_click}
      {=@value}
      {=@disabled}
      class={merge([
        [
          "bg-transparent text-moon-14 text-bulma whitespace-nowrap flex",
          "focus:outline-none focus:shadow-focus cursor-pointer hover:bg-heles transition w-full",
          "bg-heles": @is_selected,
          "opacity-30 cursor-not-allowed": @disabled,
          "h-12 p-3 rounded-moon-i-sm": @size == "lg",
          "h-8 py-1 px-2 rounded-moon-i-xs": @size == "sm",
          "h-10 py-2 px-3 rounded-moon-i-sm": @size == "md"
        ],
        @class
      ])}
      data-testid={@testid}
    >
      <#slot>{@title}</#slot>
    </button>
    """
  end
end
