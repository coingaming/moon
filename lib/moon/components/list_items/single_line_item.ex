defmodule Moon.Components.ListItems.SingleLineItem do
  @moduledoc false

  use Moon.StatelessComponent

  prop size, :string, values: ~w(medium large), default: "medium"
  prop background_color, :string, values: Moon.colors(), default: "gohan-100"
  prop active_background_color, :string, values: Moon.colors(), default: "primary-hover"
  prop current, :boolean, default: false
  prop left_grow, :boolean, default: false
  prop right_grow, :boolean, default: false

  slot default
  slot left_icon
  slot right_icon

  def render(assigns) do
    ~F"""
    <div class={
      "relative rounded-moon-s-sm bg-#{@background_color} text-moon-14 text-bulma-100 leading-6 cursor-pointer hover:#{@active_background_color} flex gap-4 p-4",
      "py-2": @size == "medium",
      "py-3": @size == "large",
      "bg-#{@active_background_color}": @current
    }>
      <div class={"flex items-center", grow: @left_grow} :if={slot_assigned?(:left_icon)}>
        <#slot name="left_icon" />
      </div>
      <div class="grow">
        <#slot />
      </div>
      <div class={"flex items-center", grow: @right_grow} :if={slot_assigned?(:right_icon)}>
        <#slot name="right_icon" />
      </div>
    </div>
    """
  end
end
