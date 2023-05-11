defmodule Moon.UIPattern.Visibility.OnlyMobile do
  @moduledoc false

  use Moon.StatelessComponent
  prop is_mobile, :boolean, from_context: :is_mobile
  prop class, :css_class
  slot default

  def render(assigns) do
    ~F"""
    <div class={@class} :if={@is_mobile}>
      <#slot />
    </div>
    """
  end
end
