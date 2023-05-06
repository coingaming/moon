defmodule Moon.UIPattern.Visibility.TabletAndDesktop do
  @moduledoc false

  use Moon.StatelessComponent
  prop is_mobile, :boolean, from_context: :is_mobile
  slot default

  def render(assigns) do
    ~F"""
    <div class={class()} :if={!@is_mobile}>
      <#slot />
    </div>
    """
  end

  def class do
    # "hidden xl:visible"
  end
end