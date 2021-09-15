defmodule Moon.Autolayouts.LeftToRight do
  use Moon.StatelessComponent

  slot default
  prop class, :string, default: nil
  prop gap, :any, default: 2

  def render(assigns) do
    ~F"""
    <div class={"flex justify-around items-center w-full gap-#{@gap} #{@class}"}>
      <#slot />
    </div>
    """
  end
end
