defmodule Moon.Autolayouts.Sections do
  @moduledoc false

  use Moon.StatelessComponent

  slot(default)
  prop(class, :string, default: nil)

  def render(assigns) do
    ~F"""
    <div class={"shrink-0 flex flex-col gap-4 #{@class}"}>
      <#slot />
    </div>
    """
  end
end
