defmodule Moon.Design.Dropdown.Link do
  @moduledoc "Single option for the dropdown component. Renders as a link"

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
  @doc "Value of the option, in most cases got from context"
  prop(value, :any, from_context: :value)
  @doc "If the option is selected, in most cases got from context"
  prop(is_selected, :boolean, from_context: :is_selected)
  @doc "Text size & paddings for the option. Is set by Dropdown.Options in most cases"
  prop(size, :string, values!: ~w(sm md lg), from_context: :size)
  @doc "Href for the option"
  prop(href, :string)
  @doc "Target attribute for the option"
  prop(target, :string)
  @doc "Rel attribute for the option"
  prop(rel, :string)

  @doc "Inner content of the option"
  slot(default)

  def render(assigns) do
    ~F"""
    <a
      {=@id}
      {=@value}
      role="option"
      {=@disabled}
      class={merge([
        [
          "bg-transparent text-moon-14 text-bulma whitespace-nowrap flex",
          "focus:outline-none focus:shadow-focus cursor-pointer hover:bg-heles transition w-full",
          "bg-heles": @is_selected,
          "opacity-60 cursor-not-allowed": @disabled,
          "h-12 p-3 rounded-moon-i-sm": @size == "lg",
          "h-8 py-1 px-2 rounded-moon-i-xs": @size == "sm",
          "h-10 py-2 px-3 rounded-moon-i-sm": @size == "md"
        ],
        @class
      ])}
      data-testid={@testid}
      {=@href}
      {=@target}
      {=@rel}
    >
      <#slot>{@title}</#slot>
    </a>
    """
  end
end
