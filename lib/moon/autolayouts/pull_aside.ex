defmodule Moon.Autolayouts.PullAside do
  @moduledoc false

  use Moon.StatelessComponent

  prop(class, :css_class)
  prop(left_grow, :boolean, default: false)
  prop(right_grow, :boolean, default: false)
  slot(left)
  slot(right)

  def render(assigns) do
    ~F"""
    <div class={"flex justify-between", @class}>
      <div class={"flex items-center", grow: @left_grow}>
        {#if slot_assigned?(:left)}
          <#slot {@left} />
        {/if}
      </div>
      <div class={"flex items-center", grow: @right_grow}>
        {#if slot_assigned?(:right)}
          <#slot {@right} />
        {/if}
      </div>
    </div>
    """
  end
end
