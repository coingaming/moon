defmodule Moon.UIPattern.Visibility.VisibleMobile do
  @moduledoc false

  use Moon.StatelessComponent
  slot default

  def render(assigns) do
    ~F"""
    <div class={class()}>
      <#slot />
    </div>
    """
  end

  def class do
    "lg:hidden"
  end
end
