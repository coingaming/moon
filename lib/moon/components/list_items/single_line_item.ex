# TODO convert this to the new MenuItem component https://www.figma.com/file/S3q1SkVngbwHuwpxHKCsgtJj/Moon---Components?node-id=344%3A306
defmodule Moon.Components.ListItems.SingleLineItem do
  @moduledoc false

  use Moon.StatelessComponent

  prop(size, :string, values: ~w(md lg xl), default: "md")
  prop(background_color, :string, values: Moon.colors(), default: "bg-gohan")
  prop(active_background_color, :string, values: Moon.colors(), default: "bg-goku")
  prop(current, :boolean, default: false)
  prop(left_grow, :boolean, default: false)
  prop(right_grow, :boolean, default: false)

  slot(default)
  slot(left_icon)
  slot(right_icon)

  def render(assigns) do
    ~F"""
    <div class={
      "relative rounded-moon-i-md text-moon-14 text-bulma leading-6 cursor-pointer flex",
      @background_color,
      "hover:#{@active_background_color}",
      "gap-2 p-2": @size == "md",
      "gap-4 px-4 py-3": @size == "lg",
      "gap-4 p-4": @size == "xl",
      "#{@active_background_color}": @current
    }>
      <div class={"flex items-center", grow: @left_grow} :if={slot_assigned?(:left_icon)}>
        <#slot {@left_icon} />
      </div>
      <div class="grow">
        <#slot />
      </div>
      <div class={"flex items-center", grow: @right_grow} :if={slot_assigned?(:right_icon)}>
        <#slot {@right_icon} />
      </div>
    </div>
    """
  end
end
