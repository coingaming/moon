defmodule Moon.Autolayouts.Sections do
  use Moon.StatelessComponent

  slot(default)
  prop(class, :string, default: nil)

  def render(assigns) do
    ~F"""
    <div class={"flex gap-4 flex-col #{@class}"}>
      <#slot />
    </div>
    """
  end
end
