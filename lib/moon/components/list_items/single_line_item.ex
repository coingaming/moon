defmodule Moon.Components.ListItems.SingleLineItem do
  @moduledoc false

  use Moon.StatelessComponent

  prop background_color, :string, values: Moon.colors(), default: "bg-gohan-100"
  prop active_background_color, :string, values: Moon.colors(), default: "bg-goku-100"
  prop current, :boolean, default: false
  prop left_grow, :boolean, default: false
  prop right_grow, :boolean, default: false

  slot default
  slot left_icon
  slot right_icon

  def render(assigns) do
    ~F"""
    <div class={
      "relative rounded-moon-i-md text-moon-16 text-bulma-100 leading-6 cursor-pointer flex",
      @background_color,
      "hover:#{@active_background_color}",
      "#{@active_background_color}": @current
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
