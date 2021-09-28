defmodule Moon.Autolayouts.ButtonsList do
  @moduledoc false

  use Moon.StatelessComponent

  slot default
  prop class, :string

  def render(assigns) do
    ~F"""
    <div class={"flex gap-2 relative z-10 max-w-full flex-wrap #{@class}"}>
      <#slot />
    </div>
    """
  end
end
