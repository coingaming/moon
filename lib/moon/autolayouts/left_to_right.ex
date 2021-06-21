defmodule Moon.Autolayouts.LeftToRight do
  use Moon.StatelessComponent

  slot(default)
  prop(class, :string, default: nil)

  def render(assigns) do
    ~F"""
    <div class={"flex gap-2 #{@class}"}>
      <#slot />
    </div>
    """
  end
end
