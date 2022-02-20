defmodule Moon.Autolayouts.PullAside do
  @moduledoc false

  use Moon.StatelessComponent

  prop class, :css_class
  slot left
  slot right

  def render(assigns) do
    ~F"""
    <div class={"flex justify-between", @class}>
      <div>
        {#if slot_assigned?(:left)}
          <#slot name="left" />
        {/if}
      </div>
      <div>
        {#if slot_assigned?(:right)}
          <#slot name="right" />
        {/if}
      </div>
    </div>
    """
  end
end
