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
        "text-moon-10": @size == 10,
        "text-moon-12": @size == 12,
        "text-moon-14": @size == 14,
        "text-moon-16": @size == 16,
        "text-moon-18": @size == 18,
        "text-moon-20": @size == 20,
        "text-moon-24": @size == 24,
        "text-moon-32": @size == 32,
        "text-moon-48": @size == 48,
        "text-moon-56": @size == 56,
        "text-moon-64": @size == 64,
        "text-moon-72": @size == 72,
        "font-semibold": @is_bold == true
      }
      style={get_style(@style, color: @color)}
    >
      <#slot />
    </div>
    """
  end
end
