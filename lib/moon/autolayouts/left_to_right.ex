defmodule Moon.Autolayouts.LeftToRight do
  @moduledoc false

  use Moon.StatelessComponent

  slot default
  prop class, :string, default: nil
  prop gap, :any, default: "gap-2"
  prop centered, :boolean, default: false

  def render(assigns) do
    ~F"""
    <div class={"flex gap-#{@gap} #{@gap} #{@class}", "items-center": @centered}>
      <#slot />
    </div>
    """
  end
end
