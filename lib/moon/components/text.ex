defmodule Moon.Components.Text do
  @moduledoc false

  use Moon.StatelessComponent

  prop(size, :integer)
  prop(is_bold, :boolean)
  prop(color, :string)
  prop(class, :string)
  prop(style, :string)
  slot(default)

  def render(assigns) do
    ~F"""
    <div
      class={
        "#{@class}",
        "text-xs leading-4": @size == 10,
        "text-sm leading-4": @size == 12,
        "text-sm leading-5": @size == 14,
        "text-base leading-6": @size == 16,
        "text-lg leading-7": @size == 18,
        "text-xl leading-7": @size == 20,
        "text-2xl leading-8": @size == 24,
        "text-3xl leading-10": @size == 32,
        "text-4xl leading-10": @size == 48,
        "text-5xl leading-10": @size == 56,
        "text-6xl leading-10": @size == 64,
        "text-7xl leading-10": @size == 72,
        "font-semibold": @is_bold == true
      }
      style={get_style(@style, color: @color)}
    >
      <#slot />
    </div>
    """
  end
end
