defmodule Moon.Design.Dropdown.Option do
  @moduledoc false

  use Moon.StatelessComponent, slot: "option"

  prop(title, :string)
  prop(class, :css_class)
  prop(disabled, :boolean)

  prop(on_click, :event, from_context: :on_click)
  prop(value, :any, from_context: :value)
  prop(is_selected, :boolean, from_context: :is_selected)
  prop(size, :string, values!: ~w(sm md lg), from_context: :size)

  slot(default)

  def render(assigns) do
    ~F"""
    <button
      :on-click={@on_click}
      {=@value}
      {=@disabled}
      class={merge([
        [
          "bg-transparent text-moon-14 text-bulma whitespace-nowrap flex",
          "focus:outline-none focus:shadow-focus cursor-pointer hover:bg-heles transition w-full",
          "bg-bulma/[0.04]": @is_selected,
          "opacity-30 cursor-not-allowed": @disabled,
          "h-12 p-3 rounded-moon-i-sm": @size == "lg",
          "h-8 py-1 px-2 rounded-moon-i-xs": @size == "sm",
          "h-10 py-2 px-3 rounded-moon-i-sm": @size == "md"
        ],
        @class
      ])}
    >
      <#slot>{@title}</#slot>
    </button>
    """
  end
end
