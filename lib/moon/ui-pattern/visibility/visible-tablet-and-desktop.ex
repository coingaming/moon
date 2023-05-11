defmodule Moon.UIPattern.Visibility.VisibleTabletAndDesktop do
  @moduledoc false

  use Moon.StatelessComponent
  prop is_mobile, :boolean, from_context: :is_mobile
  slot default

  def render(assigns) do
    ~F"""
    <div class={class()}>
      <#slot />
    </div>
    """
  end

  def class do
    "hidden lg:block"
  end
end
