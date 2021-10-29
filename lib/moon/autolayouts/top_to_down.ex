defmodule Moon.Autolayouts.TopToDown do
  @moduledoc false

  use Moon.StatelessComponent

  slot default
  prop class, :string, default: nil
  prop gap, :string, default: "gap-2"

  def render(assigns) do
    ~F"""
    <div class={"flex flex-col #{@gap} #{@class}"}>
      <#slot />
    </div>
    """
  end
end
