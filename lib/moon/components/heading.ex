defmodule Moon.Components.Heading do
  @moduledoc false

  use Moon.StatelessComponent

  prop(id, :string)
  prop(size, :integer)
  prop(is_regular, :boolean)
  prop(color, :string)
  prop(class, :string)
  slot(default)

  def render(assigns) do
    ~F"""
    <div
      id={@id}
      class={
        "text-bulma-100 #{@class}",
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
        "font-semibold": !@is_regular,
        "font-normal": @is_regular == true
      }
      style={get_style(color: @color)}
    >
      <#slot />
    </div>
    """
  end
end
